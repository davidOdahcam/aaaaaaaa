package br.com.app;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.NoSuchElementException;

import br.com.models.Child;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class Child
 */
@WebServlet("/crianca")
public class ChildServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ChildServlet() {
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
		// TODO Auto-generated method stub
		Enumeration<String> parameters = request.getParameterNames();
		Map<String, String> valores = new HashMap<String, String>();
		
		Enumeration<String> sessionAttributes = request.getSession().getAttributeNames();
		while(true){
			try{
				String parameter_name = parameters.nextElement();
				valores.put(parameter_name, request.getParameter(parameter_name));
			}
			catch(NoSuchElementException e){
				break;
			}
			}
		while(true){
			try{
				String attribute_name = sessionAttributes.nextElement();
				if(attribute_name == "user_id")
				valores.put("responsible_id", request.getSession().getAttribute(attribute_name).toString());
			}
			catch(NoSuchElementException e){
				break;
			}
			}
		try {
			Child crianca = new Child();
			crianca.create(valores);
			response.sendRedirect("perfil");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
