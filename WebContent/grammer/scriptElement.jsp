<%@page import="kr.or.kpc.dao.MemberDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.kpc.Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<%!	// 멤버변수, 메서드 생성 가능(serrvlet class 안으로 들어가버림)
		private String name;
		public int plus(int a, int b){
			return a+b;
		}
	%>
	
	<%	// 멤버변수 및 메서드 생성 불가, 호출 가능
		int result = plus(19,20);
		out.print(result);
	%>
	
	<%= result %>
	
	<%
		MemberDto dto = new MemberDto(1, "안무현","서울");
	%>
	
	<%= dto.getName() %>, <%= dto.getNum() %>, <%= dto.getAddr() %> <br>
	
	<%
		MemberDao dao = MemberDao.getInstance();
		ArrayList<MemberDto> list = dao.select();
	%>
	<table>
		<tr>
			<th>번호</th><th>이름</th><th>주소</th>
		</tr>
		<% for(MemberDto memberDto : list){ %>
		<tr>
			<td><%=memberDto.getNum() %></td>
			<td><%=memberDto.getName() %></td>
			<td><%=memberDto.getAddr() %></td>
		</tr>
		<%} %>
	</table>
	
	
</body>
</html>