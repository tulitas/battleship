<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Game</title>
    <style>
        .EMPTY {
            background-color: azure;
        }

        .SHIP {
            background-color: black;
        }

        .MISS {
            background-color: red;
        }

        .HIT {
            background-color: aqua;
        }

    </style>
</head>
<body>
<form method="post" action="game">
    <table>
        <tr>
            <td>&nbsp;</td>
            <c:forEach items="A,B,C,D,E,F,G,H,I,J" var="col">
                <td>${col}</td>
            </c:forEach>
        </tr>
        <c:forEach begin="1" end="10" var="row">
            <tr>
                <td>${row}</td>
                <c:forEach items="A,B,C,D,E,F,G,H,I,J" var="col">
                    <c:set var="addr" value="${col}${row}"/>
                    <td class="${myGame.user.enemyField.getState(addr)}">
                        &nbsp;
                        <c:if test="${myGame.myTurn}">
                                <input type="radio" name="cell" value="${col}${row}"/>
                        </c:if>
                        <c:if test="${not myGame.myTurn}">
                            <meta http-equiv="refresh" content="5">
                        </c:if>
                    </td>
                </c:forEach>
            </tr>
        </c:forEach>
    </table>
    <table>
        <tr>
            <td>&nbsp;</td>
            <c:forEach items="A,B,C,D,E,F,G,H,I,J" var="col">
                <td>${col}</td>
            </c:forEach>
        </tr>
        <c:forEach begin="1" end="10" var="row">
            <tr>
                <td>${row}</td>
                <c:forEach items="A,B,C,D,E,F,G,H,I,J" var="col">
                    <c:set var="addr" value="${col}${row}"/>
                    <td class="${myGame.user.myField.getState(addr)}">
                        &nbsp;

                    </td>
                </c:forEach>
            </tr>
        </c:forEach>
    </table>
    <c:if test="${myGame.myTurn}">
    <button type="submit">Fire!</button>
    </c:if>
</form>


</body>
</html>