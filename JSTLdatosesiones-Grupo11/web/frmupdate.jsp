<%-- 
    Document   : frmupdate
    Created on : 11-23-2020, 12:13:57 PM
    Author     : Elizabeth Méndez
--%>

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
        <title>Actualizar</title> 
    </head>
    <body>
        <c:set var = "isbnId" value = "${param.isbn}"/>
        ${var = ""}
        
        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT * from libro WHERE isbn = ? ;
            <sql:param value = "${isbnId}" />
        </sql:query>
        <c:forEach var = "row" items = "${result.rows}">
        <h1>Actualizar el libro "<c:out value = "${row.titulo}"/>"</h1>
        <form method="POST" action="update.jsp">
            
            <div><label for="isbn">ISBN: </label></div>
            <div><input id="isbn" name="isbn" type="text" max="13" value="${row.isbn}"><br></div>
            
            <div><label for="titulo">Título: </label></div>
            <div><input id="titulo" name="titulo" type="text" value="${row.titulo}"><br></div>
            
            <div><label for="autor">Autor: </label></div>
            <div><input id="autor" name="autor" type="text" value="${row.autor}"><br></div>
            
            <div><label for="editorial">Editorial: </label></div>
            <div><input id="editorial" name="editorial" type="text" value="${row.editorial}"></div><br>
            
            <div><input type="submit" value="Enviar"></div>
            
        </form>
        </c:forEach>
    </body>
</html>
