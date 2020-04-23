package cn.jxau.metting.metting.web.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.jxau.metting.metting.domain.Metting;
import cn.jxau.metting.metting.service.MettingService;
import cn.jxau.metting.category.domain.Category;
import cn.jxau.metting.category.service.CategoryService;
import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

public class AdminMettingServlet extends BaseServlet {
	private MettingService mettingService = new MettingService();
	private CategoryService categoryService = new CategoryService();

	/**
	 * 添加会议室
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String addPre(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 查询所有分类，保存到request，转发到add.jsp add.jsp中把所有的分类使用下拉列表显示在表单中
		 */
		request.setAttribute("categoryList", categoryService.findAll());
		return "f:/adminjsps/admin/metting/add.jsp";
	}

	public String load(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1. 获取参数bid，通过bid调用service方法得到Metting对象 2. 获取所有分类，保存到request域中 3.
		 * 保存metting到request域中，转发到desc.jsp
		 */
		request.setAttribute("metting",
				mettingService.load(request.getParameter("bid")));
		request.setAttribute("categoryList", categoryService.findAll());
		return "f:/adminjsps/admin/metting/desc.jsp";
	}

	/**
	 * 查看所有会议室
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String findAll(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("mettingList", mettingService.findAll());
		return "f:/adminjsps/admin/metting/list.jsp";
	}

	/**
	 * 删除会议室
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String delete(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String bid = request.getParameter("bid");
		mettingService.delete(bid);
		return findAll(request, response);
	}

	/**
	 * 修改会议室
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String edit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Metting metting = CommonUtils.toBean(request.getParameterMap(),
				Metting.class);
		Category category = CommonUtils.toBean(request.getParameterMap(),
				Category.class);
		metting.setCategory(category);

		mettingService.edit(metting);
		return findAll(request, response);
	}

	/**
	 * 添加会议室
	 */

	public String add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Metting metting = CommonUtils.toBean(request.getParameterMap(),
				Metting.class);
		// 为Metting指定bid
		metting.setBid(CommonUtils.uuid());
		metting.setImage("image");

		mettingService.add(metting);
		return findAll(request, response);
	}
}
