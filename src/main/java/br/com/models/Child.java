package br.com.models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

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
	private Connection conn;
	public String family_history;
	public String pathology_history;
	private String query = "";
	private PreparedStatement preparedQuery;
	protected ArrayList<String> tableColumns;
	private ArrayList<Map<String, String>> results;
	
	public Child() throws ClassNotFoundException, SQLException {
		super(singular, tableName);
	}
	
	public boolean createAvatar() {
		return true;
	}
	
	public boolean editAvatar() {
		return true;
	}


public Child create(Map<String, String> inserts) throws SQLException {
	if(!this.query.isEmpty() || this.results != null) {
		throw new SQLException("Imposs�vel realizar essa op��o neste momento.");
	}
			
	ArrayList<String> cols = new ArrayList<String>();
	ArrayList<String> vals = new ArrayList<String>();
	
	this.query = "insert into " + this.tableName + "(__columns) values(__values)";

	for(Map.Entry<String, String> insert: inserts.entrySet()) {			
		if(!this.tableColumns.contains(insert.getKey().trim())) {
			continue;
		}
		
		cols.add(insert.getKey().trim());
		
		String notPreparedValue = insert.getValue().trim();
		
		this.preparedQuery = this.conn.prepareStatement("?");
		this.preparedQuery.setString(1, notPreparedValue);
		
		String preparedValue = this.preparedQuery.toString();
		
		preparedValue = preparedValue.split(": ")[1];

		vals.add(preparedValue);
	}
	
	this.query = this.query.replace("__columns", String.join(", ", cols));
	this.query = this.query.replace("__values", String.join(", ", vals));

	this.preparedQuery = this.conn.prepareStatement(this.query);
	this.preparedQuery.execute();
	
	return this;
}

public String retrieve_kids(String responsible_id) {
	
	
	return "";
}
}