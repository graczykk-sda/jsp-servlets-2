<%@page contentType="text/html;charset:UTF-8"
        isELIgnored="false"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<body>
<h2>Headers from request:</h2>

<table border="1" width="50%">
    <tr>
        <th>header key</th>
        <th>header value</th>
    </tr>

    <c:forEach var="item" items="${header}">
        <tr>
            <td><c:out value="${item.key}"/></td>
            <td><c:out value="${item.value}"/></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
