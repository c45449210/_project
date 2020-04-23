package cn.jxau.metting.order.web.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;
import cn.jxau.metting.category.domain.Category;
import cn.jxau.metting.order.domain.Order;
import cn.jxau.metting.order.service.OrderService;

public class AdminOrderServlet extends BaseServlet {
	private OrderService orderService = new OrderService();

	public String findAll(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 1. 调用service方法，得到所有分类 2.
		 * 保存到request域，转发到/adminjsps/admin/order/list.jsp
		 */

		request.setAttribute("orderList", orderService.findAll());
		return "/adminjsps/admin/order/list.jsp";
	}

	public String details(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String oidString = request.getParameter("oidString");
		request.setAttribute("adminOrderList", orderService.details(oidString));

		System.out.println("adminOrderServlet details +  oidString "
				+ orderService.details(oidString));

		return "/adminjsps/admin/order/reserve.jsp";

	}
}
