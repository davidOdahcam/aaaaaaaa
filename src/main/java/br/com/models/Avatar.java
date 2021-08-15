package br.com.models;

import java.sql.SQLException;

import br.com.DAO.Model;

public class Avatar extends Model {
	public static final String singular = "avatar";
	public static final String tableName = "avatars";
	
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
	
	public Avatar() throws ClassNotFoundException, SQLException {
		super(singular, tableName);
	}
}