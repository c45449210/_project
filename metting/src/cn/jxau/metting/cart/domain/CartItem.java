package cn.jxau.metting.cart.domain;

import java.math.BigDecimal;

import cn.jxau.metting.metting.domain.Metting;

/**
 * 购物车条目类
 * 
 */
public class CartItem {
	private Metting metting;// 商品
	private int count;// 数量
	
	/**
	 * 小计方法
	 * @return
	 * 处理了二进制运算误差问题
	 */
	public double getSubtotal() {//小计方法，但它没有对应的成员！
		BigDecimal d1 = new BigDecimal(metting.getPrice() + "");
		BigDecimal d2 = new BigDecimal(count + "");
		return d1.multiply(d2).doubleValue();
	}

	public Metting getMetting() {
		return metting;
	}

	public void setMetting(Metting metting) {
		this.metting = metting;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
}
