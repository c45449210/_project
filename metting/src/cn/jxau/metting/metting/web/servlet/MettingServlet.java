package cn.jxau.metting.metting.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.bcel.internal.generic.NEW;

import cn.jxau.metting.category.domain.Category;
import cn.jxau.metting.metting.service.MettingService;
import cn.jxau.metting.order.domain.Order;
import cn.jxau.metting.order.service.OrderService;
import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

public class MettingServlet extends BaseServlet {
	private MettingService mettingService = new MettingService();
	private Collaborative_Filtering CF = new Collaborative_Filtering();
	private OrderService orderService = new OrderService();

	public String load(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1. 得到参数bid 2. 查询得到Metting 3. 保存，转发到desc.jsp
		 */
		request.getSession().setAttribute("metting_desc",
				mettingService.load(request.getParameter("bid")));
		return "r:/jsps/desc_main.jsp";
	}

	/**
	 * 查询所有
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 * 
	 *             public String findAll(HttpServletRequest request,
	 *             HttpServletResponse response) throws ServletException,
	 *             IOException { request.setAttribute("mettingList",
	 *             mettingService.findAll()); return "f:/jsps/metting/list.jsp";
	 *             }
	 */
	/**
	 * 按分类查询
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findByCategory(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String cid = request.getParameter("cid");
		request.setAttribute("mettingList", mettingService.findByCategory(cid));
		return "f:/jsps/metting/list.jsp";
	}

	/**
	 * 获得推荐
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String getRecommend(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		if (uid == null || uid.isEmpty()) {
			return "r:/jsps/user/login.jsp";
		} else {
			return "r:/MettingServlet?method=load&bid=" + CF.getownResult(uid);
		}
	}

	/**
	 * 预定
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String reserve(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uidString");
		// String bid = request.getParameter("bid");
		// String uid = request.getParameter("uid");

		Order order = CommonUtils
				.toBean(request.getParameterMap(), Order.class);
		/**
		 * 生成随机数
		 * 
		 */
		order.setOidString(CommonUtils.uuid());
		//
		// System.out.println(" MettingServlet reserve + " + order);
		//
		
		System.out.println(" MettingServlet reserve + " + uid);
		
		//
		orderService.add(order);

		if (uid == null || uid.isEmpty()) {
			
			System.out.println(" MettingServlet reserve + " + uid);
			
			return "f:/jsps/user/login.jsp";
		} else {

			// return "r:/MettingServlet?method=load&bid=" +
			// CF.getownResult(uid);
			/**
			 * 不为空则回到首页
			 */
			request.setAttribute("msg", "预定提交成功");
			return "/jsps/msg2.jsp";

		}

	}
}
