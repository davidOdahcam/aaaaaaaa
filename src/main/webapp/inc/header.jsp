<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="<%= request.getContextPath() %>/public/assets/css/style.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/public/assets/css/toastr.min.css">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <title>${param.title}</title>
</head>

<body>
    <div class="page-wrapper">
		<header class="header">
		    <div class="container">
		        <div class="header-content">
		            <a href="<%= request.getContextPath() %>/"><img src="./public/assets/images/ufrrj-white.svg" alt="Logotipo da UFRRJ" class="logo"/></a>
                    <% if (request.getSession().getAttribute("user_id") != null) { %>
                        <form action="./logout" method="POST" id="submit-form">
                            <a onclick="document.getElementById('submit-form').submit();" type="submit" class="ml-auto text-white mt-3">Logout</a>
                        </form>
                    <% } %>
                    
		        </div>
		    </div>
		</header>
		
		<main class="main">