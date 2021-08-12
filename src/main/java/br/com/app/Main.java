package br.com.app;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import br.com.DAO.DatabaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// Servlet Name
@WebServlet("/InsertData")
public class Main extends HttpServlet {
    private static final long serialVersionUID = 1L;
  
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        try {
            Connection con = DatabaseConnection.initializeDatabase();
            PreparedStatement st = con.prepareStatement("INSERT INTO `users` (`name`, `email`, `password`) VALUES (?, ?, ?)");
            
            st.setString(1, request.getParameter("name"));
            st.setString(2, request.getParameter("email"));
            st.setString(3, request.getParameter("password"));
            st.executeUpdate();
            st.close();
            con.close();
            // PrintWriter out = response.getWriter();
            // out.println("<html><body><b>Successfully Inserted" + "</b></body></html>");
            System.out.println("Cadastrado com sucesso");
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}