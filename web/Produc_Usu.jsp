
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

        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-3 sidebar-col" >
                    <%@include file="commons/Co_Usu/SideBar_U.jsp" %>
                </div>
                <div class="container">

                    <%
                        List lis = new ProductoDAO().getAll();
                        ListIterator list = lis.listIterator();
                        while (list.hasNext()) {
                            BeensProducto Produ = (BeensProducto) list.next();

                    %>

                    <div class="col-sm-3 mt-2">
                        <center>
                            <div class="contadap">
                                <div class="card">
                                    <div class="card-header">
                                        <%= Produ.getId_producto()%>
                                    </div>
                                    <div class="card-header">
                                        <%= Produ.getNombres()%>
                                    </div>
                                    <div class="card-body">
                                        <center><img src="ControladorImg?id=<%= Produ.getId_producto()%>" style="width: 100px; height: 100px;"></center>
                                    </div>
                                    <div class="card-footer">
                                        <%= Produ.getDescrip()%>
                                    </div>
                                    <div class="card-footer">
                                        $.<%= Produ.getCosto()%>
                                    </div>
                                    <div class="card-footer">
                                        <div>
                                            <a  href="ControladorCarrito?accion=Carr&menu=Agregar&id=<%= Produ.getId_producto()%>"  class="btn btn-primary">
                                                <i class="fas fa-user-plus"></i>Añadir al Carrito
                                            </a>
                                        </div>
                                        <div>
                                            <a  href="ControladorCarrito?accion=Carr&menu=Comprar&id=<%= Produ.getId_producto()%>"  class="btn btn-success">
                                                <i class="fas fa-user-plus"></i>Comprar
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </center>
                    </div>
                    <% }%>
                </div>
            </div>
        </div>
    </body>
</html>
