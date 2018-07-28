package com.bank.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bank.beans.Cibil;

@RequestMapping("rest/cibil/v1")
@org.springframework.web.bind.annotation.RestController
public class RestController {

	@Autowired
	BankService service;
	
	@RequestMapping(path="/fetch/{panNumber}",method=RequestMethod.POST ,produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Cibil showCibil(@PathVariable("panNumber") String panNumber,@RequestHeader("username")String username,@RequestHeader("password")String password) {
		//boolean status = service.checkPanNumber(panNumber);
		Cibil cibil = new Cibil();
		cibil.setStatus(true);
		cibil.setScore("8.8");
		
		
		
		return cibil;
	}
	
	public boolean check(String panNumber) {
		
		return false;
	}
}
