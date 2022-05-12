<%-- 
    Document   : IndexU
    Created on : 3/01/2022, 12:03:03 AM
    Author     : varga
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="commons/CDN(4).jsp" %>
        <link href="css/Global_U.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="commons/Co_Usu/Cabecera_U.jsp" %>
        <div class="container-fluid">
            <div  class="row">
                <div class="col-sm-3 sidebar-col">
                    <%@include file="commons/Co_Usu/SideBar_U.jsp" %>
                </div>
                
                    <div  class="row">
                        <div class="col-sm-12">
                            <h1 style="margin-left: 10px;">Bienvenido <b>${Usu.getNombres()}</b></h1>
                        </div>
                    </div>
            </div>
        </div>


    </body>
</html>
