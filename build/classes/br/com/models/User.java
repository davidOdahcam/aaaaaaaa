package br.com.models;

import java.sql.SQLException;

import br.com.DAO.Model;

public class User extends Model {
	public static final String singular = "user";
	public static final String tableName = "users";
	
	public int id;
	public String name;
	public String email;
	public String password;
	
	public User() throws ClassNotFoundException, SQLException {
		super(tableName);
	}
	
	public User(String childTableName) throws ClassNotFoundException, SQLException {
		super(childTableName);
	}
	
	public boolean login() {
		if(this.where("email", this.email).where("password", this.password).get() != null) {
			return true;
		}
		
		return false;
	}
	
	public boolean register() {
		/*if(this.where("email", this.email).where("password", this.password).get() != null) {
			return false;
		}*/
		
		if(this.login()) { 
			System.out.println("Usuário já registrado com este email");
			return false; 
		}
		
		this.purge(); 
		
		String[] register_user = {
			"id => " + this.id,
			"password => " + this.password,
			"name => " + this.name,
			"email => " + this.email,
		};
		
		try {			
			this.create(register_user);
		} catch(SQLException e) {
			System.out.println(e.getMessage());
			
			return false;
		}
		
		return true;
	}
}