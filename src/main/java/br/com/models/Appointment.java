package br.com.models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.sql.Connection;

import br.com.DAO.DatabaseConnection;
import br.com.DAO.Model;

public class Appointment {
	public static final String singular = "child";
	
	protected String tableName;
	
	public int id;
	public int child_id;
	public int pediatric_dentist_id;
	private Connection conn;
	protected ArrayList<String> tableColumns;
	private PreparedStatement preparedQuery;
	public int payment_method;
	public String date;
	public String emotions;
	public int emotions_result;
	private String query = "";
	private String results;
	
	public Appointment(String tableName, String child_id, String pediatric_dentist_id, String payment_method, String date, String emotions) throws ClassNotFoundException, SQLException {
		this.child_id = Integer.parseInt(child_id);
		this.pediatric_dentist_id = Integer.parseInt(pediatric_dentist_id);
		this.payment_method = this.metodo_pagamento(payment_method);
		this.date = date;
		this.emotions = emotions;
		this.tableName = tableName;
		this.conn = DatabaseConnection.initializeDatabase();
		this.tableColumns = new ArrayList<String>();
		
		ResultSetMetaData metaData = this.conn.prepareStatement("select * from " + this.tableName).executeQuery().getMetaData();
		
		for(int i = 0; i < metaData.getColumnCount(); i++) {
			this.tableColumns.add(metaData.getColumnName(i + 1));
		}
	}
	
	public int metodo_pagamento(String metodo) {
		if(metodo.equals("dinheiro")) {
			this.payment_method = 0;
		}
		else if (metodo.equals("credito")) {
			this.payment_method = 1;
		} else if (metodo.equals("debito")){
			this.payment_method = 2;
		}
		return 0;
	}
	
	public int calculateEmotion(ArrayList<String> points){
		this.emotions = points.toString();
		int sum = 0;
		for(int i=0;i<points.size();i++) {
			sum = sum + Integer.parseInt(points.get(i));
		}
		this.emotions_result = sum;
		return 0;
	}
	
	public int create() throws SQLException {
		this.query = "insert into " + this.tableName + "(child_id, pedriatic_dentist_id,"
				+ "payment_method, date, emotions, emotions_result) values(?,?,?,?,?,?)";

			this.preparedQuery = this.conn.prepareStatement(this.query);
			this.preparedQuery.setInt(1, this.child_id);
			this.preparedQuery.setInt(2, this.pediatric_dentist_id);
			this.preparedQuery.setInt(3, this.payment_method);
			this.preparedQuery.setString(4, this.date);
			this.preparedQuery.setString(5, this.emotions);
			this.preparedQuery.setInt(6, this.emotions_result);
			
		this.preparedQuery.execute();
		
		return 0;
	}
}