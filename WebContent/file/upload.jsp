<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Calendar"%>
<%@ page pageEncoding="utf-8"%>

<% 
	request.setCharacterEncoding("utf-8");
	//String name = request.getParameter("name"); // =>null
	
	String path = request.getRealPath("/upload/file");
	Calendar c = Calendar.getInstance();
	int year = c.get(Calendar.YEAR);
	int month = c.get(Calendar.MONTH);
	path += File.separator + year + File.separator + month;
	
	File f = new File(path);
	if(!f.exists()){
		f.mkdirs();
	}
	
	MultipartRequest multi = null;
	try{
		multi = new MultipartRequest(
				request,
				path,			//업로드할 디렉토리
				10*1024*1024,	//업로드할 파일 크기
				"utf-8",		//인코딩 타입
				//파일 이름이 중복되었을 때 파일명 끝에 123 순으로 이름 변경해주는 클래스
				new DefaultFileRenamePolicy()	
				);
	}catch(Exception e){
		e.printStackTrace();
	}
	String name = multi.getParameter("name");
	String fileName = multi.getFilesystemName("file");
	String uploadName = multi.getOriginalFileName("file");
	File f1 = new File(f, fileName);
	long fileSize = f1.length()/1024;
%>

Name : <%=name %> <br>  
<img src="/upload/file/<%=year%>/<%=month%>/<%=fileName%>" style="width:400px"> 
File System Name :<a href="/upload/file/<%=year%>/<%=month%>/<%=fileName%>"><%=fileName %></a>(<%=fileSize%>kb)<br>
File Origin Name : <%=uploadName %> <br>
Path : <%=path %> <br>
