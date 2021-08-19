package br.com.app;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.NoSuchElementException;

import br.com.models.Child;
import br.com.models.PediatricDentist;
import br.com.models.Responsible;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateResponsible
 */
@WebServlet("/perfil/editar")
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public Update() {}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("teste");
    	response.setStatus(500);
		response.getWriter().println("Erro?get");
	}
    
    // O objetivo era usar um doPut, porém os parâmetros não estavam sendo capturados. Por isso usamos um doPost
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Enumeration<String> parameterNames = request.getParameterNames();
		Map<String, String> parameterMap = new HashMap<String, String>();
				
		while(true) {
			try {				
				String parameterName = parameterNames.nextElement();
				parameterMap.put(parameterName, request.getParameter(parameterName));
			} catch(NoSuchElementException e) {
				break;
			}	
		}
		
		// Guarda os valores para comparações e recuperação de registros
		String id = parameterMap.get("id");
		String type = parameterMap.get("type");
		
		// Remove os valores do Map para evitar inserção de dados protegidos ou inexistentes
		parameterMap.remove("id");
		parameterMap.remove("type");
		
		try {					
			if(type.equals("responsavel")) {
				Responsible r = new Responsible();
				r.find(id).get().update(parameterMap);
				
				// Recupera o registro atualizado do responsável para exibir no front
				Map<String, String> updated_responsible = r.find(id).get().toArrayList().get(0);
				request.getSession().setAttribute("responsible", updated_responsible);
				
				// flash
				request.getSession().setAttribute("success", "Seu perfil foi alterado com sucesso");
			} else if(type.equals("odontopediatra")) {
				PediatricDentist p_r = new PediatricDentist();
				p_r.find(id).get().update(parameterMap);
				
				// Recupera o registro atualizado do odontopediatra para exibir no front
				Map<String, String> updated_pediatric_dentist = p_r.find(id).get().toArrayList().get(0);
				request.getSession().setAttribute("pediatric", updated_pediatric_dentist);
				
				// flash
				request.getSession().setAttribute("success", "Seu perfil foi alterado com sucesso");
			} else if(type.equals("crianca")) {
				Child c = new Child();
				c.find(id).get().update(parameterMap);
					
				// Recupera o responsável para a futura recuperação das crianças do mesmo
				String responsible_id = c.toArrayList().get(0).get("responsible_id");
				Responsible r = new Responsible();
				r = (Responsible) r.find(responsible_id).get();
	
				// Recupera o registro atualizado das criancas para exibir no front
				ArrayList<Map<String, String>> updated_children = r.children();
				request.getSession().setAttribute("children", updated_children);
				
				// flash
				request.getSession().setAttribute("success", "O perfil da criança foi alterado com sucesso");
			} else {
				response.setStatus(400);
				response.getWriter().println("Tipo de perfil inválido: " + type);			
			}
		} catch(SQLException | ClassNotFoundException e) {
			System.out.println(e.getMessage());
			
			response.setStatus(500);
			response.getWriter().println("Ocorreu um erro ao alterar o perfil. Tente novamente mais tarde");
		}
	}
}
