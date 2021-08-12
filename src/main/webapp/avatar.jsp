<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="./inc/header.jsp" >
  	<jsp:param name="title" value="Avatar" />
</jsp:include>

<div class="container">
    <div class="content">
    
    	<header class="content-header">
            <h2 class="content-header-title">Criar Avatar</h2>
        </header>

        <div id="avatar">
            <object id="skin-object" data="<%= request.getContextPath() %>/public/assets/avatar/skin.svg" type="image/svg+xml" class="skin w-100"></object>
			<object id="clothes-object" data="<%= request.getContextPath() %>/public/assets/avatar/clothes.svg" type="image/svg+xml" class="clothes w-100"></object>
            <object id="hair-object" data="<%= request.getContextPath() %>/public/assets/avatar/hair-0.svg" type="image/svg+xml" class="hair w-100"></object>
            <object id="eye-object" data="<%= request.getContextPath() %>/public/assets/avatar/eye-0.svg" type="image/svg+xml" class="eye w-100"></object>
            <object id="mouth-object" data="<%= request.getContextPath() %>/public/assets/avatar/mouth-0.svg" type="image/svg+xml" class="mouth w-100"></object>
        </div>

		<div class="row">
	        <div class="col-md-6">
	            <div class="form-group">
	                <label for="hair">Cabelo</label>
	                <select name="hair" id="hair" class="form-control">
	                    <option value="0" selected>- Selecione um cabelo -</option>
	                    <option value="1">Afro</option>
	                    <option value="2">Liso</option>
	                    <option value="3">Ondularo</option>
	                    <option value="4">Arrepiado</option>
	                </select>
	            </div>
	            
	            <div class="form-group">
	                <label for="eye">Olho</label>
	                <select name="eye" id="eye" class="form-control">
	                    <option value="0">- Selecione um olho -</option>
	                    <option value="1" selected>Tipo 1</option>
	                </select>
	            </div>
	
	            <div class="form-group">
	                <label for="mouth">Boca</label>
	                <select name="mouth" id="mouth" class="form-control">
	                    <option value="0">- Selecione uma boca -</option>
	                    <option value="1">Feliz</option>
	                    <option value="2">Triste</option>
	                    <option value="3">Sorrindo</option>
	                    <option value="4">Chorando</option>
	                </select>
	            </div>
	        </div>
	
	        <div class="col-md-6">
	        	<div class="form-group">
	                <label for="skin_color">Cor da pele</label>
	                <input type="color" name="skin_color" id="skin_color" class="form-control">
	            </div>
	            
	        	<div class="form-group">
	                <label for="clothes_color">Cor da roupa</label>
	                <input type="color" name="clothes_color" id="clothes_color" class="form-control">
	            </div>
	            <div class="form-group">
	                <label for="hair_color">Cor do cabelo</label>
	                <input type="color" name="hair_color" id="hair_color" class="form-control">
	            </div>
	
	            <div class="form-group">
	                <label for="eye_color">Cor dos olhos</label>
	                <input type="color" name="eye_color" id="eye_color" class="form-control">
	            </div>
	        </div>
	    </div>

        <button type="button" id="download" class="btn btn-info">Download</button>
    </div>
</div>

<jsp:include page="./inc/footer.jsp" />