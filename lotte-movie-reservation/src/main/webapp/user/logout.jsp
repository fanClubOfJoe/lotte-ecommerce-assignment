<%--
  Created by IntelliJ IDEA.
  User: kjchoi
  Date: 2022/07/11
  Time: 11:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.invalidate();
    response.sendRedirect("login.jsp");
%>
