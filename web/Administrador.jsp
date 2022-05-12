<%-- 
    Document   : Administrador
    Created on : 2/01/2022, 07:07:18 PM
    Author     : varga
--%>

<%@page import="beens.RegistroBeens"%>
<%@page import="java.util.ListIterator"%>
<%@page import="DAO.RegistroDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="commons/CDN(4).jsp" %>
        <link href="css/Global_A.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="commons/Co_Admin/Cabecera_A.jsp" %>
        <div class="container-fluid">
            <div  class="row">
                <div class="col-sm-3 sidebar-col">
                    <%@include file="commons/Co_Admin/SideBar_A.jsp" %>
                </div>
                <div class="col-sm-9 main-col ">
                    <center><h1><b>Insertar o modificar usuario</b></h1></center>
                    <br>
                    <form class="border border-primary rounded-lg" action="ControladorA?menu=Admin" method="POST"  style=" margin-top: -10px;width:  1080px;">
                        <div class="form-group d-flex">
                            <div class="col-sm-3">
                                <center><label><b>Nombre</b></label></center>
                                <input type="text" value="${datos.getNombres()}"  name="nombres" class="form-control">
                            </div>
                            <div class="col-sm-3">
                                <center><label><b>Contacto</b></label></center>
                                <input type="number" value="${datos.getContacto()}" name="contacto"  class="form-control">
                            </div>
                            <div class="col-sm-3">
                                <center><label><b>Correo</b></label></center>
                                <input type="email" value="${datos.getCorreo()}" name="correo"  class="form-control">
                            </div>
                            <div class="col-sm-3">
                                <center><label><b>Contraseña</b></label></center>
                                <input type="text" value="${datos.getPass()}" readonly="" name="password"  class="form-control">
                            </div>
                        </div>
                        <center>
                            <div class="col-sm-3">
                                <center><label><b>Rol</b></label></center>
                                <input type="text" value="${datos.getRol()}" name="rol"  class="form-control">
                            </div>
                        </center>
                            <br>
                        <center><div class="col-sm-4">
                                <button type="submit" name="accion" value="guardar"  class="btn btn-outline-primary">
                                    <i class="fas fa-user-plus"></i> <b>Guardar</b>
                                </button>
                                <button type="submit" name="accion" value="modificar"  class="btn btn-outline-success">
                                    <i class="fas fa-edit"></i> <b>Modificar</b>
                                </button>
                            </div></center>
                        </br>
                    </form> 
                    <table style=" margin-top: 3%;width:  1080px;" class="table table-bordered table-hover">
                        <th  class="bg-dark text-white" colspan="9">
                            <h1><center><b>Lista de usuarios registrados</b></center></h1>
                        <tr class=" mx-auto bg-secondary text-white">                                    
                            <th><center><b>ID</b></center></th>
                        <th><center>Nombres</center></th>
                        <th><center>Contacto</center></th>
                        <th><center>Correo</center></th>
                        <th><center>Password</center></th>
                        <th><center>rol</center></th>
                        <th colspan="2"><center>Opciones</center></th>
                        </tr>
                        <%

                            List lista = new RegistroDAO().getAll();
                            ListIterator list = lista.listIterator();
                            while (list.hasNext()) {
                                RegistroBeens reM = (RegistroBeens) list.next();
                        %>
                        <tr>
                            <td><center><%= reM.getId_registro()%></center></td>
                        <td><center><%= reM.getNombres()%></center></td>
                        <td><center><%= reM.getContacto()%></center></td>
                        <td><center><%= reM.getCorreo()%></center></td>
                        <td><center><%= reM.getPass()%></center></td>
                        <td><center><%= reM.getRol()%></center></td>
                        <td>
                        <center>
                            <a href="ControladorA?menu=Admin&accion=cargar&id=<%= reM.getId_registro()%>" class="btn btn-outline-success">
                                <b>Actualizar</b>
                            </a>
                        </center>
                        </td>
                        <td>
                        <center>
                            <a href="ControladorA?menu=Admin&accion=borrar&id=<%= reM.getId_registro()%>" class="btn btn-outline-danger">
                                <b>Borrar</b>
                            </a>
                        </center>
                        </td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
