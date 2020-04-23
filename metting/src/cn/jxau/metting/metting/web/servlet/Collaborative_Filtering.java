package cn.jxau.metting.metting.web.servlet;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import cn.jxau.metting.metting.domain.Score;
import cn.jxau.metting.metting.service.MettingService;

//基于用户的协同过滤算法  
public class Collaborative_Filtering {
	/* 列表转化 */
	public static Map<String, Integer> getlist(List<Map<String, Object>> list) {
		Map<String, Integer> sorce1 = new HashMap<String, Integer>();
		Map<String, Object> tempMap = new HashMap<String, Object>();
		for (int i = 0; i < list.size(); i++) {
			tempMap = list.get(i);
			sorce1.put(tempMap.get("bid").toString(),
					(Integer) tempMap.get("score"));

		}
		return sorce1;
	}

	public static Map<String, Integer> getlist(List<Map<String, Object>> list,
			int sorce) {
		Map<String, Integer> sorce1 = new HashMap<String, Integer>();
		Map<String, Object> tempMap = new HashMap<String, Object>();
		for (int i = sorce; i < list.size(); i++) {
			tempMap = list.get(i);
			sorce1.put(tempMap.get("bid").toString(),
					(Integer) tempMap.get("score"));

		}
		return sorce1;
	}

	/* 运算结果 */
	public static String getownResult(String uid) {

		MettingService mettingService = new MettingService();
		/* 获取数据 */
		Map<String, Map<String, Integer>> myMap = new HashMap<String, Map<String, Integer>>();

		for (int i = 1; i <= 5; i++) {
			Map<String, Integer> user1 = new HashMap<String, Integer>();// 中间量
			String temp = String.valueOf(i);// 转换值
			user1 = getlist(mettingService.findUidAndScoreByScore(temp));// 转换成list
			String temp1 = "p" + String.valueOf(i);
			myMap.put(temp1, user1);// 添加入
		}
		// System.out.println( myMap);
		/* 输出相关系数 */
		Map<String, Integer> usergroup = new HashMap<String, Integer>();
		usergroup = getlist(mettingService.findUidAndScoreByScore(uid));

		Map<String, Double> simUserSimMap = new HashMap<String, Double>();
		// System.out.println("皮尔逊相关系数:");

		for (Entry<String, Map<String, Integer>> userPerfEn : myMap.entrySet()) {
			String userName = userPerfEn.getKey();
			String useid = "p" + uid;
			if (!useid.equals(userName)) {
				double sim = getUserSimilar(usergroup, userPerfEn.getValue());
				// System.out.println(useid+"与" + userName + "之间的相关系数:" + sim);
				simUserSimMap.put(userName, sim);
			}
		}
		/* 获取推荐 */

		Map<String, Map<String, Integer>> simUserObjMap = new HashMap<String, Map<String, Integer>>();
		for (int i = 1; i <= 3; i++) {

			Map<String, Integer> user1 = new HashMap<String, Integer>();
			String temp = String.valueOf(i);
			user1 = getlist(mettingService.findUidAndScoreByScore(temp), 5);
			String temp1 = "p" + String.valueOf(i);
			simUserObjMap.put(temp1, user1);
		}
		// System.out.println(simUserObjMap);

		//System.out.println("推荐结果:" + getRecommend(simUserObjMap, simUserSimMap));
		return getRecommend(simUserObjMap, simUserSimMap);
	}

	// Claculate Pearson Correlation Coefficient
	public static double getUserSimilar(Map<String, Integer> pm1,
			Map<String, Integer> pm2) {
		int n = 0;// 数量n
		int sxy = 0;// Σxy=x1*y1+x2*y2+....xn*yn
		int sx = 0;// Σx=x1+x2+....xn
		int sy = 0;// Σy=y1+y2+...yn
		int sx2 = 0;// Σx2=(x1)2+(x2)2+....(xn)2
		int sy2 = 0;// Σy2=(y1)2+(y2)2+....(yn)2
		for (Entry<String, Integer> pme : pm1.entrySet()) {
			String key = pme.getKey();
			Integer x = pme.getValue();
			Integer y = pm2.get(key);
			if (x != null && y != null) {
				n++;
				sxy += x * y;
				sx += x;
				sy += y;
				sx2 += Math.pow(x, 2);
				sy2 += Math.pow(y, 2);
			}
		}
		// p=(Σxy-Σx*Σy/n)/Math.sqrt((Σx2-(Σx)2/n)(Σy2-(Σy)2/n));
		double sd = sxy - sx * sy / n;
		double sm = Math.sqrt((sx2 - Math.pow(sx, 2) / n)
				* (sy2 - Math.pow(sy, 2) / n));
		return Math.abs(sm == 0 ? 1 : sd / sm);
	}

	// 获取推荐结果
	public static String getRecommend(
			Map<String, Map<String, Integer>> simUserObjMap,
			Map<String, Double> simUserSimMap) {
		Map<String, Double> objScoreMap = new HashMap<String, Double>();
		for (Entry<String, Map<String, Integer>> simUserEn : simUserObjMap
				.entrySet()) {
			String user = simUserEn.getKey();
			double sim = simUserSimMap.get(user);
			for (Entry<String, Integer> simObjEn : simUserEn.getValue()
					.entrySet()) {
				double objScore = sim * simObjEn.getValue();// 加权（相似度*评分）
				String objName = simObjEn.getKey();
				if (objScoreMap.get(objName) == null) {
					objScoreMap.put(objName, objScore);
				} else {
					double totalScore = objScoreMap.get(objName);
					objScoreMap.put(objName, totalScore + objScore);// 将所有用户的加权评分作为最后的推荐结果数据
				}
			}
		}
		List<Entry<String, Double>> enList = new ArrayList<Entry<String, Double>>(
				objScoreMap.entrySet());
		Collections.sort(enList, new Comparator<Map.Entry<String, Double>>() {// 排序
					public int compare(Map.Entry<String, Double> o1,
							Map.Entry<String, Double> o2) {
						Double a = o1.getValue() - o2.getValue();
						if (a == 0) {
							return 0;
						} else if (a > 0) {
							return 1;
						} else {
							return -1;
						}
					}
				});
		/*
		 * for (Entry<String, Double> entry : enList) {
		 * System.out.println(entry.getKey() + "的加权推荐值:" + entry.getValue()); }
		 */
		return enList.get(enList.size() - 1).getKey();// 返回推荐结果
	}

	/*public static void main(String[] args) {
		Collaborative_Filtering CF = new Collaborative_Filtering();
		String we = CF.getownResult("5");
		System.out.println(we);
	}*/
}