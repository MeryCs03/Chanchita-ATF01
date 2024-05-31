<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buscar Chanchita</title>
    <link rel="stylesheet" href="table.css">
    <style>
        .button {
            background-color: #007bff; /* Azul */
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 8px;
        }
        .button:hover {
            background-color: #0056b3; /* Azul oscuro */
        }
        .button-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            position: fixed;
            bottom: 20px;
            width: 100%;
        }
        h1, h2 {
            text-align: center;
            font-weight: bold;
            color: #333;
        }
        h1 {
            font-size: 32px; /* Título más grande */
            margin-bottom: 20px;
        }
        h2 {
            font-size: 20px;
            margin-top: 0;
            margin-bottom: 20px;
        }
        .content {
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            margin-top: 4rem; /* Caja de texto más abajo */
        }
        .form-container {
            text-align: center;
        }
    </style>
</head>

<body>
<div class="container">
    <div class="form-container">
        <h1>Buscar Chanchita</h1>
        <form action="BuscarChanchita" method="post">
            <input oninput="limitarDigitos(this)" maxlength="16" type="number" placeholder="Ingrese número de cuenta" name="nroCuenta" required>
        </form>
    </div>
    <table class="table">
        <thead>
        <tr>
            ${tablaEncabezado}
        </tr>
        </thead>
        <tbody>
        ${table}
        </tbody>
    </table>
</div>
<div class="button-container">
    <button onclick="window.location.href='RegistrarDeposito.jsp'" class="button">Registrar Depósito</button>
    <button onclick="window.location.href='index_general.jsp'" class="button">Inicio</button>
</div>
<script> function limitarDigitos(element) {
    let valor = element.value;
    if (valor.length > 16) {
        element.value = valor.slice(0, 16);
    }
} </script>
</body>
</html>
