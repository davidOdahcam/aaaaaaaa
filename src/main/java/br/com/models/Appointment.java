package br.com.models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.sql.Connection;

import br.com.DAO.DatabaseConnection;
import br.com.DAO.Model;

public class Appointment {
	public static final String singular = "child";
	
	protected String tableName = "appointment";
	
	public int id;
	public int child_id;
	public int pediatric_dentist_id;
	private Connection conn;
	protected ArrayList<String> tableColumns;
	private PreparedStatement preparedQuery;
	public String date;
	public String hour;
	public String emotions;
	public String state;
	public int emotions_result;
	private String query = "";
	private String results;
	public String[] horarios = {"13:00","14:00","15:00","16:00","17:00"};
	
	public Appointment(String child_id, String pediatric_dentist_id, String date, String hour, String state) throws ClassNotFoundException, SQLException {
		this.child_id = Integer.parseInt(child_id);
		this.pediatric_dentist_id = Integer.parseInt(pediatric_dentist_id);
		this.date = date;
		this.hour = hour;
		this.state = state;
		this.conn = DatabaseConnection.initializeDatabase();
		this.tableColumns = new ArrayList<String>();
		
		ResultSetMetaData metaData = this.conn.prepareStatement("select * from " + this.tableName).executeQuery().getMetaData();
		
		for(int i = 0; i < metaData.getColumnCount(); i++) {
			this.tableColumns.add(metaData.getColumnName(i + 1));
		}

	}
	public Appointment() {
		try {
			this.conn = DatabaseConnection.initializeDatabase();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public boolean cancelar() throws SQLException {
		this.query = "update "+this.tableName+" set state='X' where id="+this.id;
		this.preparedQuery = this.conn.prepareStatement(this.query);
		this.preparedQuery.execute();
		return true;
	}
	
	public boolean result() throws SQLException {
		this.query = "update "+this.tableName+" set state='C', emotions="+this.emotions+", emotions_result="+this.emotions_result+" where id="+this.id;
		this.preparedQuery = this.conn.prepareStatement(this.query);
		this.preparedQuery.execute();
		return true;
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
				+ "date, hour, emotions, emotions_result, state) values(?,?,?,?,?,?,?)";

			this.preparedQuery = this.conn.prepareStatement(this.query);
			this.preparedQuery.setInt(1, this.child_id);
			this.preparedQuery.setInt(2, this.pediatric_dentist_id);
			this.preparedQuery.setString(4, this.date);
			this.preparedQuery.setString(5, this.hour);
			this.preparedQuery.setString(5, null);
			this.preparedQuery.setInt(6, 0);
			this.preparedQuery.setString(7, "M");
			
			
		this.preparedQuery.execute();
		
		return 0;
	}
	
	public Map<String, String> listar_consultas(String date, String hour){
		date = date.split("-")[1].concat("-"+date.split("-")[2]);
		Map<String, String> valores= new HashMap<String, String>();
		valores.put("nome", "");
		valores.put("hora", "");
		valores.put("consulta_id", "");
		valores.put("state", "");
		this.query = "select * from "+ this.tableName+ " where date like '%"+date+"%' and hour like '%"+hour+"%'";
		try {
			Statement stmt = this.conn.createStatement();
			ResultSet res = stmt.executeQuery(this.query);
			
			while(res.next()) {
				String consulta_id = res.getString("id");
				Date date_sql = res.getDate("date");
				Time hour_sql = res.getTime("hour");
				String child_id = res.getString("child_id");
				String state = res.getString("state");
				try {
					String nome = new Child().retrieve_kids(child_id);
					String hora = hour_sql.toString().split(":")[0].concat(":00");
					valores.replace("consulta_id", consulta_id);
					valores.replace("nome" , nome);
					valores.replace("hora", hora);
					valores.replace("state", state);
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return valores;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return valores;
	}
}



