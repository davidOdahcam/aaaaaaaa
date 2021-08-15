package br.com.app;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import br.com.DAO.DatabaseConnection;
import br.com.models.PediatricDentist;
import br.com.models.Responsible;
import br.com.models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Register
 */
@WebServlet("/cadastrar")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Register() {
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
			String query = request.getQueryString();
			
			if(query.equals("odontopediatra")) {
				request.getRequestDispatcher("odontopediatra-cadastrar.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("responsavel-cadastrar.jsp").forward(request, response);
			}
		};
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!this.redirectIfAuthenticated(request, response)) {
			Map<String, String[]> data = request.getParameterMap();
			Map<String, String> addData = new HashMap<String, String>();
			
			for(Map.Entry<String, String[]> entry: data.entrySet()) {
				addData.put(entry.getKey(), entry.getValue()[0]);
			}
			
			try {			
				Map<String, String> u = new User().create(addData).toArrayList().get(0);
				addData.put("user_id", u.get("id"));
				
				if(addData.get("sex") == null) {
					addData.put("sex", "O");
				}
				
				if(addData.get("zip_code") == null) {
					addData.put("zip_code", "10");
				}
				
				if(data.get("type")[0].equals("odontopediatra")) {
					PediatricDentist p_d;
					
					p_d = (PediatricDentist) new PediatricDentist().create(addData);
					
					request.getSession().setAttribute("success", "Seu perfil de Odontopediatra foi criado com sucesso! Realize o login para ter acesso a aplicação");
				} else {
					new Responsible().create(addData);	
					
					request.getSession().setAttribute("success", "Seu perfil de Resnponsável foi criado com sucesso! Realize o login para ter acesso a aplicação");
				}
				
				response.sendRedirect("login");
			} catch (ClassNotFoundException | SQLException e) {
				request.getSession().setAttribute("error", e.getMessage());
				
				response.sendRedirect("cadastrar?" + data.get("type")[0]);
			}
		}
	}

}
