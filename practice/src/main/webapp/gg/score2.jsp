
<%@ page contentType="text/html; charset=utf-8" %>

<%
    // 총점과 미응답 개수
    int total = 0;
    int unanswered = 0;

    // 사용자 답변 가져오기
    for(int i = 0; i < 20; i++) {

        String answer = request.getParameter("p" + (i + 1));

        if(answer != null) {
            total += Integer.parseInt(answer);
        }
        else {
            unanswered++;
        }
    }

    // 100점 만점으로 환산
    double score = total * 1.25;
%>

<!DOCTYPE html>
<html>
<head>
    <title>환경 실천 수준 평가 결과</title>
    <link rel="stylesheet" href="score.css">
</head>
<body>

	<div class="result-container">
    <h2>나의 환경 실천 수준 평가 결과</h2>
    </div>

	<div class="score-box">
    <p>원점수 : <%= total %>점 / 80점</p>

    <p>환산 점수 : <%= score %>점 / 100점</p>

    <p>미응답 문항 : <%= unanswered %>개</p>
	</div>
	
	<div class="result-message">
    <%
        if(score >= 90) {
    %>
        <p>지속 가능한 도시를 위한 실천을 매우 잘하고 있습니다!</p>
    <%
        }
        else if(score >= 70) {
    %>
        <p>일상생활에서 환경 보호를 잘 실천하고 있습니다!</p>
    <%
        }
        else if(score >= 50) {
    %>
        <p>조금씩 실천 습관을 늘려 봅시다!</p>
    <%
        }
        else {
    %>
        <p>작은 생활 습관부터 시작해 봅시다!</p>
    <%
        }
    %>
    </div>

    <a href="index.jsp">메인 페이지로 돌아가기</a>

</body>
</html>
