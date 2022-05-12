<%-- 
    Document   : Loguin
    Created on : 29/12/2021, 07:46:47 PM
    Author     : Vargas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Loguin</title>
        <%@include file="commons/CDN(4).jsp"%>
        <link rel="stylesheet" href="css/Globales.css" type="text/css"/>
    </head>
    <body>
        <%@include file="commons/Cabecera.jsp"%>
        <br>
        <div class="container mt-4 col-lg-4">
            <div class="border border-info col-sm-10 rounded">
                <div class="card-body">
                    <form action="ValidarIngreso"  method="POST">
                        <center><img src="img/usr.png"  alt="0" width="170"/></center>
                        <div class="form-group">
                            <label>Usuario</label>
                            <input type="text" class="form-control"  placeholder="Ingrese Usuario" name="usr" required>                           
                        </div>
                        <div class="form-group">
                            <label>Contraseña</label>
                            <input type="password" class="form-control" placeholder="Ingrese Contraseña" name="pswd" required>
                        </div>
                        <center><button type="submit" name="accion" value="ingresar" class="btn btn-primary">Iniciar</button></center>
                    </form>
                    <br>
                </div>
            </div>
        </div>
   </body>
</html>   