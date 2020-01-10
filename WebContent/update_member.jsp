<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%-- <%
	String id_user = request.getAttribute("id_user").toString();
	String user_pass = request.getAttribute("user_pass").toString();
	String user_name = request.getAttribute("user_name").toString();
	String user_age = request.getAttribute("user_age").toString();
	String user_seibetu = request.getAttribute("user_seibetu").toString();
	String seibetu_custom = request.getAttribute("seibetu_custom").toString();

%> --%>

<script>

<%-- window.onload=function(){
  document.getElementById("Select").value=<%=user_seibetu%>;
}; --%>

</script>

<title>Insert title here</title>
</head>
<body>
	<form action="./Update_Member" method="get">
		<h1>会員更新</h1>
		<input type="hidden" name="proc" value="update">

		<div>
			<label for="user_id">ユーザーID</label> <br> <input
				type="text" required name="user_id" <%-- value=<%=id_user%> --%>>
		</div>
		<div>
			<label for="login_user">ログインユーザーID</label> <br> <input
				type="text" required name="login_user" <%-- value=<%=id_user%> --%>>
		</div>
		<p>
		<div>
			<label for="login_pass">パスワード</label> <br> <input type="text"
				required name="login_pass" <%-- value=<%=user_pass%> --%>>
		</div>
		<p>
		<div>
			<label for="name">氏名</label> <br> <input type="text" required
				name="name" <%-- value=<%=user_name%> --%>>
		</div>
		<p>
		<div>
			<label for="age">年齢</label> <br> <input type="text" required
				name="age" <%-- value=<%=user_age%> --%>>
		</div>
		<p>
		<div>
			<label for="sex">性別</label> <br> <select id="Select" name="sex"
				onchange="SelectChenge();" <%-- value=<%=user_seibetu%> --%> >
				<option value="0"></option>
				<option value="1">男性</option>
				<option value="2">女性</option>
				<option value="3">カスタム</option>
			</select>
			<input type="text" id="input" name="gender" style="display: none"
				 <%-- value=<%=seibetu_custom% --%> >


		</div>
		<p>
		<div>
			<input type="submit" value="確認"> <a href="./login.jsp">戻る</a>
		</div>
	</form>

</body>
</html>