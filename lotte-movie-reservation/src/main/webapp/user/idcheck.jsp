<%@ page import="com.example.lottemoviereservation.dao.UserDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// DB 접속 Data를 산출
String id = request.getParameter("id");

// Dao 호출
UserDao dao = UserDao.getInstance();
boolean b = dao.getId(id);
if(b == true){
	out.println("NO");	// 사용할 수 없음
}else{
	out.println("YES");	// 사용할 수 있음
}
%>




