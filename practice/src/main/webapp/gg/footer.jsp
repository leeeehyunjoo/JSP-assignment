<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<%
    // 게시판 자료 목록
    ArrayList<String> boardList;

    boardList = (ArrayList<String>)application.getAttribute("boardList");

    if(boardList == null) {
        boardList = new ArrayList<>();

        boardList.add("우리 동네 환경 조사");
        boardList.add("지역별 주거 환경 개선 의견");
        boardList.add("지속 가능한 도시 만들기");

        application.setAttribute("boardList", boardList);
    }

    int totalData = boardList.size();


    // 방문 기록 파일 경로
    String filePath = application.getRealPath("/WEB-INF/visit.txt");
    File file = new File(filePath);

    // 파일에서 방문 기록 읽기
    BufferedReader br = new BufferedReader(new FileReader(file));

    int totalVisit = Integer.parseInt(br.readLine());
    int todayVisit = Integer.parseInt(br.readLine());

    br.close();
%>

<footer>

    <section>
        <h3>게시판</h3>

        <%
            for(int i = 0; i < boardList.size(); i++) {
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