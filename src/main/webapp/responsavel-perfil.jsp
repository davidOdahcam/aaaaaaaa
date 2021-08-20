<jsp:include page="/inc/header.jsp" >
  	<jsp:param name="title" value="Cadastrar odontopediatra" />
</jsp:include>

<div class="container">
	<% 
		java.util.Map<String, String> responsible = (java.util.Map<String, String>) request.getSession().getAttribute("responsible");
		java.util.ArrayList<java.util.Map<String, String>> children = (java.util.ArrayList<java.util.Map<String, String>>) request.getSession().getAttribute("children");
	%>
    <div class="main-body">
        <div class="row">
            <div class="col-md-4 mb-3">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex flex-column align-items-center text-center">
                            <img src="<%= request.getContextPath() %>/public/assets/images/responsavel.png" alt="Admin" class="rounded-circle" width="150">
                            <div class="mt-3">
                                <h4><%= responsible.get("name") %></h4>
                                <p class="text-secondary mb-3">Responsï¿½vel</p>
                                <form action="crianca-cadastrar.jsp" method="get">
                                	<a href="./crianca" class="btn btn-primary">Cadastrar Filho(a)</a>
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
                                <span><%= responsible.get("name") %></span>
                            </div>
                        </div>
                        <div class="row pt-3 pb-1 border-bottom">
                            <div class="col-sm-3">
                                <h6 class="mb-0">CPF:</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <span><%= responsible.get("cpf") %></span>
                            </div>
                        </div>
                        <div class="row pt-3 pb-1 border-bottom">
                            <div class="col-sm-3">
                                <h6 class="mb-0">E-mail:</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <span><%= responsible.get("email") %></span>
                            </div>
                        </div>
                        <div class="row pt-3 pb-1 border-bottom">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Telefone:</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <span><%= responsible.get("phone") %></span>
                            </div>
                        </div>
                        <div class="row pt-3 pb-1 border-bottom">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Profissï¿½o:</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <span><%= responsible.get("profession") %></span>
                            </div>
                        </div>
                        <div class="row pt-3 pb-1 border-bottom">
                            <div class="col-sm-3">
                                <h6 class="mb-0">CEP:</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <span><%= responsible.get("zip_code") %></span>
                            </div>
                        </div>
                        <div class="row pt-3 pb-1 border-bottom">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Endereï¿½o</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <span><%= responsible.get("neighborhood") %></span>,
                                <span><%= responsible.get("street") %></span> -
                                <span><%= responsible.get("number") %></span>,
                               	<% if(responsible.get("complement") != null) { %><span><%= responsible.get("complement") %></span>,<% } %>
                                
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
                            <% for(int i = 0; i < children.size(); i++) { %>
                            	<div class="col-md-4 mb-3">
	                                <div data-id="<%= children.get(i).get("id") %>" class="card child-card">
	                                    <div style="position: relative" class="card-body">
	                                    	<button id="delete-child-<%= children.get(i).get("id") %>" type="button" class="close text-danger delete-child" data-toggle="modal" data-target="#delete-child-<%= children.get(i).get("id") %>-modal" style="display: none; position: absolute">
						                        <span>&times;</span>
						                    </button>
	                                        <div class="d-flex flex-column align-items-center text-center">
	                                   			<% if(children.get(i).get("path_avatar") != null) { %>
		                                            <img src="<%= request.getContextPath() %>/public/assets/images/responsavel.png" alt="Admin"
		                                                class="rounded-circle" width="150">
	                                   			<% } else if(children.get(i).get("sex") != null && children.get(i).get("sex").equals("M")) { %>
	                                                <img src="<%= request.getContextPath() %>/public/assets/images/boy.png" alt="Admin"
	                                                	class="rounded-circle" width="150">
                                                <% } else { %>
	                                                <img src="<%= request.getContextPath() %>/public/assets/images/girl.png" alt="Admin"
	                                                	class="rounded-circle" width="150">
                                                <% } %>
	                                            <div class="mt-3">
	                                                <h4><%= children.get(i).get("name") %></h4>
	                                         		<p class="text-secondary mb-3"><%= children.get(i).get("sex") %></p>
	                                                <button id="<%= children.get(i).get("id") %>" class="btn btn-primary" data-toggle="modal" data-target="#editChildrenId-<%= children.get(i).get("id") %>">Perfil</button>
	                                                <a href="./avatar?id=<%= children.get(i).get("id") %>" class="btn btn-primary">Avatar</a> 
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
					    <form action="" id="form-edit" method="POST">
                            <input type="text" name="id" value="<%= responsible.get("id") %>" hidden>
                            <input type="text" name="type" value="responsavel" hidden>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="name">Nome</label>
                                    <input type="text" name="name" id="name" value="<%= responsible.get("name") %>" class="form-control" placeholder="Digite seu nome" required/>
                                    <small class="text-danger"></small>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="email">E-mail</label>
                                    <input type="text" name="email" id="email" value="<%= responsible.get("email") %>" class="form-control" placeholder="Digite seu email" required/>
                                    <small class="text-danger"></small>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="phone">Telefone</label>
                                    <input type="text" name="phone" id="phone" value="<%= responsible.get("phone") %>" class="form-control" placeholder="Digite seu Telefone" required/>
                                    <small class="text-danger"></small>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="cep">CEP</label>
                                    <input type="text" name="cep" id="cep" value="<%= responsible.get("zip_code") %>" class="form-control" placeholder="Digite seu CEP" required/>
                                    <small class="text-danger"></small>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="neighborhood">Bairro</label>
                                    <input type="text" name="neighborhood" id="neighborhood" value="<%= responsible.get("neighborhood") %>" class="form-control" placeholder="Digite seu Bairro" required/>
                                    <small class="text-danger"></small>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="street">Rua</label>
                                    <input type="text" name="street" id="street" value="<%= responsible.get("street") %>" class="form-control" placeholder="Digite sua Rua" required/>
                                    <small class="text-danger"></small>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="complement">Complemento</label>
                                    <input type="text" name="complement" id="complement" value="<%= responsible.get("complement") != null ? responsible.get("complement") : "" %>" class="form-control" placeholder="Digite seu Complemento" required/>
                                    <small class="text-danger"></small>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="number">Número</label>
                                    <input type="text" name="number" id="number" value="<%= responsible.get("number") %>" class="form-control" placeholder="Digite seu Nï¿½mero" required/>
                                    <small class="text-danger"></small>
                                </div>
                            </div>
                        </form>
	                </div>
	                <div class="modal-footer">
	                    
	                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Voltar</button>
                        <button type="button" onclick="editResponsible()" class="btn btn-success">Editar</button>
	                </div>
	            </div>
	        </div>
	    </div>
        
        <% for(int i = 0; i < children.size(); i++) { %>
            <div class="modal fade" id="editChildrenId-<%= children.get(i).get("id")%>" tabindex="-1" role="dialog" aria-labelledby="editProfileTypeLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header bg-gradient-danger">
                            <h2 class="container-title mb-0">Edite o perfil de seu filho(a)</h2>
                            <button type="button" class="close text-dark" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="./crianca" method="POST" id="ChildrenFormId-<%= children.get(i).get("id") %>" class="form">       
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                       <label for="name">Nome</label>
                                       <input type="text" name="name" id="name" class="form-control" value="<%= children.get(i).get("name") %>" placeholder="Digite o nome" required/>
                                    </div>
                                    
                                     <div class="form-group col-md-6">
                                       <label for="cpf">CPF</label>
                                       <input type="text" name="cpf" id="cpf" class="form-control" value="<%= children.get(i).get("cpf") %>" placeholder="Digite o CPF"/>
                                    </div>
                                    
                                     <div class="form-group col-md-6">
                                       <label for="family_history">Histï¿½rico familiar</label>
                                       <input type="text" name="family_history" id="family_history" class="form-control" value="<%= children.get(i).get("family_history") %>" placeholder="Digite o histÃ³rico familiar"/>
                                    </div>
                                    
                                    <div class="form-group col-md-6">
                                       <label for="pathology_history">Histï¿½rico patolï¿½gico</label>
                                       <input type="text" name="pathology_history" id="pathology_history" class="form-control" value="<%= children.get(i).get("pathology_history") %>" placeholder="Digite o histÃ³rico patolÃ³gico"/>
                                    </div>
                                    
                                    <div class="form-group col-md-6">
                                       <label for="birthdate">Data de nascimento</label>
                                       <input required type="date" name="birthdate" id="birthdate" class="form-control" value="<%= children.get(i).get("birthdate") %>" placeholder="DD/MM/AAAA" aria-describedby="small-birthdate"/>
                                    </div>
                                    
                                    <div class="form-group col-md-6">
                                       <label for="sex">Sexo</label>
                                       <select name="sex" id="sex" class="form-control">
                                           <option value="">- Selecione -</option>
                                           <option value="F" <% if(children.get(i).get("sex").equals("F")) { %> selected <% } %>>Feminino</option>
                                           <option value="M" <% if(children.get(i).get("sex").equals("M")) { %> selected <% } %>>Masculino</option>
                                       </select>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">   
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Voltar</button>
                            <button type="button" data-id="<%= children.get(i).get("id") %>" form="ChildrenFormId-<%= children.get(i).get("id") %>" class="btn btn-success edit-child">Atualizar</button>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="modal fade" id="delete-child-<%= children.get(i).get("id")%>-modal" tabindex="-1" role="dialog" aria-labelledby="delete-child-<%= children.get(i).get("id")%>-modal-Label" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header bg-danger">
                            <h2 class="text-white mb-0">Remover filho(a)?</h2>
                            <button type="button" class="close text-dark" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>Deseja realmente remover <strong><%= children.get(i).get("name")%></strong> da sua lista de filhos cadastrados?</p>
                            <p>Esta operação não tem volta, mas caso queira é sempre possível realizar novamente o cadastro do seu filho!</p>
                        </div>
                        <div class="modal-footer">   
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Voltar</button>
                            <button type="button" data-id="<%= children.get(i).get("id") %>" class="btn btn-success delete-child-btn">Remover</button>
                        </div>
                    </div>
                </div>
            </div>
        <% } %> 
    </div>
</div>

<jsp:include page="/inc/footer.jsp" />