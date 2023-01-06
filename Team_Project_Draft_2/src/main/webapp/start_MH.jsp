<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
start.jsp<br>
	
	<% String viewMain = request.getContextPath()+"/main.mem"; %>
	<% response.sendRedirect(viewMain); %>
