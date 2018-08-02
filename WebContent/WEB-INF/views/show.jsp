<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="../layout/app.jsp">
	<c:param name="content">
		<c:choose>
			<c:when test="${task != null}">
				<table>
					<tbody>
						<tr>
							<th>タスク名</th>
							<td><c:out value="${task.content}" /></td>
						</tr>
						<tr>
							<th>期限</th>
							<td><fmt:formatDate value="${task.deadline}" pattern='yyyy-MM-dd' /></td>
						</tr>
						<tr>
							<th>進捗状況</th>
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
						</tr>
					</tbody>
				</table><br />

				<a href="<c:url value='/edit?id=${task.id}' />">編集する</a>

			    </c:when>
			    <c:otherwise>
				    <h2>お探しのデータは見つかりませんでした。</h2>
			    </c:otherwise>
		</c:choose>

		<p><a href="<c:url value='/index' />">一覧に戻る</a></p><br />

	</c:param>
</c:import>
