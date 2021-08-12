package br.com.models;

import java.sql.SQLException;
import java.util.Map;

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
	
	public static User login(Map<String, String> data) {
		User u;
		
		try {
			u = new User();
			
			if(u.where("email", data.get("email")).where("password", data.get("password")).get() != null) {
				return u;
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public static boolean register(Map<String, String> data) {		
		if(User.login(data) != null) { 
			System.out.println("Usuário já registrado com este email");
			return false; 
		}
		
		data.put("id", Double.toString(Math.floor(Math.random() * 100))); // TEMPORÁRIO
		
		String[] register_user = {
			"id => " + data.get("id"),
			"password => " + data.get("password"),
			"name => " + data.get("name"),
			"email => " + data.get("email"),
		};
		
		try {		
			new User().create(register_user);
		} catch(ClassNotFoundException | SQLException e) {
			System.out.println(e.getMessage());
			
			return false;
		}
		
		return true;
	}
}