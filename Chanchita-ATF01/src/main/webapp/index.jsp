<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.css" rel="stylesheet">

</head>
<body>

<div class="container">

    <section class="vh-100">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6 text-black">

                    <div class="px-5 ms-xl-4" style="margin-top: 90px;">
                        <span class="h1 fw-bold mb-5">Iniciar Sesion</span>
                    </div>

                    <div class="d-flex align-items-center h-custom-2 px-5 ms-xl-4 mt-5 pt-5 pt-xl-5 mt-xl-n5">

                        <form style="width: 23rem;" name="frmLogin" action="login" method="post">

                            <h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;"></h3>

                            <div data-mdb-input-init class="form-outline mb-4">
                                <input name="txtEmail" type="email" id="txtEmail" class="form-control form-control-lg" />
                                <label class="form-label" for="txtEmail">Email address</label>
                            </div>

                            <div data-mdb-input-init class="form-outline mb-4">
                                <input name="txtPassword" type="password" id="txtPassword" class="form-control form-control-lg" />
                                <label class="form-label" for="txtPassword">Password</label>
                            </div>

                            <div class="pt-1 mb-4">
                                <button data-mdb-button-init data-mdb-ripple-init class="btn btn-info btn-lg btn-block" type="submit">Login</button>
                            </div>
                            <div class="pt-1 mb-4">
                                <a class="nav-link" href="registrarUsuario.jsp">Registrate</a>
                            </div>

                        </form>

                    </div>

                </div>
                <div class="col-sm-6 px-0 d-none d-sm-block">
                    <img src="img/library.png"
                         alt="Login image" class="w-100 vh-100" style="object-fit: cover; object-position: left;">
                </div>
            </div>
        </div>
    </section>
</div>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"></script>
</body>
</html>
