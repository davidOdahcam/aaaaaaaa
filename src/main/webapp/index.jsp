<jsp:include page="./inc/header.jsp" >
  	<jsp:param name="title" value="Login" />
</jsp:include>

<div class="container">
    <div class="content">
        <form action="./login" method="POST" class="form">
            <header class="content-header">
                <h2 class="content-header-title">Formul�rio de login</h2>
            </header>
            
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" name="email" id="email" class="form-control" placeholder="Digite seu email" required autofocus/>
                <!-- <small class="text text-danger">Erro</small> -->
            </div>
            
            <div class="form-group">
                <label for="password">Senha</label>
                <input type="password" name="password" id="password" class="form-control" placeholder="********" required/>
                <!-- <small class="text text-danger">Erro</small> -->
            </div>
            <button class="btn btn-color-3 btn-block btn-lg mt-4">Entrar</button>
            
            <hr>
            
            <small class="d-block pt-2 text-center">N�o possui cadastro? <a href="#" data-toggle="modal" data-target="#chooseProfileType">Crie uma conta</a></small>
        </form>
    </div>
    
    <div id="modals">
    	<div class="modal fade" id="chooseProfileType" tabindex="-1" role="dialog" aria-labelledby="chooseProfileTypeLabel" aria-hidden="true">
	        <div class="modal-dialog modal-lg" role="document">
	            <div class="modal-content">
	                <div class="modal-header bg-gradient-danger">
	                    <h2 class="container-title">Eu sou um...</h2>
	                    <button type="button" class="close text-dark" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">&times;</span>
	                    </button>
	                </div>
	                <div class="modal-body">
					    <div class="row">
					        <div class="col-md-5 ml-md-5">
					            <a href="./cadastrar?odontopediatra" class="card card-register">
					                <img src="<%= request.getContextPath() %>/public/assets/images/responsavel.png" alt="Admin" class="rounded-circle">
					                <h3 class="title">Odontopediatra</h3>
					            </a>
					        </div>
					
					        <div class="col-md-5 ml-auto mr-md-5">
					            <a href="./cadastrar?responsavel" class="card card-register">
					                <img src="<%= request.getContextPath() %>/public/assets/images/responsavel.png" alt="Admin" class="rounded-circle">
					                <h3 class="title">Respons�vel</h3>
					            </a>
					        </div>
					    </div>
	                </div>
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Voltar</button>
	                </div>
	            </div>
	        </div>
	    </div>
    </div>
</div>

<jsp:include page="./inc/footer.jsp" />