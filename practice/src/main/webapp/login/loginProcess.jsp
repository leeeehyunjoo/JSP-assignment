<%@page contentType="text/html; charset=utf-8"%>
<html>
<head>
<title>로그인 처리</title>
</head>
<body>
<% 
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	
	if(id.equals("admin")&&pw.equals("1234")){
		out.println("로그인 성공!");
	}else{
		out.println("로그인 실패");
	}
%>
</body>
</html>