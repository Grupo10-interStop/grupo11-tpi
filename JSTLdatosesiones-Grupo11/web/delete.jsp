<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql" %>
<%@ include file  = "fuentedatos.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar</title> 
    </head>
    <body>
        <c:set var = "isbnId" value = "${param.isbn}"/>
        <h1>Eliminar un libro</h1>
        ${var = ""}
        
        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT * from libro WHERE isbn = ? ;
            <sql:param value = "${isbnId}" />
        </sql:query>
            
        <c:forEach var = "row" items = "${result.rows}">
            <table border = "0" >
                <th colspan="2" align="left">Datos del libro a eliminar</th>
                <tr>
                    <td>ISBN:</td>
                    <td><c:out value = "${row.isbn}"/></td>
                </tr>
                <tr>
                    <td>Título:</td>
                    <td><c:out value = "${row.titulo}"/></td>
                </tr>
                <tr>
                    <td>Autor:</td>
                    <td><c:out value = "${row.autor}"/></td>
                </tr>
                <tr>
                    <td>Editorial:</td>
                    <td><c:out value = "${row.editorial}"/></td>
                </tr>
            </table>
                
            <sql:update dataSource = "${fuenteDatos}" var = "result">
            DELETE FROM libro WHERE isbn = ?
            <sql:param value = "${isbnId}" />
            </sql:update>
            
            <p>El libro <c:out value = "${row.titulo}"/> se ha eliminado correctamente </p>  
        </c:forEach>
            <a href="index.jsp" style="font-size:0.5cm;color:blue;">RETORNAR A INDEX</a>
    </body>
</html>
