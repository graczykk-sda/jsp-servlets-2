<%@ page import="java.util.Base64" %>
<%@ page contentType="text/html;charset=UTF-8"
         language="java"
         isELIgnored="false"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>User profile from cookie</title>
</head>
<body>
    <h2>User profile from cookie</h2>

    <c:set var="encoded" value="${cookie.get('userProfile').value}" scope="page" />
    <%
        String base64encoded = (String) pageContext.getAttribute("encoded");
        byte[] decode = Base64.getDecoder().decode(base64encoded.getBytes());
        pageContext.setAttribute("decoded", new String(decode));
    %>
    <c:out value="${decoded}"></c:out>

</body>
</html>
