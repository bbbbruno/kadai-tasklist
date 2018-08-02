<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${task != null}">
                <h2>タスク　編集ページ</h2>
                <form method="POST" action="<c:url value='/update?id=${task.id}' />">
                    <c:import url="../layout/_form.jsp" />
                </form>
            </c:when>
            <c:otherwise>
                <h2>お探しのデータは見つかりませんでした。</h2>
            </c:otherwise>
        </c:choose><br /><br />

        <p><a href="#" onclick="confirmDestroy();">このメッセージを削除する</a></p>
        <form method="POST" action="${pageContext.request.contextPath}/destroy?id=${task.id}">
            <input type="hidden" name="_token" value="${_token}" />
        </form>
        <script>
        function confirmDestroy() {
            if(confirm("本当に削除してよろしいですか？")) {
                document.forms[1].submit();
                }
            }
        </script><br /><br />

        <p><a href="<c:url value='/index' />">一覧に戻る</a></p>
    </c:param>
</c:import>