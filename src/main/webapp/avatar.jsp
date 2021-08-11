<jsp:include page="./inc/header.jsp" >
  	<jsp:param name="title" value="Avatar" />
</jsp:include>

<div class="container">
    <div class="content">

        <div id="avatar">
            <object id="skin-object" data="<%= request.getContextPath() %>/public/assets/avatar/skin.svg" type="image/svg+xml" class="skin w-100"></object>
            <object id="hair-object" data="<%= request.getContextPath() %>/public/assets/avatar/hair-1.svg" type="image/svg+xml" class="hair w-100"></object>
            <object id="eye-object" data="<%= request.getContextPath() %>/public/assets/avatar/eye-1.svg" type="image/svg+xml" class="eye w-100"></object>
            <object id="mouth-object" data="<%= request.getContextPath() %>/public/assets/avatar/mouth.svg" type="image/svg+xml" class="mouth w-100"></object>
        </div>

        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="hair">Cabelo</label>
                <select name="hair" id="hair" class="form-control">
                    <option value="0" selected>- Selecione um cabelo -</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                </select>
            </div>
            
            <div class="form-group col-md-6">
                <label for="hair_color">Cor do cabelo</label>
                <input type="color" name="hair_color" id="hair_color" class="form-control">
            </div>
            
            <div class="form-group col-md-6">
                <label for="eye">Olho</label>
                <select name="eye" id="eye" class="form-control">
                    <option value="0">- Selecione um olho -</option>
                    <option value="1" selected>1</option>
                </select>
            </div>
            
            <div class="form-group col-md-6">
                <label for="eye_color">Cor dos olhos</label>
                <input type="color" name="eye_color" id="eye_color" class="form-control">
            </div>
        </div>
            
        <button type="button" id="download" class="btn btn-info">Download</button>
    </div>
</div>

<jsp:include page="./inc/footer.jsp" />