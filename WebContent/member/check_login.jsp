<%@page import="kr.co.acorn.dto.MemberDto"%>
<%@page import="kr.co.acorn.dao.MemberDao"%>
<%@ page pageEncoding="utf-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	
	MemberDao dao = MemberDao.getInstance();
	MemberDto dto = new MemberDto(email, null, password, null, null);
	dto = dao.getMember(dto);
	if(dto != null){
		//세션 시간을 설정한다. 기본시간은 30분.
		session.setMaxInactiveInterval(60*60*24);
		//세션에 dto 정보를 저장한다.
		session.setAttribute("member", dto);
		%>
		<script>
			alert('로그인 되었습니다.');
			location.href="/index.jsp";
		</script>
		<%
	}else{
		%>
		<script>
			alert('이메일 또는 비밀번호가 잘못되었습니다.');
			history.back(-1);
		</script>
		<%
	}
	
%>