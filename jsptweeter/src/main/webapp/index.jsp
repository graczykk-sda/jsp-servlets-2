<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8"
         isELIgnored="false"
         pageEncoding="UTF-8"
%>
<html>
<body>
<c:if test="${!logged}">
    You are not logged in. Please log in before access this site. Redirecting...
    <script>
        setTimeout(function () {
            window.location.href = 'login.jsp?redirect=index.jsp';
        }, 3000);
    </script>
</c:if>
<c:if test="${logged}">
    <h2>Tweeter vs 0.1</h2>
    Powered by JSP & Servlets!
</c:if>
</body>
</html>
