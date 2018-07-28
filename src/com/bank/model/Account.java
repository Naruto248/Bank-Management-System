package com.bank.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import com.bank.beans.Acc;
import com.bank.beans.BankAccount;
import com.bank.beans.Customer;

@Component
public class Account {

	private NamedParameterJdbcTemplate jdbc;
	
	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbc = new NamedParameterJdbcTemplate(dataSource);
	}
	
	
//	public List<Product> getAllProduct() {
//		return jdbc.query("select * from product",new RowMapper<Product>() {
//
//			public Product mapRow(ResultSet rs, int num) throws SQLException {
//				Product p = new Product();
//				p.setId(rs.getInt("id"));
//				p.setName(rs.getString("name"));
//				p.setPrice(rs.getString("price"));
//				
//				
//				return p;
//			}
//			
//		});
//		
//	}

	public void insertCustomerDetails(Customer customer) {
		
		MapSqlParameterSource map = new MapSqlParameterSource();
		map.addValue("fname", customer.getFname());
		map.addValue("mname", customer.getMname());
		map.addValue("lname", customer.getLname());
		map.addValue("contact", customer.getContact());
		map.addValue("address", customer.getAddress());
		map.addValue("panNumber", customer.getPanNumber());
		map.addValue("balance", customer.getBa().getMinBalance());
		map.addValue("accountNumber", customer.getAccountNumber());
		jdbc.update("insert into customer(fname,mname,lname,contact,address,panNumber,balance,accountNumber) values (:fname,:mname,:lname,:contact,:address,:panNumber,:balance,:accountNumber)", map);
		
	}

	public List<Customer> getAllCustmers() {
		return jdbc.query("select * from customer,customer_has_account as chs,account "
				+ "where customer.id = chs.customer_id AND chs.account_id = account.id ",new RowMapper<Customer>() {

			public Customer mapRow(ResultSet rs, int num) throws SQLException {
				Customer c = new Customer();
				BankAccount ba = new BankAccount();
				c.setId(rs.getInt("id"));
				c.setFname(rs.getString("fname"));
				c.setMname(rs.getString("mname"));
				c.setLname(rs.getString("lname"));
				c.setContact(rs.getString("contact"));
				c.setAddress(rs.getString("address"));
				c.setPanNumber(rs.getString("panNumber"));
				c.setBalance(rs.getString("balance"));
				 ba.setInterestRate(rs.getString("interestRate"));
				ba.setType(rs.getString("type"));
				 ba.setMinBalance(rs.getString("minBalance"));
				 ba.setOverdraft(rs.getString("overdraft"));
				c.setBa(ba);
				 c.setAccountNumber(rs.getString("accountNumber"));
				
				return c;
			}
			
		});
	}

	public boolean checkPanNumber(String panNumber) {
		MapSqlParameterSource map = new MapSqlParameterSource();
		map.addValue("panNumber", panNumber);
		return jdbc.queryForObject("select * from cibil where panNumber = :panNumber", map, Boolean.class);
		
	}

	public void deposit(String accountNumber, int balance, int amount) {
		MapSqlParameterSource map = new MapSqlParameterSource();
		balance += amount;
		map.addValue("accountNumber", accountNumber);
		map.addValue("balance", balance);
		jdbc.update("UPDATE customer SET balance=:balance WHERE accountNumber=:accountNumber", map);
		
	}

	public void withdraw(String accountNumber, int balance, int amount) {
		MapSqlParameterSource map = new MapSqlParameterSource();
		balance -= amount;
		map.addValue("accountNumber", accountNumber);
		map.addValue("balance", balance);
		jdbc.update("UPDATE customer SET balance=:balance WHERE accountNumber=:accountNumber", map);
		
	}

	public void insertAcc(Acc acc) {
		MapSqlParameterSource map1 = new MapSqlParameterSource();
		MapSqlParameterSource map2 = new MapSqlParameterSource();
		
		map1.addValue("username", acc.getUsername());
		map1.addValue("authority", acc.getAuthority());
		
		map2.addValue("username", acc.getUsername());
		map2.addValue("password", acc.getPassword());
		map2.addValue("enabled", acc.getEnabled());
		
		jdbc.update("INSERT INTO authorities(username, authority) VALUES(:username, :authority)", map1);
		jdbc.update("INSERT INTO users(username, password, enabled) VALUES(:username, :password, :enabled)", map2);
	}


	public List<Acc> getAllAcc() {
		return jdbc.query("SELECT * FROM authorities as a, users as u WHERE a.username = u.username" ,new RowMapper<Acc>() {

			public Acc mapRow(ResultSet rs, int num) throws SQLException {
				Acc a = new Acc();
				a.setAuthority(rs.getString("authority"));
				a.setUsername(rs.getString("username"));
				a.setEnabled(rs.getString("enabled"));
					
				return a;
			}
			
		});
	}


	public void enableDisable(String username, String enable) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("username", username);
		map.put("enable", enable);
		jdbc.update("UPDATE users SET enabled=:enable WHERE username=:username", map);
		
	}

}
