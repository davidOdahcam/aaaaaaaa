package br.com.app;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Logout
 */
@WebServlet("/logout")
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Logout() {
        // TODO Auto-generated constructor stub
    }

    public boolean redirectIfNotAuthenticated(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	if(request.getSession().getAttribute("user_id") == null) {
			response.sendRedirect("login");
			
			return true;
		}
    	
    	return false;
    }
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!this.redirectIfNotAuthenticated(request, response)) {
			request.getSession().setAttribute("user_id", null);
			request.getSession().setAttribute("pediatric_dentist_id", null);
			request.getSession().setAttribute("responsible_id", null);
			request.getSession().setAttribute("warning", "Logout realizado");
			
			response.sendRedirect("login");
		}
	}

}
