package com.bank.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bank.beans.Acc;
import com.bank.model.Account;

@Controller
@RequestMapping("/cms")
public class CMSController {
	@Autowired
	private Acc acc;
	@Autowired
	private Account account;
	
	@RequestMapping("/")
	public String showDashboard() {
		return "cms/dashboard";
	}

	@RequestMapping(value = "/CreateAccount", method = RequestMethod.POST)
	public String CreateAccount(@ModelAttribute("acc") Acc acc) {
		account.insertAcc(acc);
		return "cms/createAccount";
	}

	@RequestMapping("/CreateAccount")
	public ModelAndView createAccount(ModelAndView mav) {
		mav.addObject("acc", acc);
		mav.setViewName("cms/createAccount");
		return mav;
	}

	@RequestMapping("/ToggleAccount")
	public ModelAndView toggleAccount(ModelAndView mav) {
		ArrayList<Acc> al = (ArrayList<Acc>)account.getAllAcc();
		mav.addObject("al", al);
		mav.setViewName("cms/toggleAccount");
		return mav;
	}
	
	@RequestMapping("/ToggleAccount/edit")
	public ModelAndView enableDisable(ModelAndView mav, @RequestParam String username, @RequestParam String enable) {
		System.out.print(username);
		account.enableDisable(username, enable);
		mav.setViewName("redirect:/cms/ToggleAccount");
		return mav;
	}
}
