<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.time.*" %>

<%
//오늘 방문자 수 변수 선언 및 계산 로직
LocalDate savedDay = (LocalDate)application.getAttribute("savedDay");

LocalDate today=LocalDate.now();

Integer todayVisit=(Integer)application.getAttribute("todayVisit");

if(savedDay == null || !today.equals(savedDay) || todayVisit == null){
	todayVisit = 0;
    application.setAttribute("todayVisit", todayVisit);
}
todayVisit++;

application.setAttribute("todayVisit", todayVisit);
application.setAttribute("savedDay", today);
//오늘 방문자 수 계산 완료


//총 방문자 수 변수 선언 및 계산 로직
Integer totalVisit = (Integer)application.getAttribute("totalVisit");

if(totalVisit == null) {
    totalVisit = 0;
}

totalVisit++;

application.setAttribute("totalVisit", totalVisit);
//총 방문자 수 계산 완료
%>
<html>
<head>
	<link rel="stylesheet" href="style.css">
    <title>메인 페이지</title>
</head>
<body>

    <jsp:include page="header.jsp"/>
    <jsp:include page="main.jsp"/>
    <jsp:include page="footer.jsp"/>

</body>
</html>