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
                            <img src="https://www.bootdey.com/img/Content/avatar/avatar2.png" alt="Admin" class="rounded-circle" width="150">
                            <div class="mt-3">
                                <h4><%=  ((java.util.Map<String, String>) request.getSession().getAttribute("responsible")).get("name") %></h4>
                                <p class="text-secondary mb-3">Respons·vel</p>
                                <button class="btn btn-primary">Cadastrar Filho(a)</button>
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
                                <h6 class="mb-0">Profiss„o:</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <span><%= ((java.util.Map<String, String>) request.getSession().getAttribute("responsible")).get("profession") %></span>
                            </div>
                        </div>
                        <div class="row pt-3 pb-1 border-bottom">
                            <div class="col-sm-3">
                                <h6 class="mb-0">EndereÁo</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <span><%= ((java.util.Map<String, String>) request.getSession().getAttribute("responsible")).get("neighborhood") %></span>,
                                <span><%= ((java.util.Map<String, String>) request.getSession().getAttribute("responsible")).get("street") %></span>,
                                <span>COMPLEMENTO</span>,
                                <span><%= ((java.util.Map<String, String>) request.getSession().getAttribute("responsible")).get("number") %></span>
                                
                            </div>
                        </div>
                        <div class="row pt-4">
                            <div class="col-sm-12 d-flex justify-content-end">
                                <button class="btn btn-success">Editar</button>
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
                            <div class="col-md-4 mb-3">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="d-flex flex-column align-items-center text-center">
                                            <img src="https://www.bootdey.com/img/Content/avatar/avatar5.png" alt="Admin"
                                                class="rounded-circle" width="150">
                                            <div class="mt-3">
                                                <h4>Froyd da Silva</h4>
                                                <p class="text-secondary mb-3">Respons√°vel</p>
                                                <button class="btn btn-primary">Ver Perfil</button>
                                                <button class="btn btn-primary">Ver Avatar</button> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="d-flex flex-column align-items-center text-center">
                                            <img src="https://www.bootdey.com/img/Content/avatar/avatar6.png" alt="Admin"
                                                class="rounded-circle" width="150">
                                            <div class="mt-3">
                                                <h4>Matheus Ritton</h4>
                                                <p class="text-secondary mb-3">Respons√°vel</p>
                                                <button class="btn btn-primary">Ver Perfil</button>
                                                <button class="btn btn-primary">Ver Avatar</button> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="d-flex flex-column align-items-center text-center">
                                            <img src="https://www.bootdey.com/img/Content/avatar/avatar1.png" alt="Admin"
                                                class="rounded-circle" width="150">
                                            <div class="mt-3">
                                                <h4>Eduardo Pereira</h4>
                                                <p class="text-secondary mb-3">Respons√°vel</p>
                                                <button class="btn btn-primary">Ver Perfil</button>
                                                <button class="btn btn-primary">Ver Avatar</button> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/inc/footer.jsp" />