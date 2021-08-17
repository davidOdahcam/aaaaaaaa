<jsp:include page="/inc/header.jsp" >
  	<jsp:param name="title" value="Cadastrar odontopediatra" />
</jsp:include>

<div class="container">
    <div class="content">
        <form action="./crianca" method="POST" id="form" class="form">
            <header class="content-header">
                <h2 class="content-header-title">Cadastro da crian�a</h2>
				<input type="hidden" name="type" value="crianca" />
            </header>
			
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="name">Nome</label>
                    <input type="text" name="name" id="name" class="form-control" value="" placeholder="Digite o nome" required/>
                    <small class="text-danger"></small>
                </div>
                
                 <div class="form-group col-md-6">
                    <label for="name">CPF</label>
                    <input type="text" name="cpf" id="cpf" class="form-control" value="" placeholder="Digite o CPF" required/>
                    <small class="text-danger"></small>
                </div>
                
                 <div class="form-group col-md-6">
                    <label for="name">Histórico familiar</label>
                    <input type="text" name="family_history" id="family_history" class="form-control" value="" placeholder="Digite o histórico familiar" required/>
                    <small class="text-danger"></small>
                </div>
                
                <div class="form-group col-md-6">
                    <label for="name">Histórico patológico</label>
                    <input type="text" name="pathology_history" id="pathology_history" class="form-control" value="" placeholder="Digite o histórico patológico" required/>
                    <small class="text-danger"></small>
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
            
            <button type="submit" class="btn btn-color-3 btn-lg btn-block mt-4">Cadastrar</button>
            
            <hr>
        </form>
    </div>
</div>

<jsp:include page="/inc/footer.jsp" />