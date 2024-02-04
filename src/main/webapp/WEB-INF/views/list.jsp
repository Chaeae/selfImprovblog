<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>list</title>
</head>
<body>
<table>
    <tr>
        <th>글번호</th>
        <th>글 제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>
    </tr>
    <c:forEach items="${boardList}" var="board">
        <tr>
            <td>${board.post_id}</td>
            <td>
                <a href="/board?id=${board.post_id}">${board.post_title}</a>
            </td>
            <td>${board.post_author}</td>
            <td>${board.post_postDate}</td>
            <td>${board.post_viewNum}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>