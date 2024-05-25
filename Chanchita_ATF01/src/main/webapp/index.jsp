<%--<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <title>Login Page</title>--%>
<%--    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css" rel="stylesheet">--%>

<%--</head>--%>
<%--<body>--%>
<%--<div class="container">--%>

<%--    <section class="vh-100">--%>
<%--        <div class="container-fluid">--%>
<%--            <div class="row">--%>
<%--                <div class="col-sm-6 text-black">--%>

<%--                    <div class="px-5 ms-xl-4" style="margin-top: 90px;">--%>
<%--                        <span class="h1 fw-bold mb-5">Chanchita Login</span>--%>
<%--                    </div>--%>

<%--                    <div class="d-flex align-items-center h-custom-2 px-5 ms-xl-4 mt-5 pt-5 pt-xl-5 mt-xl-n5">--%>

<%--                        <form style="width: 23rem;" name="frmLogin" action="login" method="post">--%>

<%--                            <h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;"></h3>--%>

<%--                            <div data-mdb-input-init class="form-outline mb-4">--%>
<%--                                <input name="txtEmail" type="email" id="txtEmail" class="form-control form-control-lg" />--%>
<%--                                <label class="form-label" for="txtEmail">Email address</label>--%>
<%--                            </div>--%>

<%--                            <div data-mdb-input-init class="form-outline mb-4">--%>
<%--                                <input name="txtPassword" type="password" id="txtPassword" class="form-control form-control-lg" />--%>
<%--                                <label class="form-label" for="txtPassword">Password</label>--%>
<%--                            </div>--%>

<%--                            <div class="pt-1 mb-4">--%>
<%--                                <button data-mdb-button-init data-mdb-ripple-init class="btn btn-info btn-lg btn-block" type="submit">Login</button>--%>
<%--                            </div>--%>

<%--                            <p class="small mb-5 pb-lg-2"><a class="text-muted" href="#!">Forgot password?</a></p>--%>
<%--                            <p>Don't have an account? <a href="#!" class="link-info">Register here</a></p>--%>

<%--                        </form>--%>

<%--                    </div>--%>

<%--                </div>--%>
<%--                <div class="col-sm-6 px-0 d-none d-sm-block">--%>
<%--                    <img src="img/depositos.png"--%>
<%--                         alt="Login image" class="w-100 vh-100" style="object-fit: cover; object-position: left;">--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </section>--%>
<%--</div>--%>
<%--<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"></script>--%>
<%--</body>--%>
<%--</html>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="icon" href="img/logosuperior.jpg" type="image/jpeg">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Home</title>
    <link rel="stylesheet" href="bulma/css/bulma.css">
    <style>
        html {
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
            width: 200px; /* Ancho fijo para mantener todos los cuadrados del mismo tamaño */
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
<body>
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
                <img src="img/Chanchita.jpg" alt="Registrar Depósito">
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
