<%@page import="kr.or.kpc.dao.CustomerDao"%>
<%@page import="kr.or.kpc.Dto.CustomerDto"%>
<%@ page language="java"  pageEncoding="utf-8"%>
<%
	session.invalidate();	// 세션 객체를 삭제
	//session.removeAttribute("login");	// 세션 객체의	속성을 삭제
	response.sendRedirect("/member/login.jsp");
%>