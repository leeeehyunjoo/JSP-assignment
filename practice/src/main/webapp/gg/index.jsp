<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.time.*" %>
<%@ page import="java.io.*" %>

<%
    // 방문 기록 파일 경로
    String filePath = application.getRealPath("/WEB-INF/visit.txt");
    File file = new File(filePath);
    
    //visit.txt 파일이 존재하는지 확인
/*     System.out.println("방문 기록 파일 경로: " + file.getAbsolutePath());
    System.out.println("파일 존재 여부: " + file.exists());
    System.out.println("파일 쓰기 가능 여부: " + file.canWrite()); */

    // 파일에서 방문 기록 읽기
    BufferedReader br = new BufferedReader(new FileReader(file));

    int totalVisit = Integer.parseInt(br.readLine());
    int todayVisit = Integer.parseInt(br.readLine());
    String savedDay = br.readLine();

    br.close();

    // 오늘 날짜 확인
    String today = LocalDate.now().toString();

    // 날짜가 바뀌었다면 오늘 방문자 수 초기화
    if(!today.equals(savedDay)) {
        todayVisit = 0;
    }

    // 현재 세션에서 오늘 처음 방문했을 때만 증가
    String visitCountedDate = (String)session.getAttribute("visitCountedDate");

    if(!today.equals(visitCountedDate)) {
        totalVisit++;
        todayVisit++;

        session.setAttribute("visitCountedDate", today);
    }

    // 파일에 변경된 방문 기록 저장
    BufferedWriter bw = new BufferedWriter(new FileWriter(file));

    bw.write(String.valueOf(totalVisit));
    bw.newLine();

    bw.write(String.valueOf(todayVisit));
    bw.newLine();

    bw.write(today);

    bw.close();
    
    //visit.txt 파일이 수정됐는지 확인
/*     System.out.println("총 방문자 수: " + totalVisit);
    System.out.println("오늘 방문자 수: " + todayVisit);
    System.out.println("파일 저장 완료"); */
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>메인 페이지</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

    <jsp:include page="header.jsp"/>

    <jsp:include page="main.jsp"/>

    <jsp:include page="footer.jsp"/>

</body>
</html>