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
		response.getWriter().append("Served at: ").append(request.getContextPath());
}		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1° - Pegar o resultado da consulta
		Enumeration<String> consulta = request.getParameterNames();
		ArrayList<String> pontos = new ArrayList<String>();
		while(true) {
			try {
				String next_el = consulta.nextElement();
				pontos.add(request.getParameter(next_el));
			}catch(NoSuchElementException e) {
				break;
			}
		}
		
		//2° - Pegar os dados da sessão
		//Essa declaração manual é provisória.
		String child_id = request.getSession().getAttribute("child_id").toString();
		String pediatric_dentist_id = request.getSession().getAttribute("pedriatic_dentist_id").toString();
		String payment_method = request.getSession().getAttribute("payment_method").toString();
		String date = request.getSession().getAttribute("date").toString();
		ArrayList<String> emotions = pontos;
		
		//3° - Criar classe appointment e salvá-la no BD.
		try {
			Appointment new_appointment = new Appointment("appointment", child_id, pediatric_dentist_id
					, payment_method, date, emotions.toString());
			new_appointment.calculateEmotion(emotions);
			new_appointment.create();
;		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		}
}
