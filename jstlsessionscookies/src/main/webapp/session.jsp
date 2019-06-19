<%@ page contentType="text/html;charset=UTF-8"
         language="java"
         isELIgnored="false"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Session JSP</title>
</head>
<body>
<h2>User Profile from session</h2>
<jsp:useBean id="userProfile" scope="session" class="pl.sdacademy.jsp.UserProfile"/>
<c:out value="${userProfile}" />

</body>
</html>
