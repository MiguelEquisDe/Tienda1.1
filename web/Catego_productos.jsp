<%-- 
    Document   : Catego_productos
    Created on : 4/01/2022, 06:45:16 PM
    Author     : varga
--%>

<%@page import="beens.BeensCategorias"%>
<%@page import="java.util.ListIterator"%>
<%@page import="DAO.CategoriaDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="commons/CDN(4).jsp" %>
        <link rel="stylesheet" href="css/Global_P.css" type="text/css">
    </head>
    <body>
        <%@include file="commons/Co_Produ/Cabecera_P.jsp"%>
        <div class="container-fluid">
            <div  class="row">
                <div class="col-sm-3 sidebar-col">
                    <%@include file="commons/Co_Produ/SideBar_P.jsp" %>
                </div>
                <div class="col-sm-9 main-col" >
                    <center><h1><b>Modificar o insertar Categorias</b></h1></center>
                    <br>
                    <form class="border border-primary rounded-lg" action="ControladorCategorias?menu=Cat" method="POST"  style=" margin-top: -10px;width:  1080px;">
                        <div class="form-group d-flex">
                            <div class="col-sm-3">
                                <center><label><b>Nombre Categoria</b></label></center>
                                <input type="text" name="nomCat" value="${cat.getNombre()}" class="form-control">
                            </div>
                             <div class="col-sm-4"  style=" margin-top: 30px;">
                                <button type="submit" name="accion" value="Insertar" class="btn btn-outline-primary">
                                    <b>Guardar</b>
                                </button>
                                <button type="submit" name="accion" value="Modificar"  class="btn btn-outline-success">
                                    <b>Modificar</b>
                                </button>
                            </div>
                        </div>
                    </form>
                   <table style=" margin-top: 3%;width:  1080px;" class="table table-bordered table-hover">
                        <th  class="bg-dark text-white" colspan="9">
                            <h1><center><b>Lista de categorias registradas</b></center></h1>
                        <tr class=" mx-auto bg-secondary text-white">           
                            <th><center>Id</center></th>
                            <th><center>Nombbre Categoria</center></th>
                            <th><center>Estado</center></th>
                            <th colspan="2"><center>opciones</center></th>
                        </tr>
                        <%
                           List lis = new CategoriaDAO().getAll(); 
                           ListIterator list = lis.listIterator();
                           while(list.hasNext()){
                               BeensCategorias BeensCat = (BeensCategorias)list.next();
                           
                            %>
                            <tr>
                                <td><%= BeensCat.getId_categoria() %></td>
                                <td><%= BeensCat.getNombre() %></td>
                                <td><%= BeensCat.getEstado() %></td>
                                <td><center><center><a href="ControladorCategorias?menu=Cat&accion=Cargar&id=<%= BeensCat.getId_categoria()%>" class="btn btn-outline-success">Actualizar</a></center></td>
                            <td><center><center><a href="ControladorCategorias?menu=Cat&accion=Borrar&id=<%= BeensCat.getId_categoria()%>" class="btn btn-outline-danger">Borrar</a></center></td>
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
