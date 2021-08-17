package br.com.app;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import br.com.models.PediatricDentist;
import br.com.models.Responsible;
import br.com.models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Login() {
        // TODO Auto-generated constructor stub
    }

    public boolean redirectIfAuthenticated(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	if(request.getSession().getAttribute("user_id") != null) {
			String jsp;
			
			if(request.getSession().getAttribute("responsible") != null) {
				jsp = "responsavel-perfil.jsp";
			} else {
				jsp = "odontopediatra-perfil.jsp";
			}
			
			request.getSession().setAttribute("jsp", jsp);
			response.sendRedirect("perfil");
			
			return true;
		}
    	
    	return false;
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		if(!this.redirectIfAuthenticated(request, response)) {			
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Map<String, String> data = new HashMap<String, String>();
		
		data.put("email", request.getParameter("email"));
		data.put("password", request.getParameter("password"));
		
		User u;
		Responsible r;
		PediatricDentist p_d;
		
		if((u = User.login(data)) != null) {
			String id = u.toArrayList().get(0).get("id");
			
			//response.addCookie(new Cookie("user_id", id));
			request.getSession().setAttribute("user_id", id);
			
			try {
				String jsp = "";
				
				r = new Responsible();
				p_d = new PediatricDentist();
				
				if(r.where("user_id", id).get() != null) {					
					request.getSession().setAttribute("responsible", r.toArrayList().get(0));
								
					jsp = "responsavel-perfil.jsp";
				} else if(p_d.where("user_id", id).get() != null) {
					request.getSession().setAttribute("pediatric", p_d.toArrayList().get(0));

					jsp = "odontopediatra-perfil.jsp";
				}
				
				request.getSession().setAttribute("success", "Login efetivado");
				request.getSession().setAttribute("jsp", jsp);
				
				response.sendRedirect("perfil");
				
				//request.getRequestDispatcher(jsp).forward(request, response);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
				
				request.getSession().setAttribute("error", "Houve um erro no login. Tente novamente mais tarde");
				
				this.doGet(request, response);
			}
		} else {			
			request.getSession().setAttribute("error", "Login e/ou senha inv�lidos");
			
			this.doGet(request, response);
		}
	}
}
