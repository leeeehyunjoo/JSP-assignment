<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.time.*" %>
<%
	//총 자료 수 변수 선언
	ArrayList<String>boardList=new ArrayList<>();

	int totalData = boardList.size();
	//선언 완료
	
	
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
<footer>
	<section>
		<h3>게시판</h3>
	</section>
	<section>
		<h3>사이트 이용 현황</h3>
		<p>총 자료 수 : <%= totalData %></p>
		<p>오늘 하루 방문자 수 : <%= todayVisit %></p>
		<p>총 방문자 수 : <%= totalVisit %></p>
	</section>
</footer>