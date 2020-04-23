package cn.jxau.metting.user.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.jxau.metting.user.domain.User;
import cn.itcast.jdbc.TxQueryRunner;

/**
 * User持久层
 * 
 * 
 * 
 */
public class UserDao {
	private QueryRunner qr = new TxQueryRunner();

	/**
	 * 按用户名查询
	 * 
	 * @param username
	 * @return
	 */
	public User findByUsername(String username) {
		try {
			String sql = "select * from tb_user where username=?";
			return qr.query(sql, new BeanHandler<User>(User.class), username);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 按用户名查询
	 * 
	 * @param username
	 * @return
	 */
	public User findByEmail(String email) {
		try {
			String sql = "select * from tb_user where email=?";
			return qr.query(sql, new BeanHandler<User>(User.class), email);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 插入User
	 */
	public void add(User user) {
		try {
			String sql = "insert into tb_user values(?,?,?,?)";
			Object[] params = { user.getUid(), user.getUsername(),
					user.getPassword(), user.getEmail() };
			qr.update(sql, params);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 查找所有
	 * 
	 * @return
	 */
	public List<User> findAll() {
		try {
			String sql = "select * from tb_user";
			return qr.query(sql, new BeanListHandler<User>(User.class));
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void edit(User user) {
		try {
			String sql = "update tb_user set password=?,email=? where uid=?";
			qr.update(sql, user.getPassword(), user.getEmail(), user.getUid());
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

	}

	/**
	 * 删除
	 * 
	 */

	public void delete(String uid) {
		try {
			String sql = "delete from tb_user where uid=?";
			qr.update(sql, uid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	/**
	 * 加载分类
	 */
	public User load(String uid) {
		try {
			String sql = "select * from tb_user where uid=?";
			return qr.query(sql, new BeanHandler<User>(User.class), uid);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
