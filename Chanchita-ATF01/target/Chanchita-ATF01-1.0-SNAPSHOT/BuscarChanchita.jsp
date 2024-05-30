<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Buscar Chanchita</title>
    <link rel="stylesheet" href="table.css">
</head>

<body>

<div class="container">

  <div class="content">
    <form action="BuscarChanchita" method="post">
      <input type="text" placeholder="Ingrese número de cuenta" name="nroCuenta">
    </form>
    <h1>${nombre_chanchita}</h1>
    <h2>${nroCuenta}</h2>
  </div>

  <div class="table">

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
   </div>


</body>

</html>
