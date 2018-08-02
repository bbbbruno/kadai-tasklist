<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:if test="${flush != null}">
            <div id="flush_success">
                <c:out value="${flush}"></c:out>
            </div>
        </c:if>
        <h2>タスク　一覧</h2>
        <table id="employee_list">
            <tbody>
                <tr>
                    <th>タスク名</th>
                    <th>期限</th>
                    <th>進捗状況</th>
                    <th>操作</th>
                </tr>
                <c:forEach var="task" items="${tasks}" varStatus="status">
                    <tr class="row${status.count % 2}">
                        <td><c:out value="${task.content}" /></td>
                        <td><fmt:formatDate value="${task.deadline}" pattern='yyyy-MM-dd' /></td>
                        <td>
                            <c:choose>
                                <c:when test="${task.progress == 0}">
                                    To-Do
                                </c:when>
                                <c:when test="${task.progress == 1}">
                                    Doing
                                </c:when>
                                <c:when test="${task.progress == 2}">
                                    Done
                                </c:when>
                            </c:choose>
                        </td>
                        <td><a href="<c:url value='/show.jsp?id=${task.id}' />">編集</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div id="pagination">
            （全 ${tasks_count} 件）<br />
            <c:forEach var="i" begin="1" end="${((tasks_count - 1) / 15) + 1}" step="1">
                <c:choose>
                    <c:when test="${i == page}">
                        <c:out value="${i}" />&nbsp;
                    </c:when>
                    <c:otherwise>
                        <a href="<c:url value='/index?page=${i}' />"><c:out value="${i}" /></a>&nbsp;
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
        <p><a href="<c:url value='/new' />">新規タスクの登録</a></p>

    </c:param>
</c:import>