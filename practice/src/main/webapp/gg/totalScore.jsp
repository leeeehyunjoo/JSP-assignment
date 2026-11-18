
<%@ page contentType="text/html; charset=utf-8" %>

<%
    // 세션에서 두 평가 점수 가져오기
    Integer score = (Integer)session.getAttribute("score");
    Double score2 = (Double)session.getAttribute("score2");

    // 두 평가가 모두 완료되었는지 확인
    if(score != null && score2 != null) {

        // 통합 점수 계산
        double totalScore = (score + score2) / 2.0;
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>나의 통합 점수</title>
    <link rel="stylesheet" href="score.css">
</head>

<body>
    <div class="result-container">

        <h2>나의 통합 점수</h2>

        <div class="result-info">
            <p>SDG 11 지식 평가 : <%= score %>점</p>
            <p>환경 실천 평가 : <%= score2 %>점</p>
        </div>

        <div class="score-box">
            <p>나의 통합 점수</p>
            <p class="score">
                <%= String.format("%.1f", totalScore) %>점
            </p>
        </div>

        <div class="result-message">
            <%
                if(totalScore >= 90) {
            %>
                <p>지속 가능한 도시의 진정한 실천가!</p>
            <%
                }
                else if(totalScore >= 70) {
            %>
                <p>훌륭합니다! 조금 더 노력해 봅시다.</p>
            <%
                }
                else if(totalScore >= 50) {
            %>
                <p>좋은 시작입니다! 꾸준히 실천해 봅시다.</p>
            <%
                }
                else {
            %>
                <p>지금부터 하나씩 시작해 봅시다!</p>
            <%
                }
            %>
        </div>

        <a href="index.jsp" class="home-link">
            메인 페이지로 돌아가기
        </a>

    </div>
</body>
</html>

<%
    }
    else {
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>평가 미완료</title>
    <link rel="stylesheet" href="score.css">
</head>

<body>
    <div class="result-container">
        <h2>통합 점수를 확인할 수 없습니다.</h2>
        <p>지식 평가와 환경 실천 평가를 모두 완료해 주세요.</p>
        <a href="index.jsp" class="home-link">
            메인 페이지로 돌아가기
        </a>
    </div>
</body>
</html>

<%
    }
%>
