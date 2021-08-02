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
                            <img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Admin"
                                class="rounded-circle" width="150">
                            <div class="mt-3">
                                <h4>Victor Martins</h4>
                                <p class="text-secondary mb-3">Odontologista</p>
                                <button class="btn btn-primary">Cadastrar Paciente</button>
                                <button class="btn btn-outline-primary">Gerar Relatório</button>
                                <div class="input-group mt-3">
                                    <input type="text" class="form-control" placeholder="Buscar paciente" />
                                    <div class="input-group-append">
                                        <button id="client-btn" class="btn btn-primary">
                                            <i class="fa fa-search" aria-hidden="true"></i>
                                        </button>
                                    </div>
                                </div>
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
                                <span>Victor de Oliveira Martins Azevedo</span>
                            </div>
                        </div>
                        <div class="row pt-3 pb-1 border-bottom">
                            <div class="col-sm-3">
                                <h6 class="mb-0">CPF:</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <span>XXX.XXX.XXX-XX</span>
                            </div>
                        </div>
                        <div class="row pt-3 pb-1 border-bottom">
                            <div class="col-sm-3">
                                <h6 class="mb-0">E-mail:</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <span>victor2007azevedo@hotmail.com</span>
                            </div>
                        </div>
                        <div class="row pt-3 pb-1 border-bottom">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Telefone:</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <span>(21)99999-9999</span>
                            </div>
                        </div>
                        <div class="row pt-3 pb-1 border-bottom">
                            <div class="col-sm-3">
                                <h6 class="mb-0">CRO:</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <span>XXXXXXXXXX</span>
                            </div>
                        </div>
                        <div class="row pt-3 pb-1 border-bottom">
                            <div class="col-sm-3">
                                <h6 class="mb-0">Endereço</h6>
                            </div>
                            <div class="col-sm-9 text-secondary">
                                <span>Teresópolis</span>,
                                <span>Rio de Janeiro</span>,
                                <span>KM 30, Motas</span>,
                                <span>Nº: 125</span>
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
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="text-center">Visualizar as consultas do dia</h5>
                        <div class="input-group mt-3">
                            <input class="form-control" type="date" value="2021-07-29">
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body container-consultations">
                        <div class="row align-items-center py-2 border-bottom">
                            <div class="col-md-2 text-center">
                                <span>16:00</span>
                            </div>
                            <div class="col-md-6 text-center">
                                <a href="">Victor Martins</a>
                            </div>
                            <div class="col-md-4 d-flex justify-content-start">
                                <button class="btn btn-success">Consultar</button>
                                <button class="btn btn-danger ml-2">Desmarcar</button>
                            </div>
                        </div>
                        <div class="row align-items-center py-2 border-bottom">
                            <div class="col-md-2 text-center">
                                <span>17:00</span>
                            </div>
                            <div class="col-md-6 text-center">
                                <a href="">David dos Santos</a>
                            </div>
                            <div class="col-md-4 d-flex justify-content-start">
                                <button class="btn btn-success">Consultar</button>
                                <button class="btn btn-danger ml-2">Desmarcar</button>
                            </div>
                        </div>
                        <div class="row align-items-center py-2 border-bottom">
                            <div class="col-md-2 text-center">
                                <span>18:00</span>
                            </div>
                            <div class="col-md-6 text-center">
                                <a href="">Horario vago</a>
                            </div>
                            <div class="col-md-4 d-flex justify-content-start">
                                <button class="btn btn-info">Marcar consulta</button>
                            </div>
                        </div>
                        <div class="row align-items-center py-2 border-bottom">
                            <div class="col-md-2 text-center">
                                <span>19:00</span>
                            </div>
                            <div class="col-md-6 text-center">
                                <a href="">Pedro Raposo</a>
                            </div>
                            <div class="col-md-4 d-flex justify-content-start">
                                <button class="btn btn-success">Consultar</button>
                                <button class="btn btn-danger ml-2">Desmarcar</button>
                            </div>
                        </div>
                        <div class="row align-items-center py-2 border-bottom">
                            <div class="col-md-2 text-center">
                                <span>19:00</span>
                            </div>
                            <div class="col-md-6 text-center">
                                <a href="">Pedro Raposo</a>
                            </div>
                            <div class="col-md-4 d-flex justify-content-start">
                                <button class="btn btn-success">Consultar</button>
                                <button class="btn btn-danger ml-2">Desmarcar</button>
                            </div>
                        </div>
                        <div class="row align-items-center py-2 border-bottom">
                            <div class="col-md-2 text-center">
                                <span>19:00</span>
                            </div>
                            <div class="col-md-6 text-center">
                                <a href="">Pedro Raposo</a>
                            </div>
                            <div class="col-md-4 d-flex justify-content-start">
                                <button class="btn btn-success">Consultar</button>
                                <button class="btn btn-danger ml-2">Desmarcar</button>
                            </div>
                        </div>
                        <div class="row align-items-center py-2 border-bottom">
                            <div class="col-md-2 text-center">
                                <span>19:00</span>
                            </div>
                            <div class="col-md-6 text-center">
                                <a href="">Pedro Raposo</a>
                            </div>
                            <div class="col-md-4 d-flex justify-content-start">
                                <button class="btn btn-success">Consultar</button>
                                <button class="btn btn-danger ml-2">Desmarcar</button>
                            </div>
                        </div>
                        <div class="row align-items-center py-2 border-bottom">
                            <div class="col-md-2 text-center">
                                <span>19:00</span>
                            </div>
                            <div class="col-md-6 text-center">
                                <a href="">Pedro Raposo</a>
                            </div>
                            <div class="col-md-4 d-flex justify-content-start">
                                <button class="btn btn-success">Consultar</button>
                                <button class="btn btn-danger ml-2">Desmarcar</button>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/inc/footer.jsp" />