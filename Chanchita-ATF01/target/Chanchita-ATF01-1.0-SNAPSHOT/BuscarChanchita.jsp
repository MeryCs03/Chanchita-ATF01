<%--
  Created by IntelliJ IDEA.
  User: USUARIO
  Date: 26/05/2024
  Time: 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Buscar Chanchita</title>
    <style>
        h1, h2 {
            text-align: center;
        }

        h1 {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }

        h2 {
            font-size: 20px;
            font-weight: bold;
            color: #666;
            margin-top: 0;
            margin-bottom: 20px;
        }

        table {
            font-family: Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            margin: auto;
        }

        td, th {
            border: 1px solid #ddd;
            padding: 8px;
        }

        table th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
        }

        form {
            margin: auto;
            width: fit-content;
        }
    </style>
</head>
<body>
<div class="content">
    <form action="BuscarChanchita" method="post">
        <input type="text" placeholder="Ingrese número de cuenta" name="nroCuenta">
    </form>
    <h1>${nombre_chanchita}</h1>
    <h2>${nroCuenta}</h2>
</div>
<table>
    <thead>
    <tr>
        <th>Nombre</th>
        <th>Fecha</th>
        <th>Detalle</th>
        <th>Monto S/</th>
    </tr>
    </thead>
    <tbody>
    ${table}
    </tbody>
</table>
</body>
</html>
