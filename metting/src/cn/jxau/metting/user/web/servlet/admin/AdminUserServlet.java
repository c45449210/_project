package cn.jxau.metting.user.web.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;
import cn.jxau.metting.category.web.servlet.admin.CategoryException;
import cn.jxau.metting.user.domain.User;
import cn.jxau.metting.user.service.UserService;

public class AdminUserServlet extends BaseServlet {

	private UserService userService = new UserService();

	/**
	 * 修改之前的加载工作
	 */
	public String editPre(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		request.setAttribute("user", userService.load(uid));

		return "/adminjsps/admin/user/mod.jsp";
	}

	public String edit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1. 封装表单数据 2. 调用service方法完成修改工作 3. 调用findAll
		 */
		User user = CommonUtils.toBean(request.getParameterMap(), User.class);

		userService.edit(user);

		return findAll(request, response);
	}

	public String findAll(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 1. 调用service方法，得到所有分类 2.
		 * 保存到request域，转发到/adminjsps/admin/user/list.jsp
		 */
		request.setAttribute("userList", userService.findAll());
		return "/adminjsps/admin/user/list.jsp";
	}

	public String delete(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 1. 获取参数:cid 2. 调用service方法，传递cid参数 > 如果抛出异常，保存异常信息，转发到msg.jsp显示 3.
		 * 调用findAll()
		 */
		String uid = request.getParameter("uid");
		try {
			userService.delete(uid);
			return findAll(request, response);
		} catch (CategoryException e) {
			request.setAttribute("msg", e.getMessage());
			return "/adminjsps/msg.jsp";
		}
	}

}
