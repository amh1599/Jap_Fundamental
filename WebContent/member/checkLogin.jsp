<%@page import="kr.or.kpc.dao.CustomerDao"%>
<%@page import="kr.or.kpc.Dto.CustomerDto"%>
<%@ page language="java"  pageEncoding="utf-8"%>
<%
	String email = request.getParameter("email");
	String pwd = request.getParameter("pwd");
	
	CustomerDao dao = CustomerDao.getInstance();
	CustomerDto dto = dao.getLogin(email,pwd);
	
	if(dto != null){
		//email, pwd가 일치하는 경우
		//세션에 클라이언트 정보를 저정한다.
		session.setAttribute("login",dto);
		response.sendRedirect("/notice/list.jsp?page=1");
	}else{
		//일치하지 않는 경우
		%>
		<script>
			alert("이메일 혹은 비밀번호가 일치하지 않습니다.");
			history.back(-1);
		</script>
		<%
	}
%>