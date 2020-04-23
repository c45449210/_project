package cn.jxau.metting.user.web.servlet;

import java.io.IOException;
import java.text.MessageFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.jxau.metting.cart.domain.Cart;
import cn.jxau.metting.user.domain.User;
import cn.jxau.metting.user.service.UserException;
import cn.jxau.metting.user.service.UserService;
import cn.itcast.commons.CommonUtils;
import cn.itcast.mail.Mail;
import cn.itcast.mail.MailUtils;
import cn.itcast.servlet.BaseServlet;

/**
 * User表述层
 */
public class UserServlet extends BaseServlet {
	private UserService userService = new UserService();

	/**
	 * 退出功能
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String quit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().invalidate();
		return "r:/index.jsp";
	}

	public String login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1. 封装表单数据到form中 3. 调用service完成激活 > 保存错误信息、form到request，转发到login.jsp
		 * 4. 保存用户信息到session中，然后重定向到index.jsp
		 */
		User form = CommonUtils.toBean(request.getParameterMap(), User.class);

		try {

			User user = userService.login(form);
			request.getSession().setAttribute("session_user", user);
			
			
			/*
			 * 给用户添加一个购物车，即向session中保存一Cart对象
			 */
			request.getSession().setAttribute("cart", new Cart());
			request.getSession().removeAttribute("login_msg");
			request.getSession().removeAttribute("login_form");
			return "r:/index.jsp";
		} catch (UserException e) {

			request.getSession().setAttribute("login_msg", e.getMessage());
			request.getSession().setAttribute("login_form", form);
			return "r:/jsps/user/login.jsp";
		}
	}

	/**
	 * 注册功能
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String regist(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 封装表单数据到form对象中 补全：uid、code 输入校验 > 保存错误信息、form到request域，转发到regist.jsp
		 * 调用service方法完成注册 > 保存错误信息、form到request域，转发到regist.jsp 保存成功信息转发到msg.jsp
		 */
		// 封装表单数据
		User form = CommonUtils.toBean(request.getParameterMap(), User.class);

		// 补全
		form.setUid(CommonUtils.uuid());
		/*
		 * 输入校验 1. 创建一个Map，用来封装错误信息，其中key为表单字段名称，值为错误信息
		 */
		Map<String, String> errors = new HashMap<String, String>();
		/*
		 * 2. 获取form中的username、password、email进行校验
		 */
		String username = form.getUsername();
		if (username == null || username.trim().isEmpty()) {
			errors.put("username", "用户名不能为空！");
		} else if (username.length() < 3 || username.length() > 10) {
			errors.put("username", "用户名长度必须在3~10之间！");
		}

		String password = form.getPassword();
		if (password == null || password.trim().isEmpty()) {
			errors.put("password", "密码不能为空！");
		} else if (password.length() < 3 || password.length() > 10) {
			errors.put("password", "密码长度必须在3~10之间！");
		}

		String email = form.getEmail();
		if (email == null || email.trim().isEmpty()) {
			errors.put("email", "Email不能为空！");
		} else if (!email.matches("\\w+@\\w+\\.\\w+")) {
			errors.put("email", "Email格式错误！");
		}
		/*
		 * 3. 判断是否存在错误信息
		 */
		if (errors.size() > 0) {
			// 1. 保存错误信息
			// 2. 保存表单数据
			// 3. 转发到regist.jsp
			request.getSession().setAttribute("register_errors", errors);

			request.getSession().setAttribute("register_form", form);
			return "/jsps/user/register.jsp";
		}

		/*
		 * 调用service的regist()方法
		 */
		try {
			userService.regist(form);

		} catch (UserException e) {
			/*
			 * 1. 保存异常信息 2. 保存form 3. 转发到regist.jsp
			 */
			request.setAttribute("msg", e.getMessage());
			request.setAttribute("form", form);
			return "f:../jsps/user/regist.jsp";
		}

		 request.setAttribute("msg", "恭喜，注册成功！");
		return "/jsps/msg.jsp";
	}
}
