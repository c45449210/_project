package cn.jxau.metting;

import java.net.URLDecoder;

public class test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		URLDecoder url = new URLDecoder();
		String detailUrl = "file:///C:/Users/TomeChen/Desktop/jQuery%E6%97%A5%E6%9C%9F%E6%97%B6%E9%97%B4%E9%80%89%E6%8B%A9%E5%99%A8%E6%8F%92%E4%BB%B6/index.html?datepicker=8%3A00&datepicker=19%3A30&datepicker=2015-5-13&submit=tijiao";
		String detailUrl1 = URLDecoder.decode(detailUrl);
		System.out.print(detailUrl1);

	}

}
