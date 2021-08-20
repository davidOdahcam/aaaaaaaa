package br.com.app;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.xml.bind.DatatypeConverter;

import br.com.models.EditAvatar;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class Avatar
 */
@WebServlet("/avatar")
public class Avatar extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String FileLocation = "C:\\Users\\mathe\\Google Drive\\Programming\\Java\\eclipse-workshop\\TrabalhoWeb2\\src\\main\\webapp\\public\\assets\\uploads"; //ALTERE SOMENTE ESTA LINHA!!!
	private String shortPath = "/TrabalhoWeb2/public/assets/uploads"; //APENAS VERIFIQUE O NOME DO PROJETO E ALTERE, SE NECESSARIO	
	
    /**
     * Default constructor. 
     */
    public Avatar() {
        // TODO Auto-generated constructor stub
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("avatar.jsp").forward(request, response);
		
	}
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println(request.getContextPath());
        String child_id = request.getParameter("id");
		
		int length = Integer.parseInt(request.getParameter("length"));
		
		String blob = "";
		String step;
		
		try {
			
			for(int i = 0; i < length; i++) {
				step = "blob_".concat(Integer.toString(i));

				blob = blob.concat(request.getParameter(step).replaceAll(" ", "+"));
			}
			
	        String[] strings = blob.split(",");

	        byte[] data = DatatypeConverter.parseBase64Binary(strings[1]);
	        String path = FileLocation + "/avatar_" + child_id + ".png";
	        
	        File file = new File(path);
	        
	        try (OutputStream outputStream = new BufferedOutputStream(new FileOutputStream(file))) {
	            outputStream.write(data);
	            EditAvatar av = new EditAvatar();
	            
				String contextPath = shortPath + "/avatar_" + child_id + ".png";
	            av.saveAvatar(child_id, contextPath);
	            
	        } catch (IOException e) {
	        	
	            e.printStackTrace();
	        }

		} catch(Exception e) {
			
			System.out.println(e.getMessage());
			e.printStackTrace();
		
		}
	
	
	}

}