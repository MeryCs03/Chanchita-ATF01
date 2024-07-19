<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro Usuario</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #9dd8e8; /* Color cian-azul aún más claro */
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
            font-family: 'Roboto', sans-serif;
        }
        .container {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .form-container {
            max-width: 400px;
            padding: 20px;
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .register-link {
            display: block;
            margin-top: 10px;
            color: #007bff;
            text-decoration: none;
        }
        .register-link:hover {
            text-decoration: underline;
        }
        .h-custom-2 {
            height: calc(100% - 60px);
        }
        .h1, .h3 {
            color: #007bff; /* Color azul para los títulos */
        }
    </style>
</head>
<body>

<div class="container">
    <section class="vh-100">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6 px-0 d-none d-sm-block">
                    <img src="img/registroChan.png" alt="Signup image" class="w-100 vh-100" style="object-fit: cover; object-position: left;">
                </div>

                <div class="col-sm-6 text-black d-flex align-items-center justify-content-center">
                    <div class="form-container">
                        <div class="px-5 ms-xl-4" style="margin-top: 20px;">
                            <span class="h1 fw-bold mb-5">Registro de Usuario</span>
                        </div>

                        <div class="d-flex align-items-center h-custom-2 px-5 ms-xl-4 mt-5 pt-5 pt-xl-5 mt-xl-n5">
                            <form style="width: 100%;" action="RegistrarUsuario" method="post">
                                <h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;"></h3>

                                <div data-mdb-input-init class="form-outline mb-4">
                                    <input type="text" id="txtlogin" name="txtlogin" class="form-control form-control-lg" />
                                    <label class="form-label" for="txtlogin">Nombre del usuario:</label>
                                </div>
                                <c:if test="${errores != null && errores.containsKey('login')}">
                                    <div class="alert alert-danger py-3 px-4" role="alert" data-mdb-color="danger">
                                            ${errores.login}
                                    </div>
                                </c:if>

                                <div data-mdb-input-init class="form-outline mb-4">
                                    <input type="text" id="txtfullname" name="txtfullname" class="form-control form-control-lg" />
                                    <label class="form-label" for="txtfullname">Nombre completo:</label>
                                </div>
                                <c:if test="${errores != null && errores.containsKey('fullname')}">
                                    <div class="alert alert-danger py-3 px-4" role="alert" data-mdb-color="danger">
                                            ${errores.fullname}
                                    </div>
                                </c:if>

                                <div data-mdb-input-init class="form-outline mb-4">
                                    <input type="text" id="txtEmail" name="txtEmail" class="form-control form-control-lg" />
                                    <label class="form-label" for="txtEmail">Email:</label>
                                </div>
                                <c:if test="${errores != null && errores.containsKey('email')}">
                                    <div class="alert alert-danger py-3 px-4" role="alert" data-mdb-color="danger">
                                            ${errores.email}
                                    </div>
                                </c:if>

                                <div data-mdb-input-init class="form-outline mb-4">
                                    <input type="password" id="txtpwd" name="txtpwd" class="form-control form-control-lg" />
                                    <label class="form-label" for="txtpwd">Contraseña:</label>
                                </div>
                                <c:if test="${errores != null && errores.containsKey('pwd')}">
                                    <div class="alert alert-danger py-3 px-4" role="alert" data-mdb-color="danger">
                                            ${errores.pwd}
                                    </div>
                                </c:if>

                                <div class="pt-1 mb-4">
                                    <button data-mdb-button-init data-mdb-ripple-init class="btn btn-info btn-lg btn-block" type="submit">Registrar</button>
                                </div>

                                <div class="pt-1 mb-4">
                                    <a class="register-link" href="index.jsp">¿Ya tienes una cuenta? Inicia Sesión</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"></script>
</body>
</html>


