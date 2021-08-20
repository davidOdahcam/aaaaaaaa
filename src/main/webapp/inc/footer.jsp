		</main>

        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 footer-info">
                        <h5 class="footer-info-title">Trabalho de WEB2</h5>
                        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Quam eum a nobis similique eaque, est recusandae animi, assumenda amet adipisci velit impedit, deserunt magnam! Dicta tempore aliquid iure eveniet eligendi!</p>
                    </div>

                    <div class="col-md-4 footer-info">
                        <h5 class="footer-info-title">Ferramentas utilizadas</h5>
                        <ul class="footer-info-list">
                            <li>Item 1</li>
                            <li>Item 2</li>
                        </ul>
                    </div>

                    <div class="col-md-4 footer-info">
                        <h5 class="footer-info-title">Feito por</h5>
                        <ul class="footer-info-list">
                            <li>David dos Santos Machado</li>
                            <li>Eduardo Pereira da Silva Santos</li>
                            <li>Matheus Nunes Ritton</li>
                            <li>Pedro Raposo Felix de Sousa</li>
                            <li>Victor de Oliveira Martins Azevedo</li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>
    </div>
    
	<script src="<%= request.getContextPath() %>/public/assets/js/jquery.js"></script>
	<script src="<%= request.getContextPath() %>/public/assets/js/popper.js"></script>
	<script src="<%= request.getContextPath() %>/public/assets/js/bootstrap.js"></script>
	<script src="<%= request.getContextPath() %>/public/assets/js/editar-perfil.js"></script>
	<script src="<%= request.getContextPath() %>/public/assets/js/profile.js"></script>
	<script src="<%= request.getContextPath() %>/public/assets/js/script.js"></script>
	<script src="<%= request.getContextPath() %>/public/assets/js/toastr.min.js"></script>
	<script src="<%= request.getContextPath() %>/public/assets/js/consulta.js"></script>

    <% 
        String uri = request.getRequestURI();
        String pageName = uri.substring(uri.lastIndexOf("/")+1);

        if("avatar.jsp".equals(pageName)) {
	        out.println("<script src=\"" + request.getContextPath() + "/public/assets/js/avatar.js\"></script>");
	        out.println("<script src=\"" + request.getContextPath() + "/public/assets/html2canvas/dist/html2canvas.min.js\"></script>");
        }

        if("consulta.jsp".equals(pageName)) {
	        out.println("<script src=\"" + request.getContextPath() + "/public/assets/js/consulta.js\"></script>");
        }
        
    %>

	<script>
		<% if(request.getSession().getAttribute("info") != null) { %>
			toastr.info("<%= request.getSession().getAttribute("info") %>");
			<% request.getSession().setAttribute("info", null); %>
		<% } else if(request.getSession().getAttribute("warning") != null) { %>
			toastr.warning("<%= request.getSession().getAttribute("warning") %>");
			<% request.getSession().setAttribute("warning", null); %>
		<%	} else if(request.getSession().getAttribute("error") != null) { %>
			toastr.error("<%= request.getSession().getAttribute("error") %>");
			<% request.getSession().setAttribute("error", null); %>
		<%	} else if(request.getSession().getAttribute("success") != null) { %>
			toastr.success("<%= request.getSession().getAttribute("success") %>");
			<% request.getSession().setAttribute("success", null); %>
		<%	} %>
	</script>
</body>

</html>