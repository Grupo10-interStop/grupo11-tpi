<%-- 
    Document   : insertar
    Created on : 11-23-2020, 09:28:35 AM
    Author     : Katherine
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ include file="fuentedatos.jsp" %>

<c:set var="pageId" value="Insertar" />
<c:set var="standalone" value="not" />

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insertar</title>
    </head>
    <body>
        <c:set var = "isbnInsertar" value = "${param.isbn}"/>
        <h1>Libro agregado</h1>
        ${var = ""}
        
        <sql:update dataSource = "${fuenteDatos}" var = "result">
            INSERT INTO libro (isbn,titulo,autor,editorial)  VALUES (?,?,?,?);
            <sql:param value="${param.isbn}"/>
            <sql:param value="${param.titulo}"/>
            <sql:param value="${param.autor}"/>
            <sql:param value="${param.editorial}"/>
        </sql:update>
            
          <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT * from libro WHERE isbn = ? ;
            <sql:param value = "${isbnInsertar}" />
        </sql:query>
            
        <c:forEach var = "row" items = "${result.rows}">
            <p>El libro <c:out value = "${row.titulo}"/> de <c:out value = "${row.autor}"/> se ha agregado correctamente.</p> 
         </c:forEach>
        <a href="index.jsp" style="font-size:0.5cm;color:blue;">RETORNAR A INDEX</a>
    </body>
</html>