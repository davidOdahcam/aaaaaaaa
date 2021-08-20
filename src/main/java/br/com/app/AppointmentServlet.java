package br.com.app;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.NoSuchElementException;

import br.com.models.Appointment;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ConsultaServlet
 */
@WebServlet("/consulta")
public class AppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public AppointmentServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String date = request.getParameter("date");
		request.getSession().setAttribute("dia_da_consulta", date);
}		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1° - Pegar o resultado da consulta
		String op = request.getParameter("op");
		if(op=="desmarcar") {
			String consulta_id = request.getSession().getAttribute("consulta_id").toString();
			Appointment consulta = new Appointment();
			consulta.id = Integer.parseInt(consulta_id);
			try {
				consulta.cancelar();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(op=="marcar") {
			String day = request.getSession().getAttribute("day").toString();
			String horario = request.getSession().getAttribute("horario").toString();
			String pediatric_dentist_id = request.getSession().getAttribute("pediatric_dentisti_id").toString();
			String child_id = request.getSession().getAttribute("child_id").toString();
			Appointment consulta;
			try {
				consulta = new Appointment(child_id, pediatric_dentist_id, day, horario, "M");
				consulta.create();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else if(op=="consultar") {
			Enumeration<String> consulta_q = request.getParameterNames();
			ArrayList<String> pontos = new ArrayList<String>();
			while(true) {
				try {
					String next_el = consulta_q.nextElement();
					pontos.add(request.getParameter(next_el));
				}catch(NoSuchElementException e) {
					break;
				}
			}
			String consulta_id = request.getSession().getAttribute("consulta_id").toString();
			try {
				Appointment consulta = new Appointment();
				consulta.calculateEmotion(pontos);
				consulta.id = Integer.parseInt(consulta_id);
				consulta.result();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		}
}
