package controller;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

/**
 * Servlet implementation class Member
 */
@WebServlet("/Member")
public class Member extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("Postでリクエストされた");
		request.setCharacterEncoding("UTF8");

		//エラーメッセージ
		String id_err = "IDを正しく入力してください";
		String pass_err = "パスワードを正しく入力してください";
		String name_err = "名前を正しく入力してください";
		String age_err = "年齢を正しく入力してください";
		String sex_err = "性別を正しく入力してください";

		//年齢
		Pattern p1 = Pattern.compile("^\\d{1,3}$"); //3行
		Pattern p2 = Pattern.compile("^[0-9]*$"); //0~9数字

		//氏名
		Pattern p3 = Pattern.compile("^{1,20}[^ -~｡-ﾟ]+$");
		Pattern p4 = Pattern.compile("^{1,20}+$");
		//Pattern p5 = Pattern.compile("^[0-9a-zA-Z]+$"); //１桁以上の半角英数
		Pattern p6 = Pattern.compile("[-_@+*;:#$%&A-Za-z0-9]+"); //半悪英数記号

		//初期値
		String login_user_id = "";
		String login_user_pass = "";
		String in_name = "";
		String in_age = "";
		String in_sex = "";
		String in_gender = "";

		boolean flg = true;
		//boolean isError = false;
		boolean idError = false;
		boolean passError = false;
		boolean nameError = false;
		boolean ageError = false;
		boolean sexError = false;
		//boolean genderError = false;


		// 呼び出し元Jspからデータ受け取り
		login_user_id = request.getParameter("login_user");
		login_user_pass = request.getParameter("login_pass");

		in_name = request.getParameter("name");
		in_age = request.getParameter("age");
		in_sex = request.getParameter("sex");
		in_gender = request.getParameter("gender");

		StringUtils.isEmpty(in_name);
		StringUtils.isEmpty(in_age);
		StringUtils.isEmpty(in_sex);

		/**
		 * 結果結果飛ばす
		 */
		// ログインユーザーID確認
		if (!p4.matcher(login_user_id).find() && p6.matcher(login_user_id).find()) {
			request.setAttribute("res_user_id", login_user_id);
			idError = true;
		} else {
			request.setAttribute("err_user_id", id_err);
			idError = false;

		}

		// ログインユーザーパスワード確認
		if (!p4.matcher(login_user_pass).find() && p6.matcher(login_user_pass).find()) {
			request.setAttribute("res_user_pass", login_user_pass);
			passError = true;
		} else {
			request.setAttribute("err_user_pass", pass_err);
			passError = false;
		}

		// 氏名正規表現をしてJspに渡データセット
		//if (p3.matcher(in_name).find() && p4.matcher(in_name).find() && StringUtils.isEmpty(in_name) == flg) {
			if (p3.matcher(in_name).find() && p4.matcher(in_name).find()) {
			request.setAttribute("err_name", name_err);
			nameError = false;
		} else {
			request.setAttribute("res_name", in_name);
			nameError = true;
		}

		// 年齢正規表現をしてJspに渡データセット
		//if (p1.matcher(in_age).find() && p2.matcher(in_age).find() && StringUtils.isEmpty(in_age) != flg) {
			if (p1.matcher(in_age).find() && p2.matcher(in_age).find()) {
			request.setAttribute("res_age", in_age);
			ageError = true;
		} else {
			request.setAttribute("err_age", age_err);
			ageError = false;
		}

		//性別セレクト
		if (in_sex.equals("0")) {
			request.setAttribute("res_sex", "男性");
			sexError = true;
		} else if (in_sex.equals("1")) {
			request.setAttribute("res_sex", "女性");
			sexError = true;
		} else if (in_sex.equals("2")) {
			request.setAttribute("res_sex", in_gender);
			sexError = true;
		} else {
			request.setAttribute("err_sex", sex_err);
			sexError = false;
		}
		request.setAttribute("seibetu_num", in_sex);

		// confirm.jsp にページ遷移
		if (idError == flg && passError == flg && nameError == flg && ageError == flg && sexError == flg) {
			RequestDispatcher dispatch = request.getRequestDispatcher("confirm.jsp");
			dispatch.forward(request, response);
		} else {
			RequestDispatcher dispatch = request.getRequestDispatcher("member.jsp");
			dispatch.forward(request, response);
		}


	}

}
