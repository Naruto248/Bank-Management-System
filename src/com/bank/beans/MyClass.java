package com.bank.beans;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MyClass {
	@Autowired
	private Customer c2;
	public Customer getCustomerInfo(Customer c,ArrayList<Customer> list) {
		System.out.print(list);
		for( Customer c1:list) {
			if(c1.getAccountNumber().equals(c.getAccountNumber())) {
				c2=c1;
			}
		}
		return c2;
	}
}
