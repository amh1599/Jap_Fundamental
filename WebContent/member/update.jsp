<%@page import="kr.or.kpc.dao.CustomerDao"%>
<%@page import="kr.or.kpc.Dto.CustomerDto"%>
<%@ page language="java"  pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String email = request.getParameter("email");
	String cpwd = request.getParameter("cpwd");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	
	CustomerDao dao = CustomerDao.getInstance();
	CustomerDto dto = dao.getLogin(email,pwd);
	
	if(dto != null){
		//update
		dto = new CustomerDto(email,pwd,name);
		int resultCount = dao.update(dto);
		if(resultCount ==1){
			session.setAttribute("login",dto);
			
			%>
			<script>
			alert("회원정보가 수정되었습니다.");
			location.href="/member/mypage.jsp";
		</script>
			<%
		}else{
			%>
			<script>
			alert("error......");
			history.back(-1);
		</script>
			<%
		}
		
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