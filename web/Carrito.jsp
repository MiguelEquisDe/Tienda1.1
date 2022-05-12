<%-- 
    Document   : Carrito
    Created on : 13/01/2022, 09:35:10 PM
    Author     : varga
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos</title>
        <%@include file="commons/CDN(4).jsp"%>
        <link rel="stylesheet" href="css/Global_U.jsp" type="text/css">
    </head>
    <body>
        <%@include file="commons/Co_Produ/Cabecera_P.jsp"%>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-3 sidebar-col">
                    <%@include file="commons/Co_Usu/SideBar_U.jsp" %>
                </div>
                <div class="col-sm-9 main-col ">
                    <br>
                    <table style=" margin-top: 3%;width:  75%;" class="table table-bordered">
                        <thead>
                        <th  class="bg-dark text-white" colspan="9">
                            <h1>
                                <center>
                                    <b>Productos del Carrito</b>
                                </center>
                            </h1>
                        </th>
                        <tr class="bg-dark text-white">
                            <th>Imagen</th>
                            <th>Nombre</th>
                            <th>Descripcion</th>
                            <th>Costo</th>
                            <th>Cantidad</th>
                            <th>SubTotal</th>
                            <th>Opciones</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="carrito" items="${car}">
                                <tr>
                                    <td>
                                        <img src="ControladorImg?id=${carrito.getId_producto()}" style="width: 100px; height: 100px;">
                                    </td>
                                    <td>${carrito.getNombre() }</td>
                                    <td>
                                        <input type="textarea" value="${carrito.getDescrip()}" readonly="" name="des" class="form-control" style="width: auto; height: auto;">
                                    </td>
                                    <td>$.${carrito.getPrecioFinal()}0</td>
                                    <td>
                                        <%--<input type="hidden" id="IdPro" value="${carrito.getId_producto()}">--%>
                                        <input type="number" min="0" id="cantidad" value="${carrito.getCantidad()}" class="form-control text-center">
                                    </td>
                                    <td>$.${carrito.getSubToatal()}0</td>
                                    <td>
                            <center>
                                <a href="ControladorCarrito?accion=Carr&menu=Eliminar&id=${carrito.getId_producto()}" class="btn btn-outline-danger">
                                    <b>Borrar</b>
                                </a>
                            </center>
                            </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="col-sm-4" style="float: start;">
                        <div class="card">
                            <div class="card-header">
                                <h3>Generar Compra</h3>
                            </div>
                            <div class="card-body">
                                <label><b>Subtotal:</b></label>
                                <input type="text" value="$.${totalPagar}0" readonly="" class="form-control">
                                <label><b>Descuento:</b></label>
                                <input type="text" value="$.0.00" readonly="" class="form-control">
                                <label><b>Total Pagar:</b></label>
                                <input type="text" value="$.${totalPagar}0" readonly="" class="form-control">
                            </div>
                            <div class="card-footer">
                                <a href="#" class="btn btn-info btn-block"><b>Realizar Pago</b></a>
                                <a href="#" class="btn btn-danger btn-block"><b>Generar Compra</b></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
        </div> 
    </body>
</html>

