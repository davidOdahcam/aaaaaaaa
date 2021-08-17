package br.com.app;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import br.com.models.Responsible;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Profile
 */
@WebServlet("/perfil")
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Profile() {
        
    }
    
    public boolean redirectIfNotAuthenticated(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	if(request.getSession().getAttribute("user_id") == null) {
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
			String jsp = request.getSession().getAttribute("jsp").toString();
	
			if(request.getSession().getAttribute("responsible") != null) {	
				Map<String, String> responsible_map = (Map<String, String>) request.getSession().getAttribute("responsible");
				
				String id = responsible_map.get("id");
				Responsible r;
				try {
					r = (Responsible) new Responsible().find(id).get();
		
					request.getSession().setAttribute("children", r.children());
				} catch (ClassNotFoundException | SQLException e) {
					request.getSession().invalidate();
					response.sendRedirect("login");
				}
			} else {
				// COISAS DE ODONTOPEDIATRA
			}
			
			request.getRequestDispatcher(jsp).forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
