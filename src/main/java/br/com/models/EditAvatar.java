package br.com.models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import br.com.DAO.DatabaseConnection;
import br.com.DAO.Model;

public class EditAvatar extends Model {
	public static final String singular = "avatar";
	public static final String tableName = "avatar";
	private Connection conn = DatabaseConnection.initializeDatabase();
	
	public int id;
	public int child_id; // AVALIAR
	
	public int ethnicity;
	public int gender;
	public int hair_type;
	public int hair_color;
	public int eye_type;
	public int eye_color;
	public int mouth_type;
	public int mouth_color;
	public int glass;
	public int cloth;
	public int cloth_color;
	
	public EditAvatar() throws ClassNotFoundException, SQLException {
		super(singular, tableName);
	
	}
	
	public void saveAvatar(String child_id, String path) throws SQLException {
		
		try {
		
		PreparedStatement st = conn.prepareStatement("UPDATE " + this.tableName + " SET path = ? WHERE id =" + child_id); //MODIFICAR PARA O CHILD_ID
		
		st.setString(1, contextPath);
		
		st.executeUpdate();
		
		st.close();
		conn.close();
		
		}
		
		catch (SQLException e) {
			e.printStackTrace();
		}		
		
	}
}