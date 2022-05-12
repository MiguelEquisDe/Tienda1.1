<%-- 
    Document   : prueba
    Created on : 13/01/2022, 05:43:22 PM
    Author     : varga
--%>

<%@page import="DAO.CategoriaDAO"%>
<%@page import="beens.BeensCategorias"%>
<%@page import="beens.BeensProducto"%>
<%@page import="DAO.ProductoDAO"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos</title>
        <%@include file="commons/CDN(4).jsp"%>
        <link rel="stylesheet" href="css/Global_U.jsp" type="text/css">
        <%@include file="commons/Co_Usu/Cabecera_U.jsp"%>
    </head>
    <body>
        <div class="container mt-4">
            <div class="row">

                <%
                    List lis = new ProductoDAO().getAll();
                    ListIterator list = lis.listIterator();
                    while (list.hasNext()) {
                        BeensProducto Produ = (BeensProducto) list.next();

                %>
                <div class="col-sm-3 mt-2">
                    <div class="card">
                        <div class="card-header">
                            <%= Produ.getNombres()%>
                        </div>
                        <div class="card-body">
                            <%= Produ.getId()%>
                            <center><img src="img/imagen.png" style="width: 90px; height: 90px;"/></center>
                        </div>
                        <div class="card-footer">
                            <%= Produ.getDescrip() %>
                            <div>
                                <center><a  href="ControladorCarrito?accion=Carr&menu=Agregar&id=<%= Produ.getId()%>"  class="btn btn-primary">
                                    <i class="fas fa-user-plus"></i> Carrito
                                </a>
                                 <a  href="ControladorCarrito?accion=Carr&menu=Agregar"  class="btn btn-success">
                                    <i class="fas fa-user-plus"></i> Comprar
                                 </a></center>
                            </div>
                        </div>
                    </div> 
                </div>
                <% }%>
            </div>           
        </div>
        <%--
        <div class="container-fluid">
            <div  class="row">
                <%
                    List lis = new ProductoDAO().getAll();
                    ListIterator list = lis.listIterator();
                    while (list.hasNext()) {
                        BeensProducto BeensCat = (BeensProducto) list.next();

                %>
                <div class="col-sm-2 mt-3" >
                    <div class="card">
                        <div class="card-header">
                            <h6><center><%= BeensCat.getNombres()%></center></h6>
                        </div>
                        <div class="card-body">
                            <center><img src="img/imagen.png"  style="width: 70px; height: 70px;" /></center>
                        </div>
                        <div class="card-footer">
                            <h6><center><%= BeensCat.getDescrip()%></center></h6>
                            <center><div>
                                    <button type="submit" name="accion" value="guardar"  class="btn btn-outline-primary">
                                        <i class="fas fa-user-plus"></i> Carrito
                                    </button>
                                    <a  href="ControladorCarrito?accion=Carr&menu=Agregar"  class="btn btn-outline-primary">
                                        <i class="fas fa-user-plus"></i> Comprar
                                    </a>
                                </div></center>
                        </div>

                    </div>
                </div>

                <%
                    }
                %>

            </div>


        </div> 
        --%>
    </body>
</html>
