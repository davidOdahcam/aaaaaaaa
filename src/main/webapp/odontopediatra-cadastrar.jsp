<jsp:include page="/inc/header.jsp" >
  	<jsp:param name="title" value="Cadastrar odontopediatra" />
</jsp:include>

<div class="container">
    <div class="content">
        <form action="./cadastrar" method="POST" id="form" class="form">
            <header class="content-header">
                <h2 class="content-header-title">Cadastro de odontopediatra</h2>
				<input type="hidden" name="type" value="odontopediatra" />
            </header>
			
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="name">Nome</label>
                    <input type="text" name="name" id="name" class="form-control" value="" placeholder="Digite seu nome" aria-describedby="small-email" required/>
                    <small class="text-danger"></small>
                </div>

                <div class="form-group col-md-6">
                    <label for="cpf">CPF</label>
                    <input onfocus="unmask(this)" onblur="mask(this, '###.###.###-##')" onkeyup="numeric(this)" type="text" name="cpf" id="cpf" class="form-control" value="" placeholder="Digite seu CPF" aria-describedby="small-cpf" required/>
                    <small class="text text-danger"></small>
                </div>

                <div class="form-group col-md-6">
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email" class="form-control" value="" placeholder="Digite seu email" aria-describedby="small-email" required/>
                    <small class="text text-danger"></small>
                </div>
                
                <div class="form-group col-md-6">
                    <label for="password">Senha</label>
                    <input type="password" name="password" id="password" class="form-control" placeholder="********" aria-describedby="small-password" required/>
                    <small class="text text-danger"></small>
                </div>
                
                 <div class="form-group col-md-6">
                    <label for="confirm_password">Confirmar senha</label>
                    <input type="password" name="confirm_password" id="confirm_password" class="form-control" placeholder="********" aria-describedby="small-confirm_password" required/>
                    <small class="text text-danger"></small>
                </div>
                
                <div class="form-group col-md-6">
                    <label for="cro">CRO</label>
                    <input type="text" name="cro" id="cro" class="form-control" value="" placeholder="Digite seu CRO" aria-describedby="small-cro" required/>
                    <small class="text text-danger"></small>
                </div>           

                <div class="form-group col-md-6">
                    <label for="cep">CEP</label>
                    <input type="text" name="zip_code" id="cep" class="form-control" value="" placeholder="Digite seu CEP" aria-describedby="small-cep" required/>
                    <small class="text text-danger"></small>
                </div>

                <div class="form-group col-md-6">
                    <label for="street">Rua</label>
                    <input type="text" name="street" id="street" class="form-control" value="" placeholder="Digite sua rua" aria-describedby="small-street" required/>
                    <small class="text text-danger"></small>
                </div>

                <div class="form-group col-md-6">
                    <label for="number">Número</label>
                    <input type="text" name="number" id="number" class="form-control" value="" placeholder="Digite o número de sua casa" aria-describedby="small-number" required/>
                    <small class="text text-danger"></small>
                </div>

                <div class="form-group col-md-6">
                    <label for="neighborhood">Bairro</label>
                    <input type="text" name="neighborhood" id="neighborhood" class="form-control" value="" placeholder="Digite seu bairro" aria-describedby="small-neighborhood" required/>
                    <small class="text text-danger"></small>
                </div>
                
                <div class="form-group col-md-6">
                    <label for="complement">Complemento</label>
                    <input type="text" name="complement" id="complement" class="form-control" value="" placeholder="Digite seu complemento" aria-describedby="small-complement"/>
                    <small class="text text-danger"></small>
                </div>
                
                <div class="form-group col-md-6">
                    <label for="phone">Telefone</label>
                    <input onkeyup="numeric(this)" type="text" name="phone" id="phone" class="form-control" value="" placeholder="Digite seu telefone" required aria-describedby="small-phone"/>
                    <small class="text text-danger"></small>
                </div>
                
                <div class="form-group col-md-6">
                    <label for="birthdate">Data de nascimento</label>
                    <input type="date" name="birthdate" id="birthdate" class="form-control" value="" placeholder="DD/MM/AAAA" aria-describedby="small-birthdate"/>
                    <small class="text text-danger"></small>
                </div>
                
                <div class="form-group col-md-6">
                   <label for="sex">Sexo</label>
                    <select name="sex" id="sex" class="form-control">
                        <option value="">- Selecione -</option>
                        <option value="F">Feminino</option>
                        <option value="M">Masculino</option>
                        <option value="O">Outro</option>
                    </select>
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