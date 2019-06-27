<%@ page contentType="text/html;charset=UTF-8"
         language="java"
         pageEncoding="UTF-8"
         isELIgnored="false"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Tweeter 0.2</title>
    <link href="style.css" rel="stylesheet">
</head>
<body>
<h2>JSP tweeter v 0.2</h2>

<c:forEach var="tweet" items="${sessionScope.tweets}" >
    <c:out value="${tweet}"/><br/>
</c:forEach>

<form method="post" action="tweeter-servlet">
    <div>
        <label class="tweet">Nowy tweet</label>
        <textarea name="tweet"> </textarea>
    </div>
    <div>
        <label class="tweet"></label>
        <input type="submit" name="send" value="wyślij">
    </div>
</form>

</body>
</html>
