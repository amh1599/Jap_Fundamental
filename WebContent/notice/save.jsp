<%@page import="kr.or.kpc.Dto.NoticeDto"%>
<%@page import="kr.or.kpc.dao.NoticeDao"%>
<%@ page language="java" pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");	// 한글을 위한 request 데이터 인코딩
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	int num = 0;
	NoticeDao dao = NoticeDao.getInstance();
	num = dao.getMaxNum();	
	NoticeDto dto = new NoticeDto(num,writer,title,content,null);
	
	int resultCount = dao.insert(dto);
	if(resultCount ==1){
	%>
	<script>
		alert('글이 업로드 되었다롱');
		location.href='list.jsp?page=1';
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
