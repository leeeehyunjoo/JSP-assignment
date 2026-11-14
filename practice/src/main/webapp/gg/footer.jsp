<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*" %>

<%
	//총 자료 수 변수 선언
	ArrayList<String>boardList;

	//int totalData = boardList.size();
	
	boardList=(ArrayList<String>)application.getAttribute("boardList");
	
	if(boardList == null){
		boardList=new ArrayList<>();
		
		//게시글 리스트 제목 예시 데이터
		boardList.add("우리 동네 환경 조사");
		boardList.add("지역별 주거 환경 개선 의견");
		boardList.add("지속 가능한 도시 만들기");
		
		application.setAttribute("boardList",boardList);
	}
	
	int totalData = boardList.size();
	
	
	//선언 완료
	
	//오늘 방문자 수
	Integer todayVisit = (Integer)application.getAttribute("todayVisit");
	
	//총 방문자 수
	Integer totalVisit = (Integer)application.getAttribute("totalVisit");

%>
<footer>
	<section>
		<h3>게시판</h3>
		<%
			for(int i=0;i<boardList.size();i++){
		%>
		<p>
    			<a href="board.jsp"><%= boardList.get(i) %></a>
		</p>
		<%
			}
		%>
	</section>
	<section>
		<h3>사이트 이용 현황</h3>
		<p>총 자료 수 : <%= totalData %></p>
		<p>오늘 하루 방문자 수 : <%= todayVisit %></p>
		<p>총 방문자 수 : <%= totalVisit %></p>
	</section>
</footer>