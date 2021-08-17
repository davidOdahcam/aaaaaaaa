<jsp:include page="./inc/header.jsp" >
  	<jsp:param name="title" value="Login" />
</jsp:include>

<div class="container">
    <div class="content">
           <header class="content-header">
               <h2 class="content-header-title">Sobre o trabalho</h2>
           </header>
                 
           <p>O trabalho é referente à materia WEB 2 do curso de Sistemas de Informação da UFRRJ</p>
           <p>Para acessar a aplicação é necessário realizar <a href="./login">login</a>!</p>
           <p>Não possui uma conta? <a href="#" data-toggle="modal" data-target="#chooseProfileType">Crie uma agora</a>!</p>
           
           <button class="btn btn-color-3 btn-block btn-lg mt-4">Entrar</button>
        	
    </div>
    
    <div id="modals">
    	<div class="modal fade" id="chooseProfileType" tabindex="-1" role="dialog" aria-labelledby="chooseProfileTypeLabel" aria-hidden="true">
	        <div class="modal-dialog modal-lg" role="document">
	            <div class="modal-content">
	                <div class="modal-header bg-gradient-danger">
	                    <h2 class="container-title mb-0">Eu sou um...</h2>
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
					                <h3 class="title">Responsável</h3>
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