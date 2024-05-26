<%--
  Created by IntelliJ IDEA.
  User: USUARIO
  Date: 26/05/2024
  Time: 01:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    // Verificamos la sesion
    HttpSession ses = request.getSession();
    boolean is_valid_user = false;
    if (ses.getAttribute("is_valid_user") != null) {
        is_valid_user = (boolean) ses.getAttribute("is_valid_user");
    }else{
        is_valid_user = false;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="icon" href="img/logosuperior.jpg" type="image/jpeg">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>
    <link rel="stylesheet" href="bulma/css/bulma.css">
    <style>
        html{
            zoom: 120%;
        }
        body {
            background-color: #1F2739;
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
            height: 100vh;
            margin: 0;
            font-family: 'Arial', sans-serif;
        }
        .container {
            padding: 2rem;
        }
        .title {
            color: #00ADEF;
            font-size: 2rem;
            text-align: center;
            margin-bottom: 2rem;
        }
        .options {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
        }
        .box {
            text-align: center;
            background-color: rgba(255, 255, 255, 0.1);
            padding: 1.5rem;
            border-radius: 10px;
            margin: 1rem;
            display: flex;
            flex-direction: column;
            align-items: center;
            transition: transform 0.2s;
            position: relative;
        }
        .box img {
            width: 100px;
            height: 100px;
            display: block;
            margin: 0 auto;
            border: 2px solid #00ADEF;
            border-radius: 50%;
            padding: 10px;
        }
        .box p {
            color: #FFFFFF;
            font-weight: bold;
            margin-top: 1rem;
            text-align: center;
        }
        .box:hover {
            transform: scale(1.05);
            box-shadow: 0 0 20px rgba(0, 173, 239, 0.7);
        }
        .paso {
            position: absolute;
            top: 0.25rem;
            right: 0.25rem;
            background-color: #FFFFFF;
            color: #00ADEF;
            font-size: 1rem;
            font-weight: bold;
            padding: 0.4rem;
            border-radius: 500%;
        }
    </style>
</head>
<% if (is_valid_user) { %>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Dashboard</a>
        <button class="navbar-toggler" type="button" data-mdb-toggle="collapse" data-mdb-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="logout.jsp">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container">
    <h1 class="title">Aplicación de Registro de Depósitos</h1>
    <div class="options">
        <div class="box">
            <span class="paso">1</span>
            <a href="RegistrarChanchita.jsp">
                <img src="img/RegistrarChanchita.png" alt="Registrar Chanchita">
            </a>
            <p>Registrar Chanchita</p>
        </div>
        <div class="box">
            <span class="paso">2</span>
            <a href="RegistrarDeposito.jsp">
                <img src="img/Chanchita.jpg" alt="Registrar Mini Depósito">
            </a>
            <p>Registrar Mini Depósito</p>
        </div>
        <div class="box">
            <span class="paso">3</span>
            <a href="BuscarChanchita.jsp">
                <img src="img/buscarChanchita.jpg" alt="Buscar Chanchita">
            </a>
            <p>Buscar Chanchita</p>
        </div>

    </div>
</div>
</body>
</html>

<% }else{ %>
<% response.sendRedirect("index.jsp"); %>
<% } %>