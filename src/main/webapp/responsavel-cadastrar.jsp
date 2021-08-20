<jsp:include page="/inc/header.jsp" >
  	<jsp:param name="title" value="Cadastrar responsável" />
</jsp:include>

<div class="container">
    <div class="content">
        <form action="./cadastrar" method="POST" id="form" class="form">
            <header class="content-header">
                <h2 class="content-header-title">Cadastro de responsável</h2>
                <input type="hidden" name="type" value="responsavel" />
            </header>

            <div class="form-row">
                <div class="form-group col-md-12">
                    <label for="name">Nome</label>
                    <input type="text" name="name" id="name" class="form-control" placeholder="Digite seu nome" required/>
                    <small class="text-danger"></small>
                </div>

                <div class="form-group col-md-6">
                    <label for="cpf">CPF</label>
                    <input onfocus="unmask(this)" onblur="mask(this, '###.###.###-##')" onkeyup="numeric(this)" type="text" name="cpf" id="cpf" class="form-control" placeholder="Digite seu CPF" required/>
                    <small class="text text-danger"></small>
                </div>

                <div class="form-group col-md-6">
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email" class="form-control" placeholder="Digite seu email" required />
                    <small class="text text-danger"></small>
                </div>
                
                <div class="form-group col-md-6">
                    <label for="password">Senha</label>
                    <input type="password" name="password" id="password" class="form-control" placeholder="********" required />
                    <small class="text text-danger"></small>
                </div>
                
                <div class="form-group col-md-6">
                    <label for="confirm_password">Confirmar senha</label>
                    <input type="password" name="confirm_password" id="confirm_password" class="form-control" placeholder="********" required />
                    <small class="text text-danger"></small>
                </div>
                
                <div class="form-group col-md-6">
                    <label for="sex">Sexo</label>
                    <select name="sex" id="sex" class="form-control">
                        <option value="">- Selecione -</option>
                        <option value="F">Feminino</option>
                        <option value="M">Masculino</option>
                    </select>
                    <small class="text text-danger"></small>
                </div>
                
                <div class="form-group col-md-6">
                    <label for="profession">Profissão</label>
                    <input type="text" name="profession" id="profession" class="form-control" placeholder="Digite sua profiss�o" required />
                    <small class="text text-danger"></small>
                </div>

                <div class="form-group col-md-6">
                    <label for="cep">CEP</label>
                    <input type="text" name="cep" id="cep" class="form-control" placeholder="Digite seu CEP" required />
                    <small class="text text-danger"></small>
                </div>

                <div class="form-group col-md-6">
                    <label for="street">Rua</label>
                    <input type="text" name="street" id="street" class="form-control" placeholder="Digite sua Rua" required />
                    <small class="text text-danger"></small>
                </div>

                <div class="form-group col-md-6">
                    <label for="number">Número</label>
                    <input type="text" name="number" id="number" class="form-control" placeholder="Digite o n�mero de sua casa" required />
                    <small class="text text-danger"></small>
                </div>

                <div class="form-group col-md-6">
                    <label for="neighborhood">Bairro</label>
                    <input type="text" name="neighborhood" id="neighborhood" class="form-control" placeholder="Digite seu bairro" required />
                    <small class="text text-danger"></small>
                </div>
                
                <div class="form-group col-md-6">
                    <label for="birthdate">Data de nascimento</label>
                    <input type="date" name="birthdate" id="birthdate" class="form-control" placeholder="DD/MM/AAAA" />
                    <small class="text text-danger"></small>
                </div>
                
                <div class="form-group col-md-6">
                    <label for="phone">Telefone</label>
                    <input onkeyup="numeric(this)" type="text" name="phone" id="phone" class="form-control" placeholder="Digite seu telefone" required />
                    <small class="text text-danger"></small>
                </div>
            </div>
            
            <button onclick="validate()" type="button" class="btn btn-color-3 btn-lg btn-block mt-4">Cadastrar</button>
            
            <hr>
            
            <small class="d-block pt-2 text-center">Já possui cadastro? <a href="./login">Entre com uma conta</a></small>
        </form>
    </div>
</div>

<jsp:include page="/inc/footer.jsp" />