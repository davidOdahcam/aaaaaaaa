<jsp:include page="/inc/header.jsp" >
  	<jsp:param name="title" value="Selecionar perfil" />
</jsp:include>

<div class="container">
    <h2 class="container-title">Eu sou um...</h2>

    <div class="row">
        <div class="col-md-6">
            <a href="odontopediatra-cadastrar.jsp" class="card card-register">
                <img src="<%= request.getContextPath() %>/public/assets/images/responsavel.png" alt="Admin" class="rounded-circle">
                <h3 class="title">Odontopediatra</h3>
            </a>
        </div>

        <div class="col-md-6">
            <a href="responsavel-cadastrar.jsp" class="card card-register">
                <img src="<%= request.getContextPath() %>/public/assets/images/responsavel.png" alt="Admin" class="rounded-circle">
                <h3 class="title">Responsável</h3>
            </a>
        </div>
    </div>
</div>

<jsp:include page="/inc/footer.jsp" />