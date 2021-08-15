package br.com.models;

import java.sql.SQLException;

import br.com.DAO.Model;

public class Child extends Model {
	public static final String singular = "child";
	public static final String tableName = "children";
	
	public int id;
	public int responsible_id;
	public int avatar_id;
	
	public String name;
	public String birthdate; //YYYY-MM-DD HH:mm:SS
	public char sex; // M - F - O
	public String cpf; 
	public String family_history;
	public String pathology_history;
	
	public Child() throws ClassNotFoundException, SQLException {
		super(singular, tableName);
	}
	
	public boolean createAvatar() {
		return true;
	}
	
	public boolean editAvatar() {
		return true;
	}
}