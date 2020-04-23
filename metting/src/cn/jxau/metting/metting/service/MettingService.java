package cn.jxau.metting.metting.service;

import java.util.List;
import java.util.Map;

import cn.jxau.metting.metting.dao.MettingDao;
import cn.jxau.metting.metting.domain.Metting;

public class MettingService {
	private MettingDao mettingDao = new MettingDao();
	
	/**
	 * 查询所有会议室
	 * @return
	 */
	public List<Metting> findAll() {
		return mettingDao.findAll();
	}

	/**
	 * 按分类查询会议室
	 * @param cid
	 * @return
	 */
	public List<Metting> findByCategory(String cid) {
		return mettingDao.findByCategory(cid);
	}
	/**
	 * 寻找用户的评分
	 * @param uid
	 * @return
	 */
	public List<Map<String, Object>> findUidAndScoreByScore(String uid){
		return mettingDao.findUidAndScoreByScore(uid);
	}
	/**
	 * 寻找每个用户的评分量
	 * @param uid
	 * @return
	 */
	public List<Object[]> findAllUidAndCountScoreByScore(){
		return mettingDao.findAllUidAndCountScoreByScore();
	}


	public Metting load(String bid) {
		return mettingDao.findByBid(bid);
	}

	/**
	 * 　添加会议室
	 * @param metting
	 */
	public void add(Metting metting) {

		mettingDao.add(metting);
	}
	
	public void delete(String bid) {
		mettingDao.delete(bid);
	}

	public void edit(Metting metting) {
		mettingDao.edit(metting);
	}
}
