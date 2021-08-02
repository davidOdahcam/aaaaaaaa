package br.com.app;

import java.util.ArrayList;
import br.com.DAO.DatabaseConnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Consulta {
	private int id;
	private int forma_de_pagamento;
	private String data_da_consulta;
	private String emocoes;
	private int resultado_emocao;
	private int id_crianca;
	private int id_odontopediatra;

	private static int calcularEmocao(int pontos[]){
		int length = pontos.length, sum =0;
		for(int i = 0; i < length; i++) {
			sum += pontos[i];
		}
		return sum;
	}
	
	private static Consulta apresentar(int id_consulta){
		Connection con;
		Consulta c = new Consulta();
		String query = "SELECT FROM consulta WHERE id = "+id_consulta+"";
		try {
			con = DatabaseConnection.initializeDatabase();
			Statement stmt = con.createStatement();
		    ResultSet res = stmt.executeQuery(query);
		    while(res.next()) {
		    	c.setId(res.getInt("id"));
		    	c.setForma_de_pagamento(res.getInt("forma_de_pagamento"));
		    	c.setData_da_consulta(res.getString("data"));
		    	c.setData_da_consulta(res.getString("emocoes"));
		    	c.setData_da_consulta(res.getString("res_emocoes"));
		    	c.setId_crianca(res.getInt("id_crianca"));
		    	c.setId_odontopediatra(res.getInt("id_odontopediatra"));
		    }
		    
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return c;
	}
	
	private static int metodoPagamento(String metodo){
		Connection con;
		int id_metodo = 0;
		String query = "SELECT FROM metodos_pagamento WHERE metodo = "+metodo+"";
		try {
			con = DatabaseConnection.initializeDatabase();
			Statement stmt = con.createStatement();
		    ResultSet res = stmt.executeQuery(query);
		    while(res.next()) {
		    	id_metodo = res.getInt("id");
		    }
		    
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return id_metodo;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getForma_de_pagamento() {
		return forma_de_pagamento;
	}

	public void setForma_de_pagamento(int forma_de_pagamento) {
		this.forma_de_pagamento = forma_de_pagamento;
	}

	public String getData_da_consulta() {
		return data_da_consulta;
	}

	public void setData_da_consulta(String data_da_consulta) {
		this.data_da_consulta = data_da_consulta;
	}

	public String getEmocoes() {
		return emocoes;
	}

	public void setEmocoes(String emocoes) {
		this.emocoes = emocoes;
	}

	public int getResultado_emocao() {
		return resultado_emocao;
	}

	public void setResultado_emocao(int resultado_emocao) {
		this.resultado_emocao = resultado_emocao;
	}

	public int getId_crianca() {
		return id_crianca;
	}

	public void setId_crianca(int id_crianca) {
		this.id_crianca = id_crianca;
	}

	public int getId_odontopediatra() {
		return id_odontopediatra;
	}

	public void setId_odontopediatra(int id_odontopediatra) {
		this.id_odontopediatra = id_odontopediatra;
	}
}
