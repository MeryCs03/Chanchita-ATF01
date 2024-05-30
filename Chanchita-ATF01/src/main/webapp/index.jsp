<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
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
        .form-container img {
            width: 100px;
            margin-bottom: 20px;
        }
        .puerquito-img {
            width: 50px;
            height: auto;
            margin-top: 20px; /* Ajustar el margen superior según sea necesario */
        }
        .login-title {
            margin-top: -10px;
        }
        .btn-info img {
            width: 100%; /* Hacer que la imagen del botón ocupe todo el ancho */
        }
    </style>
</head>
<body>

<div class="container">

    <div class="form-container">
        <img src="img/logosuperior.jpg" alt="Imagen pequeña" class="puerquito-img">
        <h2 class="login-title">Iniciar Sesion</h2>
        <form name="frmLogin" action="login" method="post">
            <div data-mdb-input-init class="form-outline mb-4">
                <input name="txtEmail" type="email" id="txtEmail" class="form-control form-control-lg" />
                <label class="form-label" for="txtEmail">Correo electronico</label>
            </div>
            <div data-mdb-input-init class="form-outline mb-4">
                <input name="txtPassword" type="password" id="txtPassword" class="form-control form-control-lg" />
                <label class="form-label" for="txtPassword">Contrasena</label>
            </div>
            <div class="pt-1 mb-4">
                <div class="pt-1 mb-4">
                    <button data-mdb-button-init data-mdb-ripple-init class="btn btn-info btn-lg btn-block" type="submit">Login</button>
                </div>
            </div>
        </form>
    </div>

    <div class="d-none d-sm-block">
        <img src="img/logo2.png" alt="Login image" style="max-width: 400px;">
    </div>
</div>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.1.0/mdb.min.js"></script>
</body>
</html>


