<%-- 
    Document   : Registro
    Created on : 28/12/2021, 03:57:27 PM
    Author     : Vargas
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <%@include file="commons/CDN(4).jsp"%>
        <link rel="stylesheet" href="css/Globales.css" type="text/css"/>

    </head>
    <body>
        <%@include file="commons/Cabecera.jsp"%>
        <br>
        <div><center><H1>Registro de usuario</H1></center></div>
        <div class="container registro">
            <form  method="POST" action="RegistroControl?accion=insertar">
                <div class="row">
                    <div class="col-sm-6">
                        <label>Usuario</label>
                        <input type="text" class="form-control" name="nombres" placeholder="Ingrese Usuario" required="required">
                    </div>  
                    <div class="col-sm-6">
                        <label>Contacto</label>
                        <input type="text" class="form-control" name="contacto" placeholder="Ingrese contacto" required="required">
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <label >Correo</label>
                        <input type="text" class="form-control" name="correo" placeholder="Ingrese correo" required="required">
                    </div>   
                    <div class="col-sm-6">
                        <label>Contraseña</label>
                        <input type="password" class="form-control" name="password" placeholder="Ingrese contraseña" required="required">
                    </div>          
                </div>
                <br>
                <div class="row">
                    <div class="col-sm-6">
                     <%--<button type="submit" name="accion" value="insertar" class="btn btn-outline-info">Enviar</button>--%>
                     <button type="submit" class="btn btn-outline-primary"  name="accion" value="insertar" data-toggle="modal" data-target="#myModal">Listo</button>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
