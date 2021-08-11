package br.com.models;

import java.sql.SQLException;

import br.com.DAO.Model;

public class Appointment extends Model {
	public static final String singular = "child";
	public static final String tableName = "children";
	
	public int id;
	public int child_id;
	public int pediatric_dentist_id;
	
	public int payment_method;
	public int date;
	public String emotions;
	public int emotions_result;
	
	public Appointment() throws ClassNotFoundException, SQLException {
		super(tableName);
	}
	
	public int calculateEmotion() {
		return 10;
	}
}