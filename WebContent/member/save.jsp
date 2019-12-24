<%-- <%@page import="kr.co.acorn.dao.MemberDao"%>
<%@page import="kr.co.acorn.dto.MemberDto"%>
<%@ page pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int no = 1;
	String email = request.getParameter("email");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String phone = request.getParameter("phone");
	String regdate = request.getParameter("regdate");

	MemberDto deptDto = new MemberDto();
	MemberDto.setEmail(MemberNo);
	MemberDao dao = MemberDao.getInstance();
	no = dao.getMaxNextNo();

	MemberDto dto = new MemberDto(email, name, password, phone, regdate);

	boolean isSuccess = dao.insert(dto);

	if (isSuccess) {
%>
<script>
	alert('회원가입 되었습니다.');
	location.href = "list.jsp?page=1";
</script>
<%} else {%>
<script>
	alert('DB Error');
	history.back(-1);
</script>
<%}%> --%>