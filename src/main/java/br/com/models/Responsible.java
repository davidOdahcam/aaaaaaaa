package br.com.models;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

public class Responsible extends User {
	public static final String singular = "responsible";
	public static final String tableName = "responsibles";
	
	public int user_id;
	public String birthdate; //YYYY-MM-DD HH:mm:SS
	public char sex; // M - F - O
	public String cpf; 
	public String street;
	public String number;
	public String neighborhood;
	public String zip_code;
	public String phone;
	public String profession;
	
	public Responsible() throws ClassNotFoundException, SQLException {
		super(singular, tableName);
	}
	
	public static void main(String[] args) {
		try {
			Responsible r = new Responsible();
			
			System.out.println(((Responsible) r.find("1").get()).children());
		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
		}
	}
	
	public ArrayList<Map<String, String>> children() {
		ArrayList<Map<String, String>> children = this.hasMany(Child.class);
		
		return children;
	}
}