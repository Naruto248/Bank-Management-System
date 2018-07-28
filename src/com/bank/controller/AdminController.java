package com.bank.controller;

import java.security.Principal;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.bank.beans.BankAccount;
import com.bank.beans.Cibil;
import com.bank.beans.Customer;
import com.bank.beans.MyClass;
import com.bank.service.BankService;

@Controller
public class AdminController {
	@Autowired
	private BankService service;
	@Autowired
	private BankAccount ba;
	@Autowired
	private Customer customer;
	@Autowired
	private MyClass myClass;
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/")
	public ModelAndView showIndex(ModelAndView mav, Principal principal) {
		
		mav.setViewName("index");
		//session.setAttribute("username", principal.getName());
		return mav;
	}
	
	@RequestMapping("/AccountCreation")
	public ModelAndView showHome(ModelAndView mav) {
		mav.addObject("customer", customer);
		mav.setViewName("accountCreate");
		return mav;
	}
	
	@RequestMapping("/createCustomer")
	public ModelAndView createCustomer(@ModelAttribute("customer") Customer c,ModelAndView mav) {
		 
		customer = c;
		mav.addObject("customer", customer);
		mav.addObject("ba", ba);

		mav.setViewName("accountCreate1");
		return mav;
	}
	
	@RequestMapping("/login")
	public ModelAndView showLogin(ModelAndView mav) {
		
		mav.setViewName("login");
		return mav;
	}
	
	@RequestMapping("/LoanProcess")
	public ModelAndView showLoan(ModelAndView mav) {
		RestTemplate t = new RestTemplate();
		//username password //secret key
		HttpHeaders header = new HttpHeaders();
		header.set("username", "idbi");
		header.set("password", "12345");
		String url="http://localhost:8080/Bank/rest/cibil/v1/fetch/B1328680";
		Cibil cibil=new Cibil();
		HttpEntity<Cibil> request = new HttpEntity<Cibil>(cibil,header);
		cibil = t.postForObject(url, request, Cibil.class);
		//Cibil b =  t.getForObject("http://localhost:8080/Bank/rest/cibil/v1/fetch/B1328680", Cibil.class);
		mav.addObject("cibil",cibil);
		mav.setViewName("loan");
		return mav;
	}
	
	@RequestMapping("/SearchByAccountNumber")
	public ModelAndView searchByAccountNumber(@ModelAttribute("customer") Customer c, ModelAndView mav ) {
		@SuppressWarnings("unchecked")
		ArrayList<Customer> list = (ArrayList<Customer>)session.getAttribute("list");
		customer = myClass.getCustomerInfo(c, list);
		mav.addObject("customer",customer);
		mav.setViewName("search");
		return mav;
	}
	
	@RequestMapping("/CustomerSearch")
	public ModelAndView showSearch(ModelAndView mav) {
		
		ArrayList<Customer> list = service.getAllCustomers();
		session.setAttribute("list", list);
		mav.setViewName("search");
		customer.setAccountNumber("");
		//go to DB and fetch all customers and save it in list
		
		mav.addObject("customer", customer);
		
		return mav;
	}
	@RequestMapping("/Transaction")
	public ModelAndView showTransaction(ModelAndView mav) {
		mav.setViewName("transaction");
		return mav;
	}
	
	@RequestMapping("/ProcessDeposit")
	public ModelAndView processDeposit(ModelAndView mav,@RequestParam("accountNumber") String accountNumber,@RequestParam("amount") String amount) {
		@SuppressWarnings("unchecked")
		ArrayList<Customer> list = (ArrayList<Customer>)session.getAttribute("list");
		String balance = null;
		for(Customer c: list){
			if(c.getAccountNumber().equals(accountNumber)){
				balance = c.getBalance();
				break;
			}
		}
		service.deposit(accountNumber, balance, amount);
		list = service.getAllCustomers();
		session.setAttribute("list", list);
		mav.addObject("msg", "Deposit Sucessfull");
		mav.setViewName("transaction");
		return mav;
	}
	
	@RequestMapping("/ProcessWithdraw")
	public ModelAndView processWithdraw(ModelAndView mav,
			@RequestParam("accountNumber") String accountNumber,
			@RequestParam("amount") String amount) {
		@SuppressWarnings("unchecked")
		ArrayList<Customer> list = (ArrayList<Customer>)session.getAttribute("list");
		boolean status = ba.processBalance(session.getAttribute("list"),amount, accountNumber);
		if(status) {
			String balance = null;
			for(Customer c: list){
				if(c.getAccountNumber().equals(accountNumber)){
					balance = c.getBalance();
					break;
				}
			}
			service.withdraw(accountNumber, balance, amount);
			list = service.getAllCustomers();
			session.setAttribute("list", list);
			mav.addObject("msg", "Withdrawal Sucessfull");
		}
		else {
			mav.addObject("msg", "Withdrawal UnSucessfull - amount should be less than balance and min balance criteria");	
		}
		mav.setViewName("transaction");
		return mav;
	}
	
	@RequestMapping("/AccountCreated")
	public ModelAndView accountCreated() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		mav.addObject("msg", "Account for Customer Created");
		mav.addObject("customer", customer);
		return mav;
	}
	
	@RequestMapping("/createCustomerAccount")
	public String createAccount(@ModelAttribute("ba") BankAccount ba, Model model) {
		
		if(ba.getType().equals("savings")) {
			ba.setMinBalance("1000");
			ba.setInterestRate("6.0");
			ba.setOverdraft("0");
			customer.setBa(ba);
		}
		if(ba.getType().equals("current")) {
			ba.setMinBalance("5000");
			ba.setInterestRate("0.0");
			ba.setOverdraft("5000");
			customer.setBa(ba);
		}
		
		customer.setAccountNumber(ba.getAccountNo(customer.getPanNumber()));
		service.insertCustomerDetails(customer);
		
		
		return "redirect:/AccountCreated";
	}
	
}




