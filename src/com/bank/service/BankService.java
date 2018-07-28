package com.bank.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.bank.beans.Acc;
import com.bank.beans.Customer;
import com.bank.model.Account;

@Component
public class BankService {

	@Autowired
	private Account account = new Account();

	public void insertCustomerDetails(Customer customer) {
		//credit check call api
		account.insertCustomerDetails(customer);
	}

	public ArrayList<Customer> getAllCustomers() {
		ArrayList<Customer> list =(ArrayList<Customer>) account.getAllCustmers();
		return list;
	}

	public boolean checkPanNumber(String panNumber) {
		boolean status = account.checkPanNumber(panNumber);
		return status;
	}

	public void deposit(String accountNumber, String balance, String amount) {
		int bal = Integer.parseInt(balance);
		int amo = Integer.parseInt(amount);
		account.deposit(accountNumber, bal, amo);
	}

	public void withdraw(String accountNumber, String balance, String amount) {
		int bal = Integer.parseInt(balance);
		int amo = Integer.parseInt(amount);
		account.withdraw(accountNumber, bal, amo);
	}

	public void insertAcc(Acc acc) {
		account.insertAcc(acc);
		
	}
	
}













