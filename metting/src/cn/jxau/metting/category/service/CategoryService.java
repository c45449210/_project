package cn.jxau.metting.category.service;

import java.util.List;

import cn.jxau.metting.metting.dao.MettingDao;
import cn.jxau.metting.category.dao.CategoryDao;
import cn.jxau.metting.category.domain.Category;
import cn.jxau.metting.category.web.servlet.admin.CategoryException;

public class CategoryService {
	private CategoryDao categoryDao = new CategoryDao();
	private MettingDao mettingDao = new MettingDao();

	/**
	 * 查询所有分类
	 * @return
	 */
	public List<Category> findAll() {
		return categoryDao.findAll();
	}

	/**
	 * 添加分类
	 * @param category
	 */
	public void add(Category category) {
		categoryDao.add(category);
	}

	/**
	 * 删除分类
	 * @param cid
	 * @throws CategoryException 
	 */
	public void delete(String cid) throws CategoryException {
		// 获取该分类下会议室的本数
		int count = mettingDao.getCountByCid(cid);
		// 如果该分类下存在会议室，不让删除，我们抛出异常
		if(count > 0) throw new CategoryException("该分类下还有会议室，不能删除！");
		// 删除该分类
		categoryDao.delete(cid);
	}

	/**
	 * 加载分类
	 * @param cid
	 * @return
	 */
	public Category load(String cid) {
		return categoryDao.load(cid);
	}

	/**
	 * 修改分类
	 * @param category
	 */
	public void edit(Category category) {
		categoryDao.edit(category);
	} 
}
