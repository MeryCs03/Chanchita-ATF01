<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro Usuario</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css" rel="stylesheet">
</head>
<body>

<div class="container">

    <section class="vh-100">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6 text-black order-1">

                    <div class="px-5 ms-xl-4" style="margin-top: 90px;">
                        <span class="h1 fw-bold mb-5">Registro de Usuario</span>
                    </div>

                    <div class="d-flex align-items-center h-custom-2 px-5 ms-xl-4 mt-5 pt-5 pt-xl-5 mt-xl-n5">

                        <form style="width: 23rem;" action="RegistrarUsuario" method="post">

                            <h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;"></h3>

                            <div data-mdb-input-init class="form-outline mb-4">
                                <input type="text" id="txtlogin" name="txtlogin" class="form-control form-control-lg" />
                                <label class="form-label" for="txtlogin">Nombre del usuario:</label>
                            </div>
                            <c:if test="${ errores != null && errores.containsKey('login') }" >
                                <div class="alert alert-danger py-3 px-4" role="alert" data-mdb-color="danger">
                                    ${errores.login}
                                </div>
                            </c:if>


                            <div data-mdb-input-init class="form-outline mb-4">
                                <input type="text" id="txtfullname" name="txtfullname" class="form-control form-control-lg" />
                                <label class="form-label" for="txtfullname">Nombre completo:</label>
                            </div>
                            <c:if test="${ errores != null && errores.containsKey('fullname') }" >
                                <div class="alert alert-danger py-3 px-4" role="alert" data-mdb-color="danger">
                                    ${errores.fullname}
                                </div>
                            </c:if>


                            <div data-mdb-input-init class="form-outline mb-4">
                                <input type="text" id="txtEmail" name="txtEmail" class="form-control form-control-lg" />
                                <label class="form-label" for="txtEmail">Email:</label>
                            </div>
                            <c:if test="${ errores != null && errores.containsKey('email') }" >
                                <div class="alert alert-danger py-3 px-4" role="alert" data-mdb-color="danger">
                                    ${errores.email}
                                </div>
                            </c:if>


                            <div data-mdb-input-init class="form-outline mb-4">
                                <input type="password" id="txtpwd" name="txtpwd" class="form-control form-control-lg" />
                                <label class="form-label" for="txtpwd">Contraseña:</label>
                            </div>
                            <c:if test="${ errores != null && errores.containsKey('pwd') }" >
                                <div class="alert alert-danger py-3 px-4" role="alert" data-mdb-color="danger">
                                    ${errores.pwd}
                                </div>
                            </c:if>


                            <div class="pt-1 mb-4">
                                <button data-mdb-button-init data-mdb-ripple-init class="btn btn-info btn-lg btn-block" type="submit">Registrar</button>
                            </div>

                            <div class="pt-1 mb-4">
                                <a class="nav-link" href="index.jsp">¿Ya tienes una cuenta? Inicia Sesión</a>
                            </div>

                        </form>
                    </div>
                </div>

                <div class="col-sm-6 px-0 d-none d-sm-block">
                    <img src="img/library.png"
                         alt="Signup image" class="w-100 vh-100" style="object-fit: cover; object-position: left;">
                </div>

            </div>
        </div>

    </section>
</div>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"></script>


</body>
</html>
