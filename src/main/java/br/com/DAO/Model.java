package br.com.DAO;

import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class Model {
	protected String singular;
	protected String tableName;
	protected ArrayList<String> tableColumns;
	private Connection conn;
	private String query = "";
	private PreparedStatement preparedQuery;
	private ArrayList<Map<String, String>> results;
	private ResultSet resultSet;
	
	public Model(String singular, String tableName) throws SQLException, ClassNotFoundException {
		this.singular = singular;
		this.tableName = tableName;
		this.conn = DatabaseConnection.initializeDatabase();
		this.tableColumns = new ArrayList<String>();
		
		ResultSetMetaData metaData = this.conn.prepareStatement("select * from " + this.tableName).executeQuery().getMetaData();
		
		for(int i = 0; i < metaData.getColumnCount(); i++) {
			this.tableColumns.add(metaData.getColumnName(i + 1));
		}
	}

	public Model find(String id) {
		try {				
			this.preparedQuery = this.conn.prepareStatement("select * from " + this.tableName +  " where id = ?");
			
			this.preparedQuery.setString(1, id);
			String newQuery = this.preparedQuery.toString();
			
			this.query = newQuery.split(": ")[1];	
			
			try {	
				this.resultSet = this.preparedQuery.executeQuery();
				
				if(!this.resultSet.next()) {
					return null;
				}
				
				int cols = this.resultSet.getMetaData().getColumnCount();
				
				Map<String, String> result = new HashMap<String, String>();
				ArrayList<Map<String, String>> result_final = new ArrayList<Map<String, String>>();
				
				for(int i = 1; i <= cols; i++) {
					result.put(this.resultSet.getMetaData().getColumnName(i), this.resultSet.getString(i));
				}
				
				result_final.add(result);
				
				this.results = result_final;
				
				return this;
			} catch(SQLException e) {
				System.out.println(e.getMessage());
			}
			
			this.preparedQuery.close();
		} catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		return null;
	}

	public Model where(String column, String operator, String value) {	
		//TODO: Refatorar o código para evitar SQLInjection em column
		
		try {
			if(this.query.isEmpty()) {
				this.preparedQuery = this.conn.prepareStatement("[] where " + column + " " + operator + " ?");
			} else {
				this.preparedQuery = this.conn.prepareStatement(this.query.concat(" and " + column + " " + operator + " ?"));
			}
					
			this.preparedQuery.setString(1, value);
			
			String newQuery = this.preparedQuery.toString();
			
			this.query = newQuery.split(": ")[1];				
		} catch(SQLException e) {
			System.out.println(e.getMessage());
		}
		
		return this;
	}
	
	public Model where(String column, String value) {
		return this.where(column, "=", value);
	}
	
	public Model get() {		
		try {		
			if(this.query.isEmpty()) {
				this.preparedQuery = this.conn.prepareStatement("select * from " + this.tableName);
			} else {
				this.preparedQuery = this.conn.prepareStatement(this.query.replace("[]", "select * from " + this.tableName)); 
			}
			
			this.resultSet = this.preparedQuery.executeQuery();
			//result = this.preparedQuery.executeQuery();
			
			String newQuery = this.preparedQuery.toString();
			this.query = newQuery.split(": ")[1];	
			
			if(!this.resultSet.next()) {
				return null;
			}
			
			ArrayList<Map<String, String>> result_final = new ArrayList<Map<String, String>>(); 
			
			do {
				Map<String, String> result_map = new HashMap<String, String>();
				
				int cols = this.resultSet.getMetaData().getColumnCount();
				
				for(int i = 1; i <= cols; i++) {
					result_map.put(this.resultSet.getMetaData().getColumnName(i), this.resultSet.getString(i));
				}
				
				result_final.add(result_map);
			} while(this.resultSet.next());		
						
			//this.preparedQuery.close();
			this.results = result_final;

			return this;
		} catch(SQLException e) {
			System.out.println(e.getMessage());
		}
		
		return null;
	}
	
	public Model create(Map<String, String> inserts) throws SQLException {
		if(!this.query.isEmpty() || this.results != null) {
			throw new SQLException("Impossível realizar essa opção neste momento.");
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
		
		String email = inserts.get("email");
		
		this.purge();
		this.where("email", email).get();
		
		return this;
	}
	
	public Model update(String[] updates) {
		try {
			if(this.query.isEmpty()) {
				throw new SQLException("Impossível realizar essa opção neste momento.");
			}
			
			this.get();
			this.preparedQuery = this.conn.prepareStatement(this.query, ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_UPDATABLE);
			this.resultSet = this.preparedQuery.executeQuery();

			while(this.resultSet.next()) {
				for(int i = 0; i < updates.length; i++) {
					String[] update_row = updates[i].split("=>");
					String col = update_row[0].trim();
					String val = update_row[1].trim();
					
					this.resultSet.updateString(col, val);
				}
				
				this.resultSet.updateRow();
			}
		} catch(SQLException e) {
			
			System.out.println(e.getMessage());
		}
		
		return this;
	}
	
	public boolean delete() {
		try {
			if(this.query.isEmpty()) {
				throw new SQLException("Impossível realizar essa opção neste momento.");
			}
			
			this.get();
			this.preparedQuery = this.conn.prepareStatement(this.query, ResultSet.TYPE_FORWARD_ONLY, ResultSet.CONCUR_UPDATABLE);
			this.resultSet = this.preparedQuery.executeQuery();

			while(this.resultSet.next()) {
				this.resultSet.deleteRow();
			}
		} catch(SQLException e) {
			
			System.out.println(e.getMessage());
		}
		
		return true;
	}
	
	public ArrayList<Map<String, String>> toArrayList() {
		return this.results;
	}
	
	// Alias of get()
	public Model all() {
		this.query = "";
		return this.get();
	}
	
	public Model hasOne(Class<? extends Model> className, String childForeignKey, String parentPrimaryKey) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {
		Model instance = className.getDeclaredConstructor().newInstance();
		String singular = instance.singular;
		String child_table = instance.tableName;
		
		try {
			this.conn.prepareStatement("select * from " + child_table + " where " + childForeignKey + " = PARENT_ID");
			
			return instance;
		} catch(SQLException e) {
			System.out.println(e.getMessage());
		}
		
		return null;
	}
	
	public Model hasOne(Class<? extends Model> className, String childForeignKey) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {
		return this.hasOne(className, childForeignKey, "id");
	}
	
	public Model hasOne(Class<? extends Model> className) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {
		String singular = className.getDeclaredConstructor().newInstance().singular;
		
		return this.hasOne(className, singular.concat("_id"), "id");
	}
	
	public ArrayList<Map<String, String>> hasMany(Class<? extends Model> className) {
		Model instance;
		
		try {
			instance = className.getDeclaredConstructor().newInstance();
		} catch (InstantiationException | IllegalAccessException | IllegalArgumentException | InvocationTargetException
				| NoSuchMethodException | SecurityException e) {
			e.printStackTrace();
			System.out.println("classe de merda");
			return null;
		}
		
		String child_table = instance.tableName;
		String father_id = this.results.get(0) != null ? this.results.get(0).get("id") : null;
		
		if(father_id == null) {
			System.out.println("senpai><");
			return null;
		}

		PreparedStatement pq = this.preparedQuery;
		
		try {
			ArrayList<Map<String, String>> children = new ArrayList<Map<String, String>>();
		
			this.preparedQuery = this.conn.prepareStatement("select * from " + child_table + " where " + this.singular.concat("_id") + " = " + father_id); 
			System.out.println("select * from " + child_table + " where " + this.singular.concat("_id") + " = " + father_id);
			ResultSet res = this.preparedQuery.executeQuery();
			
			if(!res.next()) {
				System.out.println("vazio");
				return null;
			}
			
			int cols = res.getMetaData().getColumnCount();
			
			do {
				Map<String, String> child = new HashMap<String, String>();
				
				for(int i = 1; i <= cols; i++) {
					child.put(res.getMetaData().getColumnName(i), res.getString(i));
				}
				
				children.add(child);
			} while(res.next());
			System.out.println("dps while");
			return children;
		} catch(SQLException e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
		
	public void closeConnection() {
		try {
			this.preparedQuery.close();
			this.conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * <P>Limpa qualquer pesquisa e/ou resultados encontrados</P>
	 *  @return void
	 */
	public void purge() {
		this.preparedQuery = null;
		this.query = "";
		this.results = null;
		this.resultSet = null;
	}
}
