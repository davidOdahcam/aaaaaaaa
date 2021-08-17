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

    public boolean redirectIfNotAuthenticated(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	if(request.getSession().getAttribute("user_id") == null || request.getSession().getAttribute("responsible") == null) {
			response.sendRedirect("login");
			
			return true;
		}
    	
    	return false;
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!this.redirectIfNotAuthenticated(request, response)) {
			request.getRequestDispatcher("crianca-cadastrar.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Enumeration<String> parameters = request.getParameterNames();
		Map<String, String> valores = new HashMap<String, String>();
		
		Enumeration<String> sessionAttributes = request.getSession().getAttributeNames();
		while(true) {
			try {
				String parameter_name = parameters.nextElement();
				valores.put(parameter_name, request.getParameter(parameter_name));
			} catch(NoSuchElementException e){
				break;
			}
		}
		
		while(true) {
			try {
				String attribute_name = sessionAttributes.nextElement();
				if(attribute_name == "responsible") {
					Map<String, String> r = (Map<String, String>) request.getSession().getAttribute(attribute_name);
					valores.put("responsible_id", r.get("id"));
				}
			} catch(NoSuchElementException e){
				break;
			}
		}
		
		try {
			Child crianca = new Child();
			crianca.create(valores);
			
			request.getSession().setAttribute("success", "Criança adicionada com sucesso");
			response.sendRedirect("perfil");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}

}
