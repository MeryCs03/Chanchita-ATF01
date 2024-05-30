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
    } else {
        is_valid_user = false;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="icon" href="img/chanchita1.png" type="image/jpeg">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>
    <link rel="stylesheet" href="bulma/css/bulma.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            background-color: #edf5f8; /* Fondo de la página en un tono claro */
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            padding: 2rem;
        }
        .title {
            color: #2a9d8f; /* Color verde azulado para el título */
            font-size: 2rem;
            text-align: center;
            margin-bottom: 2rem;
            font-family: 'Roboto', sans-serif;
        }
        .options {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
        }
        .box {
            text-align: center;
            background-color: #a8dadc; /* Color azul claro para los cuadros */
            padding: 1.5rem;
            border-radius: 10px;
            margin: 1rem;
            display: flex;
            flex-direction: column;
            align-items: center;
            transition: transform 0.2s;
            position: relative;
            font-family: 'Roboto', sans-serif;
        }
        .box img {
            width: 120px;
            height: 120px;
            display: block;
            margin: 0 auto;
            border: 2px solid #457b9d; /* Borde azul oscuro para las imágenes */
            border-radius: 50%;
            padding: 10px;
            background-color: #ffffff;
        }
        .box p {
            color: #1d3557; /* Color azul oscuro para el texto */
            font-weight: bold;
            margin-top: 1rem;
            text-align: center;
            font-family: 'Roboto', sans-serif;
        }
        .box:hover {
            transform: scale(1.05);
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1); /* Sombra suave al hacer hover */
        }
        .paso {
            position: absolute;
            top: 0.25rem;
            right: 0.25rem;
            background-color: #ffffff;
            color: #457b9d; /* Color azul oscuro para los pasos */
            font-size: 1rem;
            font-weight: bold;
            padding: 0.4rem;
            border-radius: 50%;
            font-family: 'Roboto', sans-serif;
        }
        .navbar {
            background-color: #457b9d; /* Color azul oscuro para el menú de navegación */
            padding: 1rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
            font-family: 'Roboto', sans-serif;
        }
        .navbar-brand {
            display: flex;
            align-items: center;
        }
        .navbar-brand img {
            height: 50px;
            margin-right: 10px;
        }
        .navbar-brand a {
            color: #ffffff;
            font-size: 1.5rem;
            font-weight: bold;
            text-decoration: none;
        }
        .navbar-nav a {
            color: #ffffff;
            font-size: 1rem;
            text-decoration: none;
            margin-left: 20px;
        }
    </style>
</head>
<body>
<% if (is_valid_user) { %>
<!-- Navbar -->
<nav class="navbar">
    <div class="navbar-brand">
        <img src="img/logoutp.png" alt="Logo">
        <a href="#">Inicio</a>
    </div>
    <div class="navbar-nav">
        <a href="logout.jsp">Cerrar Sesión</a>
    </div>
</nav>
<div class="container">
    <h1 class="title">Aplicación de Registro de Depósitos</h1>
    <div class="options">
        <div class="box">
            <span class="paso">1</span>
            <a href="RegistrarChanchita.jsp">
                <img src="img/registrarchan.png" alt="Registrar Chanchita">
            </a>
            <p>Registrar Chanchita</p>
        </div>
        <div class="box">
            <span class="paso">2</span>
            <a href="RegistrarDeposito.jsp">
                <img src="img/regisPers.png" alt="Registrar Mini Depósito">
            </a>
            <p>Registrar Mini Depósito</p>
        </div>
        <div class="box">
            <span class="paso">3</span>
            <a href="BuscarChanchita.jsp">
                <img src="img/buscar.png" alt="Buscar Chanchita">
            </a>
            <p>Buscar Chanchita</p>
        </div>
    </div>
</div>
</body>
</html>
<% } else { %>
<% response.sendRedirect("index.jsp"); %>
<% } %>
