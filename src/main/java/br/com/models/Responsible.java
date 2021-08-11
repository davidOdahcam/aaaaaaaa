package br.com.models;

import java.sql.SQLException;

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
		super(tableName);
	}
}