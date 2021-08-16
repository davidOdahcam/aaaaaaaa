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
	
	public void saveAvatar(int child_id, String path) throws SQLException {
		
		try {
			
		
		PreparedStatement st = conn.prepareStatement("INSERT INTO " + this.tableName + " (avatar_id, path) VALUES(?, ?)"); //MODIFICAR PARA O CHILD_ID
		
		st.setInt(1, child_id);
		st.setString(2, path);
		
		st.executeUpdate();
		
		st.close();
		conn.close();
		
		}
		
		catch (SQLException e) {
			e.printStackTrace();
		}		
		
	}
}