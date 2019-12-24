<%@ page pageEncoding="utf-8" %>
<!-- C:\Users\acorn\eclipse-workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\work\Catalina\localhost\ROOT\org\apache\jsp -->
<html>
	<body>
	<%
	for(int i=0; i<100; i++){
	%>
		<h1>hello jsp</h1>
	</body>
	<%
	}
	%>
	
	<%-- 
	OR 이렇게 할수도 있지만 하는 사람 없음.
	<%
	for(int i=0; i<100; i++){
	out.println("<h1>hello jsp</h1>")
	}
	%>
	 --%>
</html>