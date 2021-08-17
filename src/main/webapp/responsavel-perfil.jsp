<jsp:include page="/inc/header.jsp" >
  	<jsp:param name="title" value="Cadastrar odontopediatra" />
</jsp:include>

<div class="container">
    <div class="main-body">
        <div class="row">
            <div class="col-md-4 mb-3">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex flex-column align-items-center text-center">
                            <img src="<%= request.getContextPath() %>/public/assets/images/responsavel.png" alt="Admin" class="rounded-circle" width="150">
                            <div class="mt-3">
                                <h4><%=  ((java.util.Map<String, String>) request.getSession().getAttribute("responsible")).get("name") %></h4>
                                <p class="text-secondary mb-3">Respons�vel</p>
                                <form action="crianca-cadastrar.jsp" method="get">
                                	<button class="btn btn-primary">Cadastrar Filho(a)</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="card mb-3">
                    <div class="card-body">
                        <div class="row pt-3 pb-1 border-bottom">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Nome Completo:</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <span><%= ((java.util.Map<String, String>) request.getSession().getAttribute("responsible")).get("name") %></span>
                            </div>
                        </div>
                        <div class="row pt-3 pb-1 border-bottom">
                            <div class="col-sm-3">
                                <h6 class="mb-0">CPF:</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <span><%= ((java.util.Map<String, String>) request.getSession().getAttribute("responsible")).get("cpf") %></span>
                            </div>
                        </div>
                        <div class="row pt-3 pb-1 border-bottom">
                            <div class="col-sm-3">
                                <h6 class="mb-0">E-mail:</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <span><%= ((java.util.Map<String, String>) request.getSession().getAttribute("responsible")).get("email") %></span>
                            </div>
                        </div>
                        <div class="row pt-3 pb-1 border-bottom">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Telefone:</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <span><%= ((java.util.Map<String, String>) request.getSession().getAttribute("responsible")).get("phone") %></span>
                            </div>
                        </div>
                        <div class="row pt-3 pb-1 border-bottom">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Profiss�o:</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <span><%= ((java.util.Map<String, String>) request.getSession().getAttribute("responsible")).get("profession") %></span>
                            </div>
                        </div>
                        <div class="row pt-3 pb-1 border-bottom">
                            <div class="col-sm-3">
                                <h6 class="mb-0">CEP:</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <span><%= ((java.util.Map<String, String>) request.getSession().getAttribute("responsible")).get("cep") %></span>
                            </div>
                        </div>
                        <div class="row pt-3 pb-1 border-bottom">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Endere�o</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <span><%= ((java.util.Map<String, String>) request.getSession().getAttribute("responsible")).get("neighborhood") %></span>,
                                <span><%= ((java.util.Map<String, String>) request.getSession().getAttribute("responsible")).get("street") %></span>,
                                <span><%= ((java.util.Map<String, String>) request.getSession().getAttribute("responsible")).get("complement") %></span>,
                                <span><%= ((java.util.Map<String, String>) request.getSession().getAttribute("responsible")).get("number") %></span>
                                
                            </div>
                        </div>
                        <div class="row pt-4">
                            <div class="col-sm-12 d-flex justify-content-end">
                                <button class="btn btn-success" data-toggle="modal" data-target="#editProfile">Editar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <h4 class="text-center">Filhos Cadastrados</h4>
                        <div class="row">
                        <!-- 
                        	Iterar pelo ArrayList
                        	pegar o ID da crian�a 
                        	pegar o nome da crian�a
                        -->
                            <% for(int i = 0; i < ((java.util.ArrayList<java.util.Map<String, String>>) request.getSession().getAttribute("children")).size(); i++) { %>
                            	<div class="col-md-4 mb-3">
	                                <div class="card">
	                                    <div class="card-body">
	                                        <div class="d-flex flex-column align-items-center text-center">
	                                   			<% if(((java.util.ArrayList<java.util.Map<String, String>>) request.getSession().getAttribute("children")).get(i).get("path_avatar") != null) { %>
		                                            <img src="<%= request.getContextPath() %>/public/assets/images/responsavel.png" alt="Admin"
		                                                class="rounded-circle" width="150">
	                                   			<% } else if(((java.util.ArrayList<java.util.Map<String, String>>) request.getSession().getAttribute("children")).get(i).get("sex") == "M") { %>
	                                                <img src="<%= request.getContextPath() %>/public/assets/images/boy.png" alt="Admin"
	                                                	class="rounded-circle" width="150">
                                                <% } else { %>
	                                                <img src="<%= request.getContextPath() %>/public/assets/images/girl.png" alt="Admin"
	                                                	class="rounded-circle" width="150">
                                                <% } %>
	                                            <div class="mt-3">
	                                                <h4><%= ((java.util.ArrayList<java.util.Map<String, String>>) request.getSession().getAttribute("children")).get(i).get("name") %></h4>
	                                         		<p class="text-secondary mb-3"><%= ((java.util.ArrayList<java.util.Map<String, String>>) request.getSession().getAttribute("children")).get(i).get("sex") %></p>
	                                                <!-- <p class="text-secondary mb-3">Respons�vel</p> -->
	                                                <button id="<%= ((java.util.ArrayList<java.util.Map<String, String>>) request.getSession().getAttribute("children")).get(i).get("id") %>" class="btn btn-primary" data-toggle="modal" data-target="#editChildrenId-<%= ((java.util.ArrayList<java.util.Map<String, String>>) request.getSession().getAttribute("children")).get(i).get("id") %>">Perfil</button>
	                                                <a href="./avatar?id=<%= ((java.util.ArrayList<java.util.Map<String, String>>) request.getSession().getAttribute("children")).get(i).get("id") %>" class="btn btn-primary">Avatar</a> 
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
	                            </div>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="modals">
    	<div class="modal fade" id="editProfile" tabindex="-1" role="dialog" aria-labelledby="editProfileTypeLabel" aria-hidden="true">
	        <div class="modal-dialog modal-lg" role="document">
	            <div class="modal-content">
	                <div class="modal-header bg-gradient-danger">
	                    <h2 class="container-title mb-0">Edite seu perfil</h2>
	                    <button type="button" class="close text-dark" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">&times;</span>
	                    </button>
	                </div>
	                <div class="modal-body">
					    <form action="" id="form-edit">
                            <input type="text" name="id" value="<%= ((java.util.Map<String, String>) request.getSession().getAttribute("responsible")).get("id") %>" hidden>
                            <input type="text" name="type" value="responsavel" hidden>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="name">Nome</label>
                                    <input type="text" name="name" id="name" value="<%= ((java.util.Map<String, String>) request.getSession().getAttribute("responsible")).get("name") %>" class="form-control" placeholder="Digite seu nome" required/>
                                    <small class="text-danger"></small>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="email">E-mail</label>
                                    <input type="text" name="email" id="email" value="<%= ((java.util.Map<String, String>) request.getSession().getAttribute("responsible")).get("email") %>" class="form-control" placeholder="Digite seu email" required/>
                                    <small class="text-danger"></small>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="phone">Telefone</label>
                                    <input type="text" name="phone" id="phone" value="<%= ((java.util.Map<String, String>) request.getSession().getAttribute("responsible")).get("phone") %>" class="form-control" placeholder="Digite seu Telefone" required/>
                                    <small class="text-danger"></small>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="cep">CEP</label>
                                    <input type="text" name="cep" id="cep" value="<%= ((java.util.Map<String, String>) request.getSession().getAttribute("responsible")).get("cep") %>" class="form-control" placeholder="Digite seu CEP" required/>
                                    <small class="text-danger"></small>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="neighborhood">Bairro</label>
                                    <input type="text" name="neighborhood" id="neighborhood" value="<%= ((java.util.Map<String, String>) request.getSession().getAttribute("responsible")).get("neighborhood") %>" class="form-control" placeholder="Digite seu Bairro" required/>
                                    <small class="text-danger"></small>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="street">Rua</label>
                                    <input type="text" name="street" id="street" value="<%= ((java.util.Map<String, String>) request.getSession().getAttribute("responsible")).get("street") %>" class="form-control" placeholder="Digite sua Rua" required/>
                                    <small class="text-danger"></small>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="complement">Complemento</label>
                                    <input type="text" name="complement" id="complement" value="<%= ((java.util.Map<String, String>) request.getSession().getAttribute("responsible")).get("complement") %>" class="form-control" placeholder="Digite seu Complemento" required/>
                                    <small class="text-danger"></small>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="number">N�mero</label>
                                    <input type="text" name="number" id="number" value="<%= ((java.util.Map<String, String>) request.getSession().getAttribute("responsible")).get("number") %>" class="form-control" placeholder="Digite seu N�mero" required/>
                                    <small class="text-danger"></small>
                                </div>
                            </div>
                        </form>
	                </div>
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Voltar</button>
	                </div>
	            </div>
	        </div>
	    </div>
        
        <% for(int i = 0; i < ((java.util.ArrayList<java.util.Map<String, String>>) request.getSession().getAttribute("children")).size(); i++) { %>
            <div class="modal fade" id="editChildrenId-<%=((java.util.ArrayList<java.util.Map<String, String>>) request.getSession().getAttribute("children")).get(i).get("id")%>" tabindex="-1" role="dialog" aria-labelledby="editProfileTypeLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header bg-gradient-danger">
                            <h2 class="container-title mb-0">Edite o perfil de seu filho(a)</h2>
                            <button type="button" class="close text-dark" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="./crianca" method="POST" id="ChildrenFormId-<%=((java.util.ArrayList<java.util.Map<String, String>>) request.getSession().getAttribute("children")).get(i).get("id")%>" class="form">       
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="name">Nome</label>
                                        <input type="text" name="name" id="name" class="form-control" value="<%=((java.util.ArrayList<java.util.Map<String, String>>) request.getSession().getAttribute("children")).get(i).get("name")%>" placeholder="Digite o nome" required/>
                                    </div>
                                    
                                     <div class="form-group col-md-6">
                                        <label for="name">CPF</label>
                                        <input type="text" name="cpf" id="cpf" class="form-control" value="<%=((java.util.ArrayList<java.util.Map<String, String>>) request.getSession().getAttribute("children")).get(i).get("cpf")%>" placeholder="Digite o CPF" required/>
                                    </div>
                                    
                                     <div class="form-group col-md-6">
                                        <label for="name">Histórico familiar</label>
                                        <input type="text" name="family_history" id="family_history" class="form-control" value="<%=((java.util.ArrayList<java.util.Map<String, String>>) request.getSession().getAttribute("children")).get(i).get("family_history")%>" placeholder="Digite o histórico familiar" required/>
                                    </div>
                                    
                                    <div class="form-group col-md-6">
                                        <label for="name">Histórico patológico</label>
                                        <input type="text" name="pathology_history" id="pathology_history" class="form-control" value="<%=((java.util.ArrayList<java.util.Map<String, String>>) request.getSession().getAttribute("children")).get(i).get("pathology_history")%>" placeholder="Digite o histórico patológico" required/>
                                    </div>
                                    
                                    <div class="form-group col-md-6">
                                        <label for="birthdate">Data de nascimento</label>
                                        <input type="date" name="birthdate" id="birthdate" class="form-control" value="<%=((java.util.ArrayList<java.util.Map<String, String>>) request.getSession().getAttribute("children")).get(i).get("birthdate")%>" placeholder="DD/MM/AAAA" aria-describedby="small-birthdate"/>
                                    </div>
                                    
                                    <div class="form-group col-md-6">
                                       <label for="sex">Sexo</label>
                                        <select name="sex" id="sex" class="form-control">
                                            <option value="">- Selecione -</option>
                                            <option value="F" <% if(((java.util.ArrayList<java.util.Map<String, String>>) request.getSession().getAttribute("children")).get(i).get("sex").equals("F")){ %> Selected <%  } %>>Feminino</option>
                                            <option value="M" <% if(((java.util.ArrayList<java.util.Map<String, String>>) request.getSession().getAttribute("children")).get(i).get("sex").equals("M")){ %> Selected <% } %>>Masculino</option>
                                        </select>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Voltar</button>
                            <button type="button" form="ChildrenFormId-<%=((java.util.ArrayList<java.util.Map<String, String>>) request.getSession().getAttribute("children")).get(i).get("id")%>" class="btn btn-success" data-dismiss="modal">Atualizar</button>
                        </div>
                    </div>
                </div>
            </div>
        <% } %> 
    </div>
</div>

<jsp:include page="/inc/footer.jsp" />