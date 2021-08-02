package br.com.app;

import br.com.DAO.DatabaseConnection;
import java.sql.Connection;
import java.sql.SQLException; 
import java.sql.Statement;
import java.util.Enumeration;
import java.util.Hashtable;

public class Crianca {
	private int id;
	private String nome;
	private String data_de_nascimento;
	private char sexo;
	private String historico_familiar;
	private String historico_patologico;
	private int id_responsavel;
	private int id_avatar;
	
	private static boolean criarAvatar(Hashtable dict){
	Enumeration<String> keys = dict.keys();
	String query = "";
	while(keys.hasMoreElements()){
		String pKey = keys.nextElement();
		Object value = dict.get(pKey);
		query.concat((String) value+",");
	}
	try {
		Connection con = DatabaseConnection.initializeDatabase();
		Statement stmt = con.createStatement();
		String stmt_text = "INSERT INTO avatar VALUES ("+query+")";
		stmt.executeUpdate(stmt_text);
		return true;
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return false;
	}
	
	private static boolean editarAvatar(Hashtable dict) {
	int id_avatar = (int) dict.get("id");
	Enumeration<String> keys = dict.keys();
	String query = "";
	while(keys.hasMoreElements()){
		String pKey = keys.nextElement();
		Object value = dict.get(pKey);
		query.concat((String) value+",");
	}
	try {
		Connection con = DatabaseConnection.initializeDatabase();
		Statement stmt = con.createStatement();
		String stmt_text = "UPDATE TABLE avatar VALUES ("+query+") WHERE id = "+id_avatar+"";
		stmt.executeUpdate(stmt_text);
		return true;
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return false;
	}
}
