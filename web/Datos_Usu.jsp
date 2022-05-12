<%-- 
    Document   : Datos_Usu
    Created on : 5/01/2022, 01:54:00 PM
    Author     : varga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="commons/CDN(4).jsp" %>
        <link rel="stylesheet" href="css/Global_U.css" type="text/css">
    </head>
    <body>
        <%@include file="commons/Co_Usu/Cabecera_U.jsp" %>
        <div class="container-fluid">
            <div  class="row">
                <div class="col-sm-3 sidebar-col" >
                    <%@include file="commons/Co_Usu/SideBar_U.jsp" %>
                </div>
                <div class="col-sm-9 main-col ">
                    <table style=" margin-top: 3%;width:  1080px;" class="table table-bordered table-hover">
                        <th  class="bg-dark text-white" colspan="9">
                            <h1>
                                <center>
                                    <b>Datos Personales</b>
                                </center>
                            </h1>
                        </th>
                        <tr class=" mx-auto bg-secondary text-white"> 
                            <th><center>Nombres</center></th>
                        <th><center>Contacto</center></th>
                        <th><center>Correo</center></th>
                        <th><center>Password</center></th>
                        <th colspan="2"><center>Opciones</center></th>
                        </tr>
                        <tr>
                            <td><center>${Usu.getNombres()}</center></td>
                        <td><center>${Usu.getContacto()}</center></td>
                        <td><center>${Usu.getCorreo()}</center></td>
                        <td><center>${Usu.getPass()}</center></td>

                        <td>
                        <center>
                            <a href="ControladorU?menu=Datos&accion=Cargar&id=${Usu.getId_registro()}" class="btn btn-outline-success">
                                <b>Actualizar</b>
                            </a>
                        </center>
                        </td>

                        </tr>
                    </table>

                    <table style=" margin-top: 3%;width:  1080px;" class="table table-bordered table-hover">
                        <th  class="bg-dark text-white" colspan="9">
                            <h1>
                                <center>
                                    <b>Datos Personales</b>
                                </center>
                            </h1>
                        </th>
                    </table>
                    <form class="border border-primary rounded-lg" action="ControladorU?menu=Datos" method="POST"  style=" margin-top: -10px;width:  1080px;">
                        <div class="form-group d-flex">
                            <div class="col-sm-3">
                                <center><label><b>Nombre</b></label></center>
                                <input type="text" value="${Usuario.getNombres()}"  name="nombres" class="form-control" required="required">
                            </div>
                            <div class="col-sm-3">
                                <center><label><b>Contacto</b></label></center>
                                <input type="text" value="${Usuario.getContacto()}" name="contacto"  class="form-control" required="required">
                            </div>
                            <div class="col-sm-3">
                                <center><label><b>Correo</b></label></center>
                                <input type="text" value="${Usuario.getCorreo()}" name="correo"  class="form-control" required="required">
                            </div>
                            <div class="col-sm-3">
                                <center><label><b>Contraseña</b></label></center>
                                <input type="text" value="${Usuario.getPass()}" name="password"  class="form-control" required="required">
                            </div>
                        </div>
                        <center><div class="col-sm-4">
                                <button type="submit" name="accion" value="Modificar"  class="btn btn-outline-success">
                                    <i class="fas fa-edit"></i> <b>Modificar</b>
                                </button>
                            </div>
                        </center>
                        <br>
                    </form>

                </div>
            </div>
        </div>
    </body>
</html>