package cn.jxau.metting.order.domain;

import cn.jxau.metting.metting.domain.Metting;

/**
 * 订单条目类
 * 
 * 
 * 
 */
public class OrderItem {
	private String iid;
	private int count;// 数量
	private double subtotal;// 小计
	private Order order;// 所属订单
	private Metting metting;// 所要购买的会议室

	public String getIid() {
		return iid;
	}

	public void setIid(String iid) {
		this.iid = iid;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public double getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Metting getMetting() {
		return metting;
	}

	public void setMetting(Metting metting) {
		this.metting = metting;
	}

}
