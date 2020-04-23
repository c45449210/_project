package cn.jxau.metting.metting.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.jxau.metting.metting.domain.Metting;
import cn.jxau.metting.metting.domain.Score;
import cn.jxau.metting.category.domain.Category;
import cn.itcast.commons.CommonUtils;
import cn.itcast.jdbc.JdbcUtils;
import cn.itcast.jdbc.TxQueryRunner;

public class MettingDao {
	private QueryRunner qr = new TxQueryRunner();

	/**
	 * 查询所有会议室
	 * 
	 * @return
	 */
	public List<Metting> findAll() {
		try {
			String sql = "select * from metting ";
			return qr.query(sql, new BeanListHandler<Metting>(Metting.class));
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 按分类查询
	 * 
	 * @param cid
	 * @return
	 */
	public List<Metting> findByCategory(String cid) {
		try {
			String sql = "select * from metting where cid=? ";
			return qr.query(sql, new BeanListHandler<Metting>(Metting.class),
					cid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 查询用户的评分
	 * 
	 * @param cid
	 * @return
	 * @return
	 */
	public List<Map<String, Object>> findUidAndScoreByScore(String uid) {
		try {
			String sql = "select bid,score from score where uid = ? ";
			return qr.query(sql, new MapListHandler(), uid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 查询评分的用户和评价数
	 * 
	 * @return
	 */
	public List<Object[]> findAllUidAndCountScoreByScore() {
		try {
			String sql = "select uid,count(bid) from score group by uid";
			return qr.query(sql, new ArrayListHandler());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 加载方法
	 * 
	 * @param bid
	 * @return
	 */
	public Metting findByBid(String bid) {
		try {
			/*
			 * 我们需要在Metting对象中保存Category的信息
			 */
			String sql = "select * from metting where bid=?";
			Map<String, Object> map = qr.query(sql, new MapHandler(), bid);
			/*
			 * 使用一个Map，映射出两个对象，再给这两个对象建立关系！
			 */
			Category category = CommonUtils.toBean(map, Category.class);
			Metting metting = CommonUtils.toBean(map, Metting.class);
			metting.setCategory(category);
			return metting;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 查询指定分类下的会议室本数
	 * 
	 * @param cid
	 * @return
	 */
	public int getCountByCid(String cid) {
		try {
			String sql = "select count(*) from metting where cid=?";
			Number cnt = (Number) qr.query(sql, new ScalarHandler(), cid);
			return cnt.intValue();
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 添加会议室
	 * 
	 * @param metting
	 */
	public void add(Metting metting) {
		try {
			String sql = "insert into metting values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			Object[] params = { metting.getBid(), metting.getBname(),
					metting.getPrice(), metting.getAuthor(),
					metting.getImage(), metting.getCid(),
					metting.getMtext(), metting.getAre(), metting.getHeight(),
					metting.getMlocal(), metting.getMaddress(),
					metting.getLizhu(), metting.getPeople(),
					metting.getJuchangshi(), metting.getYanhuishi(),
					metting.getKezhuoshi(), metting.getFloor(),
					metting.getdel() };
			qr.update(sql, params);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 删除会议室
	 * 
	 * @param bid
	 */
	public void delete(String bid) {
		try {
			String sql = "delete from metting where bid=?";
			qr.update(sql, bid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void edit(Metting metting) {
		try {
			String sql = "update metting set bname=?, price=?,author=?, image=?, cid=? where bid=?";
			Object[] params = { metting.getBname(), metting.getPrice(),
					metting.getAuthor(), metting.getImage(),
					metting.getCategory().getCid(), metting.getBid() };
			qr.update(sql, params);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
