package cn.jxau.metting.user.domain;

/**
 * User的领域对象
 * 
 * 
 * 
 */
public class User {
	/*
	 * 对应数据库表
	 */
	private String uid;// 主键
	private String username;// 用户名
	private String password;// 密码
	private String email;// 邮箱
	private String state;
	private String del;

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getDel() {
		return del;
	}

	public void setDel(String del) {
		this.del = del;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	

	@Override
	public String toString() {
		return "User [uid=" + uid + ", username=" + username + ", password="
				+ password + ", email=" + email + ", state=" + state + ", del="
				+ del + "]";
	}
}
