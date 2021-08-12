package br.com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
  
// This class can be used to initialize the database connection
public class DatabaseConnection {
    public static Connection initializeDatabase() throws SQLException, ClassNotFoundException
    {
        // Initialize all the information regarding
        // Database Connection
        String dbDriver = "com.mysql.jdbc.Driver";
        String dbURL = "jdbc:mysql://localhost:3306/";
        // Database name to access
        String dbName = "web2";
        String dbUsername = "root";
        String dbPassword = "1234";
  
        Class.forName(dbDriver);
        Connection con = DriverManager.getConnection(dbURL + dbName, dbUsername, dbPassword);
        
        return con;
    }
    
    /*public static void main(String[] args) throws ClassNotFoundException, SQLException {
    	Connection con = DatabaseConnection.initializeDatabase();
    	
    	try {				
			PreparedStatement preparedQuery = con.prepareStatement("select * from users where id = ?");
			
			preparedQuery.setString(1, "2");
			
			ResultSet query_result;
			
			try {				
				query_result = preparedQuery.executeQuery();
				
				if(!query_result.next()) {
					throw new SQLException("No user with this ID")					;
				}
				
				int cols = query_result.getMetaData().getColumnCount();
				
				Map<String, String> result = new HashMap<String, String>();
				
				for(int i = 1; i <= cols; i++) {
					result.put(query_result.getMetaData().getColumnName(i), query_result.getString(i));
				}
				
				System.out.println(result);
			} catch(SQLException e) {
				System.out.println(e.getMessage());
			}
			
			preparedQuery.close();
			con.close();
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
    }*/
}