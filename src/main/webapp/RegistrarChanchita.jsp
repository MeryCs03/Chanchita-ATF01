<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Nueva Chanchita</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #9dd8e8;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            text-align: center;
        }

        form {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
            width: 340px;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        h1 {
            color: #004d80; /* Color del título */
            font-size: 24px;
            margin-bottom: 20px;
        }

        label {
            color: #555555;
            display: block;
            margin-bottom: 0.5em;
        }

        input[type="text"], input[type="submit"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #cccccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            border: none;
            border-radius: 4px;
            background-color: #007bff;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        .button-container {
            display: flex;
            justify-content: space-between;
            gap: 10px;
        }

        .button-container button {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            background-color: #007bff;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .button-container button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Registro de Nueva Chanchita</h1>
    <form action="RegistrarChanchita" method="post">
        <label for="txtNombreChanchita">Nombre de la Chanchita:</label>
        <input type="text" id="txtNombreChanchita" name="txtNombreChanchita" required><br><br>

        <label for="txtNumeroCuenta">Numero de Cuenta:</label>
        <input oninput="limitarDigitos(this)" maxlength="16" type="number" id="txtNumeroCuenta" name="txtNumeroCuenta" required><br><br>

        <input type="submit" value="Registrar">
    </form>
    <div class="button-container">
        <button onclick="location.href='index_general.jsp'">Inicio</button>
        <button onclick="location.href='RegistrarDeposito.jsp'">Registrar Deposito</button>
    </div>
</div>
<script> function limitarDigitos(element) {
    let valor = element.value;
    if (valor.length > 16) {
        element.value = valor.slice(0, 16);
    }
} </script>
</body>
</html>
