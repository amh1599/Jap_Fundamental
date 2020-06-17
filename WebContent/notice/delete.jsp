<%@page import="kr.or.kpc.Dto.NoticeDto"%>
<%@page import="kr.or.kpc.dao.NoticeDao"%>
<%@ page language="java" pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");	// 한글을 위한 request 데이터 인코딩
	int num = Integer.parseInt(request.getParameter("num"));
	int cPage = Integer.parseInt(request.getParameter("page"));
	
	NoticeDao dao = NoticeDao.getInstance();
	
	int resultCount = dao.delete(num);
	if(resultCount ==1){
	%>
	<script>
		alert('글이 삭제 되었다롱');
		location.href='list.jsp?page=<%=cPage%>';
	</script>
	<%
	}else{
	%>
	<script>
		alert('에러에러에러에러에러에러에러에러에러에러에러');
		history.back(-1);
	</script>
	<%
	}
%>
