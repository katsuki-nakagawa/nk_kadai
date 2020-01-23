<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>

<title>Insert title here</title>
<%
	//エラーメッセージ
	String err_user_id = "";
	String err_user_pass = "";
	String err_name = "";
	String err_age = "";
	String err_sex = "";

	if (request.getAttribute("err_user_id") != null) {
		err_user_id = request.getAttribute("err_user_id").toString();
	}
	if(request.getAttribute("err_user_pass") != null){
		err_user_pass = request.getAttribute("err_user_pass").toString();
	}
	if(request.getAttribute("err_name") != null){
		err_name = request.getAttribute("err_name").toString();
	}
	if(request.getAttribute("err_age") != null){
		err_age = request.getAttribute("err_age").toString();
	}
	if(request.getAttribute("err_sex") != null){
		err_sex = request.getAttribute("err_sex").toString();
	}
%>

<%
	String disp_user_id = "";
	String disp_user_pass = "";
	String disp_name = "";
	String disp_age = "";
	String disp_sex = "";
	String disp_seibetu_num = "";

	if (request.getAttribute("disp_user_id") != null) {
		disp_user_id = request.getAttribute("disp_user_id").toString();
	}else{
		disp_user_id = "";
	}
	if(request.getAttribute("disp_user_pass") != null){
		disp_user_pass = request.getAttribute("disp_user_pass").toString();
	}else{
		disp_user_pass = "";
	}
	if(request.getAttribute("disp_name") != null){
		disp_name = request.getAttribute("disp_name").toString();
	}else{
		disp_name = "";
	}
	if(request.getAttribute("disp_age") != null){
		err_age = request.getAttribute("disp_age").toString();
	}else{
		disp_age = "";
	}
 	if(request.getAttribute("disp__sex") != null){
		disp_seibetu_num = request.getAttribute("disp__sex").toString();
	}else{
		disp_seibetu_num ="";
	}

 	if(request.getAttribute("disp_seibetu_num") != null){
		disp_seibetu_num = request.getAttribute("disp_seibetu_num").toString();
	}else{
		disp_seibetu_num ="";
	}

%>

<script type="text/javascript">
	function SelectChenge() {
		var val = document.getElementById("Select").selectedIndex;
		if (val == "3") {
			document.getElementById("input").style.display = "inline";
		} else {
			document.getElementById("input").style.display = "none";
		}
	}
</script>

</head>
<body>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


	<form action="./Member" method="post">
		<h1>会員登録</h1>
		<div>
			<label for="login_user">ログインユーザーID</label> <br>
			 <input
				type="text" required name="login_user"
				value=<%=disp_user_id%>><%=err_user_id%>
		</div>
		<p>
		<div>
			<label for="login_pass">パスワード</label> <br> <input type="text"
				required name="login_pass" value=<%=disp_user_pass%>><%=err_user_pass%>
		</div>
		<p>
		<div>
			<label for="name">氏名</label> <br> <input type="text" required
				name="name"  value=<%=disp_name%>><%=err_name%>
		</div>
		<p>
		<div>
			<label for="age">年齢</label> <br>
			<input type="text" required name="age" value=<%=disp_age%>><%=err_age%>
		</div>
		<p>
		<div>
			<label for="sex">性別</label> <br>
			<select id="Select" name="sex"
				onchange="SelectChenge();">
				<option></option>
				<option value="0">男性</option>
				<option value="1">女性</option>
				<option value="2">カスタム</option>
			</select>
			<input type="text" required id="input" name="gender" style="display: none" value=<%=disp_sex%>><%=err_sex%>>


		</div>
		<p>
		<div>
			<input type="submit" value="確認"> <input type="button"
				onclick="location.href='menu.jsp'" value="戻る">
		</div>
	</form>
</body>
</html>