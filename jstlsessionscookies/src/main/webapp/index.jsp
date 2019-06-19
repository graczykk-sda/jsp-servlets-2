<%@ page import="java.util.Base64" %>
<%@ page contentType="text/html;charset=UTF-8"
         isELIgnored="false"
         pageEncoding="UTF-8"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

    <style>
        label {
            width: 12em;
            display: inline-block;
        }
        input {
            margin: 2px;
        }
    </style>
    <title>JSTL sessions</title>

</head>
<body>
<h2>User Profile</h2>

<c:if test="${param.containsKey('save')}">
    <jsp:useBean id="userProfile" class="pl.sdacademy.jsp.UserProfile" scope="session"/>
    <jsp:setProperty name="userProfile" property="*"/>
    User Profile was successfully saved to session. <br/>
    <a href="session.jsp">See in session.jsp</a>
    <br/><br/>

    <%
        String userProfileString = userProfile.toString();
        Cookie cookie = new Cookie("userProfile",
                Base64.getEncoder().encodeToString(userProfileString.getBytes()));
        response.addCookie(cookie);
    %>
    User Profile saved to cookie
    <a href="cookie.jsp">See in cookie.jsp</a>
    <br/><br/>
</c:if>

<form method="post">
    <div>
        <label>Name</label>
        <input type="text" name="name" value="Jan"/>
    </div>
    <div>
        <label>Surname</label>
        <input type="text" name="surname" value="Kowalski"/>
    </div>
    <div>
        <label>Age</label>
        <input type="number" name="age" value="31"/>
    </div>
    <div>
        <label>Email</label>
        <input type="text" name="email" value="jan.kowalski@gmail.com"/>
    </div>
    <div>
        <label>Phone</label>
        <input type="text" name="phone" value="600 600 600"/>
    </div>
    <div>
        <label>Zipcode</label>
        <input type="text" name="zipcode" value="99-999"/>
    </div>
    <div>
        <label></label>
        <input type="submit" name="save" value="save"/>
    </div>

</form>

</body>
</html>
