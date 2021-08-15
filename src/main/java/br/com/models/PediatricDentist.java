package br.com.models;

import java.sql.SQLException;

public class PediatricDentist extends User {
	public static final String singular = "pediatric_dentist";
	public static final String tableName = "pediatric_dentists";
	
	public int user_id;
	public String cro;
	public String birthdate; //YYYY-MM-DD HH:mm:SS
	public char sex; // M - F - O
	public String cpf; 
	public String street;
	public String number;
	public String neighborhood;
	public String zip_code;
	public String phone;
	
	public PediatricDentist() throws ClassNotFoundException, SQLException {
		super(singular, tableName);
	}
	
	public boolean registerChild(String[] childParams) {
		return true;
	}
}