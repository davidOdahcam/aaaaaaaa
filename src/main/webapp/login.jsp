<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="./inc/header.jsp" >
  	<jsp:param name="title" value="Login" />
</jsp:include>

<div class="container">
    <div class="content">
        <form action="./login" method="POST" class="form">
            <header class="content-header">
                <h2 class="content-header-title">Formulário de login</h2>
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
            
            <small class="d-block pt-2 text-center">Não possui cadastro? <a href="selecionar-perfil.jsp">Crie uma conta</a></small>
        </form>
    </div>
</div>

<jsp:include page="./inc/footer.jsp" />