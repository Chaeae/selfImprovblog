<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>update.jsp</title>
</head>
<body>
<form action="/board/update" method="post" name="updateForm">
    <input type="hidden" name="post_id" value="${board.post_id}" readonly>
    <input type="text" name="post_author" value="${board.post_author}" readonly>
<%--    <input type="text" name="boardPass" id="boardPass" placeholder="비밀번호">--%>
    <input type="text" name="post_categoryId" value="${board.post_categoryId}">
    <input type="text" name="post_title" value="${board.post_title}">
    <textarea name="post_contents" cols="30" rows="10">${board.post_contents}</textarea>
    <input type="button" value="수정" onclick="updateReqFn()">
</form>
</div>
</body>
<script>
    const updateReqFn = () => {
        document.updateForm.submit();
        <%--const passInput = document.getElementById("boardPass").value;--%>
        <%--const passDB = '${board.boardPass}';--%>
        <%--if (passInput == passDB) {--%>
        <%--    document.updateForm.submit();--%>
        <%--} else {--%>
        <%--    alert("비밀번호가 일치하지 않습니다!!");--%>
        <%--}--%>
    }
</script>
</html>