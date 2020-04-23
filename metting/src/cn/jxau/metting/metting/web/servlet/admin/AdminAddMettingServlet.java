package cn.jxau.metting.metting.web.servlet.admin;

import java.awt.Image;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.ImageIcon;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import cn.jxau.metting.metting.domain.Metting;
import cn.jxau.metting.metting.service.MettingService;
import cn.jxau.metting.category.domain.Category;
import cn.jxau.metting.category.service.CategoryService;
import cn.jxau.metting.category.web.servlet.CategoryServlet;
import cn.itcast.commons.CommonUtils;

public class AdminAddMettingServlet extends HttpServlet {
	private MettingService mettingService = new MettingService();
	private CategoryService categoryService = new CategoryService();

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");

		System.out.println("admin add metting sercive do post 2 "
				+ request.getParameterMap());
		Metting metting = CommonUtils.toBean(request.getParameterMap(),
				Metting.class);
		// 为Metting指定bid
		metting.setBid(CommonUtils.uuid());
		System.out.println("admin add metting sercive do post 2 " + metting);
		
		mettingService.add(metting);

		request.getRequestDispatcher(
				"/admin/AdminMettingServlet?method=findAll").forward(request,
				response);
		/*
		 * 1. 把表单数据封装到Metting对象中 * 上传三步
		 */

		// // 创建工厂
		// DiskFileItemFactory factory = new DiskFileItemFactory(15 * 1024, new
		// File("F:/f/temp"));
		// // 得到解析器
		// ServletFileUpload sfu = new ServletFileUpload(factory);
		// // 设置单个文件大小为15KB
		// sfu.setFileSizeMax(20 * 1024);
		// // 使用解析器去解析request对象，得到List<FileItem>
		// System.out.println("admin add metting sercive do post 2 " );

		try {
			// List<FileItem> fileItemList = sfu.parseRequest(request);
			/*
			 * * 把fileItemList中的数据封装到Metting对象中 > 把所有的普通表单字段数据先封装到Map中 >
			 * 再把map中的数据封装到Metting对象中
			 */
			// Map<String,String> map = new HashMap<String,String>();
			// for(FileItem fileItem : fileItemList) {
			// if(fileItem.isFormField()) {
			// map.put(fileItem.getFieldName(), fileItem.getString("UTF-8"));
			// }
			// }

			// Metting metting = CommonUtils.toBean(map, Metting.class);

			//
			// Metting metting = CommonUtils.toBean(request.getParameterMap(),
			// Metting.class);
			// // 为Metting指定bid
			// metting.setBid(CommonUtils.uuid());
			// System.out.println("admin add metting sercive do post 2"+metting);
			//

			// /*
			// * 需要把Map中的cid封装到Category对象中，再把Category赋给Metting
			// */
			// Category category = CommonUtils.toBean(map, Category.class);
			// metting.setCategory(category);

			/*
			 * 2. 保存上传的文件 * 保存的目录 * 保存的文件名称
			 */
			// 得到保存的目录
			// String savepath =
			// this.getServletContext().getRealPath("/metting_img");
			// 得到文件名称：给原来文件名称添加uuid前缀！避免文件名冲突
			// String filename = CommonUtils.uuid() + "_" +
			// fileItemList.get(1).getName();

			/*
			 * 校验文件的扩展名
			 */
			// if(!filename.toLowerCase().endsWith("jpg")) {
			// request.setAttribute("msg", "您上传的图片不是JPG扩展名！");
			// request.setAttribute("categoryList", categoryService.findAll());
			// request.getRequestDispatcher("/adminjsps/admin/metting/add.jsp")
			// .forward(request, response);
			// return;
			// }

			// // 使用目录和文件名称创建目标文件
			// File destFile = new File(savepath, filename);
			// // 保存上传文件到目标文件位置
			// fileItemList.get(1).write(destFile);
			//
			// /*
			// * 3. 设置Metting对象的image，即把图片的路径设置给Metting的image
			// */
			// metting.setImage("metting_img/" + filename);
			//
			//
			// System.out.println("admin add metting sercive do post "+filename
			// );

			/*
			 * 4. 使用MettingService完成保存
			 */
			// mettingService.add(metting);

			/*
			 * 校验图片的尺寸
			 */
			// Image image = new
			// ImageIcon(destFile.getAbsolutePath()).getImage();
			// if(image.getWidth(null) > 200 || image.getHeight(null) > 200) {
			// destFile.delete();//删除这个文件！
			// request.setAttribute("msg", "您上传的图片尺寸超出了200 * 200！");
			// request.setAttribute("categoryList", categoryService.findAll());
			// request.getRequestDispatcher("/adminjsps/admin/metting/add.jsp")
			// .forward(request, response);
			// return;
			// }

			/*
			 * 5. 返回到会议室列表
			 */
			// request.getRequestDispatcher("/admin/AdminMettingServlet?method=findAll")
			// .forward(request, response);
		} catch (Exception e) {
			if (e instanceof FileUploadBase.FileSizeLimitExceededException) {
				request.setAttribute("msg", "您上传的文件超出了15KB");
				request.setAttribute("categoryList", categoryService.findAll());
				request.getRequestDispatcher("/adminjsps/admin/metting/add.jsp")
						.forward(request, response);
			}
		}
	}
}
