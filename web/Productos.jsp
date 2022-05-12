<%-- 
    Document   : Productos
    Created on : 3/01/2022, 11:12:33 PM
    Author     : varga
--%>

<%@page import="beens.BeensCategorias"%>
<%@page import="DAO.CategoriaDAO"%>
<%@page import="beens.BeensProducto"%>
<%@page import="java.util.ListIterator"%>
<%@page import="DAO.ProductoDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="commons/CDN(4).jsp" %>
        <link href="css/Global_P.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="commons/Co_Produ/Cabecera_P.jsp"%>
        <div class="container-fluid">
            <div  class="row">
                <div class="col-sm-3 sidebar-col">
                    <%@include file="commons/Co_Produ/SideBar_P.jsp" %>
                </div>
                <div class="col-sm-9 main-col ">
                    <center><h1><b>Insertar o modificar producto</b></h1></center>
                    <br>
                    <form class="border border-primary rounded-lg" action="ControladorP?menu=Produ" method="POST"  style=" margin-top: -10px;width:  1080px;" enctype="multipart/form-data">
                        <div class="form-group d-flex">
                            <div class="col-sm-3">
                                <center><label><b>Nombre Producto</b></label></center>
                                <input type="text" value="${Produ.getNombres()}" name="nom" class="form-control" required="required">
                            </div>
                            <%--<div class="col-sm-2">
                                <center><label><b>Imagen Producto</b></label></center>
                                <input type="file" value="${Produ.getImg()}" name="img" style="width: 18vh;">
                            </div>--%>
                            <div class="col-sm-3">
                                <center><label><b>Cantidad de productos</b></label></center>
                                <center><input type="text" value="${Produ.getCantidad()}" name="can" class="form-control col-sm-15" required="required"></center>
                            </div>
                            <div class="col-sm-3">
                                <center><label><b>Costo Producto</b></label></center>
                                <input type="text" value="${Produ.getCosto()}" name="cos" class="form-control" required="required">
                            </div>
                            <div class="col-sm-3">
                                <center><label><b>Categoria Perteneciente</b></label></center>
                                            <%--<input type="text" value="${Produ.getPro_cat_id()}" name="cat"class="form-control">--%>
                                <select value="${Produ.getId_categoria()}" name="cat"class="form-control" required="required">
                                    <%
                                        List Lit6 = new CategoriaDAO().getAll();
                                        ListIterator listaC = Lit6.listIterator();
                                        while (listaC.hasNext()) {
                                            BeensCategorias BeensCa = (BeensCategorias) listaC.next();
                                    %>

                                    <option value="<%= BeensCa.getId_categoria()%>"><%= BeensCa.getNombre()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                        </div>
                        <center>
                            <div>
                                <center><label><b>Imagen Producto</b></label></center>
                                <input type="file" value="${Produ.getImg()}" name="img" required="required">
                            </div>
                        </center>
                        <div class="form-group d-flex">
                            <div class="col-sm-12">
                                <center><label><b>Descripcion  Producto</b></label></center>
                                <input type="textarea" value="${Produ.getDescrip()}" name="des" class="form-control" required="required">
                            </div>
                        </div>
                        <div class="form-group d-flex">
                            <div class="col-sm-3">
                                <button type="submit" name="accion" value="Insertar" class="btn btn-outline-primary">
                                    <i class="fas fa-user-plus"></i> <b>Guardar</b>
                                </button>
                                <button type="submit" name="accion" value="Modificar"  class="btn btn-outline-success">
                                    <i class="fas fa-edit"></i> <b>Modificar</b>
                                </button>
                            </div>
                        </div>
                    </form>
                    <table style=" margin-top: 3%;width:  1080px;" class="table table-bordered table-hover">
                        <th  class="bg-dark text-white" colspan="10">
                            <h1><center><b>Lista de productos registrados</b></center></h1>
                        </th>
                        <tr class=" mx-auto bg-secondary text-white">
                            <th><center>ID</center></th>
                        <th><center>Nombre</center></th>
                        <th><center>Costo</center></th>
                        <th><center>Imagen</center></th>
                        <th><center>Descripcion</center></th>
                        <th><center>Cantidad</center></th>
                        <th><center>Estado</center></th>
                        <th><center>Categoria</center></th>
                        <th colspan="2"><center>Opciones</center></th>
                        </tr>
                        <%
                            List lista = new ProductoDAO().getAll();
                            ListIterator list = lista.listIterator();
                            while (list.hasNext()) {
                                BeensProducto DaP = (BeensProducto) list.next();
                        %>
                        <tr>
                            <td><%= DaP.getId_producto()%></td>
                            <td><%= DaP.getNombres()%></td>
                            <td>
                        <center>
                            <img src="ControladorImg?id=<%= DaP.getId_producto()%>" style="width: 20vh; height: 20vh;">
                        </center>

                        </td>
                        <td>$.<%= DaP.getCosto()%>0</td>
                        <td style="max-width: 38vh;">
                            <textarea class="form-control" disabled="disabled"><%= DaP.getDescrip()%></textarea>
                        </td>
                        <td><%= DaP.getCantidad()%></td>
                        <td><%= DaP.getEstado()%></td>
                        <td><%= DaP.getId_categoria()%></td>  
                        <td><center><a href="ControladorP?menu=Produ&accion=Cargar&id=<%= DaP.getId_producto()%>" class="btn btn-outline-success"><b>Actualizar</b></a></center></td>
                        <td><center><a href="ControladorP?menu=Produ&accion=Borrar&id=<%= DaP.getId_producto()%>" class="btn btn-outline-danger"><b>Borrar</b></a></center></td>
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
