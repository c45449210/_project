package cn.jxau.metting.order.web.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.jxau.metting.cart.domain.Cart;
import cn.jxau.metting.cart.domain.CartItem;
import cn.jxau.metting.order.domain.Order;
import cn.jxau.metting.order.domain.OrderItem;
import cn.jxau.metting.order.service.OrderException;
import cn.jxau.metting.order.service.OrderService;
import cn.jxau.metting.user.domain.User;
import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

public class OrderServlet extends BaseServlet {
	private OrderService orderService = new OrderService();

	/**
	 * 这个方法是易宝回调方法 我们必须要判断调用本方法的是不是易宝！
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String back(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/* 保存成功信息，转发到msg.jsp */

		request.setAttribute("msg", "支付成功！等待卖家发货！你慢慢等~");
		return "f:/jsps/msg.jsp";
	}

	/**
	 * 确认收货
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String confirm(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 1. 获取oid参数 2. 调用service方法 > 如果有异常，保存异常信息，转发到msg.jsp 3.
		 * 保存成功信息，转发到msg.jsp
		 */
		String oid = request.getParameter("oid");
		try {
			orderService.confirm(oid);
			request.setAttribute("msg", "恭喜，交易成功！");
		} catch (OrderException e) {
			request.setAttribute("msg", e.getMessage());
		}
		return "f:/jsps/msg.jsp";
	}

	/**
	 * 提交评价
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String submitScore(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 1. 得到oid参数 2. 使用oid调用service方法得到Order 3.
		 * 保存到request域，转发到/jsps/order/desc.jsp
		 */
		String submitScore = request.getParameter("scoreString");
		String oidString = request.getParameter("oidString");
		String uidString =request.getParameter("uidString");
		// request.setAttribute("order",
		// orderService.load(request.getParameter("oid")));
		orderService.submitScore(submitScore, oidString);
//		return "f:/jsps/order/list.jsp";
		return "r:/OrderServlet?method=myOrders&uidString="+uidString;
	}

	/**
	 * 我的订单
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String myOrders(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 1. 从session得到当前用户，再获取其uid 2.
		 * 使用uid调用orderService#myOrders(uid)得到该用户的所有订单List<Order> 3.
		 * 把订单列表保存到request域中，转发到/jsps/order/list.jsp
		 */
		User user = (User) request.getSession().getAttribute("session_user");
		List<Order> orderList = orderService.myOrders(user.getUid());
		request.setAttribute("orderList", orderList);
		return "f:/jsps/order/list.jsp";
	}

	/**
	 * 添加订单 把session中的车用来生成Order对象
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1. 从session中得到cart 2. 使用cart生成Order对象 3. 调用service方法完成添加订单 4.
		 * 保存order到request域中，转发到/jsps/order/desc.jsp
		 */
		// 从session中获取cart
		Cart cart = (Cart) request.getSession().getAttribute("cart");
		// 把cart转换成Order对象
		/*
		 * 创建Order对象，并设置属性
		 * 
		 * Cart --> Order
		 */
		Order order = new Order();
		order.setOid(CommonUtils.uuid());// 设置编号
		order.setOrdertime(new Date());// 设置下单时间
		order.setState(1);// 设置订单状态为1，表示未付款
		User user = (User) request.getSession().getAttribute("session_user");
		order.setOwner(user);// 设置订单所有者
		order.setTotal(cart.getTotal());// 设置订单的合计，从cart中获取合计

		/*
		 * 创建订单条目集合
		 * 
		 * cartItemList --> orderItemList
		 */
		List<OrderItem> orderItemList = new ArrayList<OrderItem>();
		// 循环遍历Cart中的所有CartItem，使用每一个CartItem对象创建OrderItem对象，并添加到集合中
		for (CartItem cartItem : cart.getCartItems()) {
			OrderItem oi = new OrderItem();// 创建订单条目

			oi.setIid(CommonUtils.uuid());// 设置条目的id
			oi.setCount(cartItem.getCount());// 设置条目的数量
			oi.setMetting(cartItem.getMetting());// 设置条目的会议室
			oi.setSubtotal(cartItem.getSubtotal());// 设置条目的小计
			oi.setOrder(order);// 设置所属订单

			orderItemList.add(oi);// 把订单条目添加到集合中
		}

		// 把所有的订单条目添加到订单中
		order.setOrderItemList(orderItemList);

		// 清空购物车
		cart.clear();

		// ////////////////////////////////////////////

		/*
		 * 3. 调用orderService添加订单
		 */
		orderService.add(order);
		/*
		 * 4. 保存order到request域，转发到/jsps/order/desc.jsp
		 */
		request.setAttribute("order", order);
		return "/jsps/order/desc.jsp";
	}
}
