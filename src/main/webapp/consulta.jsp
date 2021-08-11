<jsp:include page="./inc/header.jsp" >
  	<jsp:param name="title" value="Login" />
</jsp:include>

<div class="container">
    <div class="content">
        <h3 id="title">Pergunta número 1</h3>
        <div id="container-consulta" class="row">
            <div onclick="imgSelected(1)" class="col-12 col-md-5 border mt-3 ml-md-5 img-container">

            </div>
            <div onclick="imgSelected(2)" class="col-12 col-md-5 border mt-3 mr-md-5 ml-auto img-container">

            </div>
        </div>
        <form id="form-hidden">
            <input type="text" id="input-state-1" value="0" hidden>
            <input type="text" id="input-state-2" value="0" hidden>
            <input type="text" id="input-state-3" value="0" hidden>
            <input type="text" id="input-state-4" value="0" hidden>
            <input type="text" id="input-state-5" value="0" hidden>
            <input type="text" id="input-state-6" value="0" hidden>
            <input type="text" id="input-state-7" value="0" hidden>
            <input type="text" id="input-state-8" value="0" hidden>
        </form>
        <div class="row">
            <a href="" class="btn btn-danger mt-3 ml-md-5" id="btn-cancel">Cancelar</a>
            <button onclick="imgSelected('voltar')" class="btn btn-danger mt-3 ml-md-5" id="btn-back">Voltar</button>
            <button onclick="imgSelected('pular')" class="btn btn-info mt-3 mr-md-5 ml-auto" id="btn-jump">Pular</button>
            <button form="form-hidden" type="submit" class="btn btn-success mt-3 mr-md-5 ml-auto" id="btn-submit">Enviar</button>
        </div>


    </div>
</div>

<jsp:include page="./inc/footer.jsp" />