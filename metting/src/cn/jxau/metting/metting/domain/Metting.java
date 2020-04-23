package cn.jxau.metting.metting.domain;

import cn.jxau.metting.category.domain.Category;

public class Metting {
	private String bid;
	private String bname;
	private double price;
	private String author;
	private String image;
	private String mtext;
	private Category category;
	private String are;
	private String height;
	private String maddress;
	private String people;
	private String mlocal;
	private String lizhu;
	private String juchangshi;
	private String yanhuishi;
	private String kezhuoshi;
	private String cid;
	private boolean del;
	private String floor;
	
	public String getFloor() {
		return floor;
	}

	public void setFloor(String floor) {
		this.floor = floor;
	}
	
	
	public boolean getdel( ){
		return del;
	}
	public String getAre() {
		return are;
	}

	public void setAre(String are) {
		this.are = are;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getMaddress() {
		return maddress;
	}

	public void setMaddress(String maddress) {
		this.maddress = maddress;
	}

	public String getPeople() {
		return people;
	}

	public void setPeople(String people) {
		this.people = people;
	}

	public String getMlocal() {
		return mlocal;
	}

	public void setMlocal(String mlocal) {
		this.mlocal = mlocal;
	}

	public String getLizhu() {
		return lizhu;
	}

	public void setLizhu(String lizhu) {
		this.lizhu = lizhu;
	}

	public String getJuchangshi() {
		return juchangshi;
	}

	public void setJuchangshi(String juchangshi) {
		this.juchangshi = juchangshi;
	}

	public String getYanhuishi() {
		return yanhuishi;
	}

	public void setYanhuishi(String yanhuishi) {
		this.yanhuishi = yanhuishi;
	}

	public String getKezhuoshi() {
		return kezhuoshi;
	}

	public void setKezhuoshi(String kezhuoshi) {
		this.kezhuoshi = kezhuoshi;
	}

	
	public boolean isDel() {
		return del;
	}
	
	public String getMtext() {
		return mtext;
	}

	public void setMtext(String mtext) {
		this.mtext = mtext;
	}

	public void setDel(boolean del) {
		this.del = del;
	}
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getCid() {
		return cid;
	}
	@Override
	public String toString() {
		return "Metting [bid=" + bid + ", bname=" + bname + ", price=" + price
				+ ", author=" + author + ", image=" + image + ", mtext="
				+ mtext + ", cid=" + cid + ", are=" + are
				+ ", height=" + height + ", maddress=" + maddress + ", people="
				+ people + ", mlocal=" + mlocal + ", lizhu=" + lizhu
				+ ", juchangshi=" + juchangshi + ", yanhuishi=" + yanhuishi
				+ ", kezhuoshi=" + kezhuoshi + ", floor=" + floor + ", del="
				+ del + "]";
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public void setCid(String cid){
		this.cid = cid;
	}
}
