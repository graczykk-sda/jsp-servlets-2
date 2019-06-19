<%@ page contentType="text/html;charset=UTF-8"
         language="java"
         pageEncoding="UTF-8"
         isELIgnored="false"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login</title>
    <link href="style.css" rel="stylesheet">
</head>
<body>

<c:if test="${param.containsKey('logout')}">
    <c:set var="logged" value="false" scope="session"/>
</c:if>

<c:if test="${param.containsKey('save')}">
    <c:choose>
        <c:when test="${param.get('login').equals('jsp')
                        && param.get('password').equals('servlet')}">
            <c:set var="logged" value="true" scope="session"/>
            <span class="green">
                <c:out value="login and password ok"/>
                <c:if test="${param.containsKey('redirect')}" >
                    <c:redirect url="${param.get('redirect')}" />
                </c:if>
                <br/>
            </span>
        </c:when>
        <c:otherwise>
            <span class="red">
                <c:out value="Login or password incorrect"/>
            </span>
        </c:otherwise>
    </c:choose>
</c:if>

<c:choose>
    <c:when test="${!logged}">
        <h2>Zaloguj się</h2>
        <form method="post">
            <div>
                <label>login</label>
                <input type="text" name="login"/>
            </div>
            <div>
                <label>password</label>
                <input type="password" name="password">
            </div>
            <div>
                <label></label>
                <input type="submit" name="save" value="zaloguj">
            </div>
        </form>
    </c:when>
    <c:otherwise>
        You are logged in.
        <form>
            <input type="submit" name="logout" value="wyloguj">
        </form>
    </c:otherwise>
</c:choose>

</body>
</html>
