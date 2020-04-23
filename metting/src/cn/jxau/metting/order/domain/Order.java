package cn.jxau.metting.order.domain;

import cn.jxau.metting.user.domain.User;

/**
 * 订单类
 * 
 */
public class Order {

	// private String oid;
	// private Date ordertime;// 下单时间
	// private double total;// 合计
	// private int state;// 订单状态有四种：1未付款 2已付款但未发货 3已发货但未确认收货 4已确认交易成功
	// private User owner;// 订单所有者
	// private String address;// 收货地址
	//
	// private List<OrderItem> orderItemList;//当前订单下所有条目
	private String oidString;// 订单id
	private String bidString;// 会议室id
	private String uidString;// 用户id
	private String userNameString;// 用户在订单中的名字
	private String userTeleString;// 用户电话号码
	private String userNeedString; // 用户需求
	private String userCategoryString;// 会议室的类型
	private String mettingTimeString;// 开会的时间
	private String mettingRadioGroup1;// 会议室摆台形式
	private String mettingReserveNeedThing;// 会议室设施、
	private String orderEmailString;// 联系邮箱
	private String orderDateString;// 会议室日期
	private String orderPeopleString;// 活动人数
	private String orderCompanynameString;// 公司名称
	private String orderMoneyString;// 整体的预算
	private String orderElseString;// 其他需求

	private String bname;// 多表联合查询所用
	private String username;// 多表联合查询所用
	private String scoreString;//用户评分

	public String getScoreString() {
		return scoreString;
	}

	public void setScoreString(String scoreString) {
		this.scoreString = scoreString;
	}

	public String getBname() {
		return bname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public String getOidString() {
		return oidString;
	}

	public void setOidString(String oidString) {
		this.oidString = oidString;
	}

	public String getBidString() {
		return bidString;
	}

	public void setBidString(String bidString) {
		this.bidString = bidString;
	}

	public String getUidString() {
		return uidString;
	}

	public void setUidString(String uidString) {
		this.uidString = uidString;
	}

	public String getUserNameString() {
		return userNameString;
	}

	public void setUserNameString(String userNameString) {
		this.userNameString = userNameString;
	}

	public String getUserTeleString() {
		return userTeleString;
	}

	public void setUserTeleString(String userTeleString) {
		this.userTeleString = userTeleString;
	}

	public String getUserNeedString() {
		return userNeedString;
	}

	public void setUserNeedString(String userNeedString) {
		this.userNeedString = userNeedString;
	}

	public String getUserCategoryString() {
		return userCategoryString;
	}

	public void setUserCategoryString(String userCategoryString) {
		this.userCategoryString = userCategoryString;
	}

	public String getMettingTimeString() {
		return mettingTimeString;
	}

	public void setMettingTimeString(String mettingTimeString) {
		this.mettingTimeString = mettingTimeString;
	}

	public String getMettingRadioGroup1() {
		return mettingRadioGroup1;
	}

	public void setMettingRadioGroup1(String mettingRadioGroup1) {
		this.mettingRadioGroup1 = mettingRadioGroup1;
	}

	public String getMettingReserveNeedThing() {
		return mettingReserveNeedThing;
	}

	public void setMettingReserveNeedThing(String mettingReserveNeedThing) {
		this.mettingReserveNeedThing = mettingReserveNeedThing;
	}

	public String getOrderEmailString() {
		return orderEmailString;
	}

	public void setOrderEmailString(String orderEmailString) {
		this.orderEmailString = orderEmailString;
	}

	public String getOrderDateString() {
		return orderDateString;
	}

	public void setOrderDateString(String orderDateString) {
		this.orderDateString = orderDateString;
	}

	public String getOrderPeopleString() {
		return orderPeopleString;
	}

	public void setOrderPeopleString(String orderPeopleString) {
		this.orderPeopleString = orderPeopleString;
	}

	public String getOrderCompanynameString() {
		return orderCompanynameString;
	}

	public void setOrderCompanynameString(String orderCompanynameString) {
		this.orderCompanynameString = orderCompanynameString;
	}

	public String getOrderMoneyString() {
		return orderMoneyString;
	}

	public void setOrderMoneyString(String orderMoneyString) {
		this.orderMoneyString = orderMoneyString;
	}

	public String getOrderElseString() {
		return orderElseString;
	}

	public void setOrderElseString(String orderElseString) {
		this.orderElseString = orderElseString;
	}

	@Override
	public String toString() {
		return "Order [oidString=" + oidString + ", bidString=" + bidString
				+ ", uidString=" + uidString + ", userNameString="
				+ userNameString + ", userTeleString=" + userTeleString
				+ ", userNeedString=" + userNeedString
				+ ", userCategoryString=" + userCategoryString
				+ ", mettingTimeString=" + mettingTimeString
				+ ", mettingRadioGroup1=" + mettingRadioGroup1
				+ ", mettingReserveNeedThing=" + mettingReserveNeedThing
				+ ", orderEmailString=" + orderEmailString
				+ ", orderDateString=" + orderDateString
				+ ", orderPeopleString=" + orderPeopleString
				+ ", orderCompanynameString=" + orderCompanynameString
				+ ", orderMoneyString=" + orderMoneyString
				+ ", orderElseString=" + orderElseString + ", bname=" + bname
				+ ", username=" + username + ", scoreString=" + scoreString
				+ "]";
	}

}
