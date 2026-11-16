<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*" %>
<%
    // 정답 배열
    int[] answers = {
        2, 2, 2, 2, 2,
        2, 2, 2, 1, 2,
        1, 1, 1, 1, 1,
        1, 1, 1, 3, 1
    };
	
	//사용자의 오답 배열
	ArrayList<Integer> wrongList = new ArrayList<>();

    int correct = 0;

    int unanswered = 0;
    
    for(int i = 0; i < answers.length; i++) {

        String userAnswer = request.getParameter("q" + (i + 1));

        if(userAnswer == null){
        	 unanswered++;
        }
        else if(userAnswer != null && Integer.parseInt(userAnswer) == answers[i]) {
            correct++;
        }
        else{
        		wrongList.add(i+1);
        }
    }

    int score = correct * 5;
%>
<html>
<head>
    <title>퀴즈 결과</title>
    <link rel="stylesheet" href="score.css">
</head>
<body>

	<div class="result-container">
    <h2>간단 지식 확인 결과</h2>

    <div class="score-box">
    <p>나의 점수</p>
    <p class="score"><%=score %> 점</p>
    </div>

    <div class="result-info">
	<p>정답 개수 : <%=correct %> 개 / 20 문항</p>
    <!-- 메인 페이지로 돌아가기 -->
    <p>미응답 : <%= unanswered %> 개</p>
    </div>
    
    <div class="wrong-list">
    <h3>오답 확인</h3>
    <%
    for(int i = 0; i < wrongList.size(); i++) {
	%>
    <p><%= wrongList.get(i) %>번 문제 오답</p>
	<%
    		}
	%>
	
	<%
    		if(unanswered == 20) {
	%>
    		<p>아직 답변한 문제가 없습니다.</p>
	<%
    		}
    		else if(wrongList.size() == 0 && unanswered == 0) {
	%>
    		<p>모든 문제를 맞혔습니다!</p>
	<%
    		}
	%>
	</div>
	
	<div class="result-message">
	<%
		if(score>=90){
	%>
		<p>나는야 SDG 11 마스터~</p>
	<%
		}else if(score>=70){
	%>
		<p>SDG 11에 대한 이해가 준수하군요!</p>
	<%
		}else if(score>=50){
	%>
		<p>조금 더 공부해봅시다</p>
	<%
		}else{
	%>
		<p>기초 개념부터 다시 확인해봅시다</p>
	<%
		}
	%>
	</div>
	<a href="index.jsp">메인 페이지로 돌아가기</a>
</body>
</html>