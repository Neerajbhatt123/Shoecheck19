package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import config.Configuration;

interface UserStandard {
	String insert(User ur);

	List<User> fetchAllUser();

	String toggleActive(int id, boolean state);
	
	boolean deleteById(int id);

	// String active(User ur);

	// String inActive(User ur);
	User checkUser(String email, String password);
}

public class UserHandler implements UserStandard {

	public List<User> fetchAllUser() {
		List<User> list = new ArrayList<User>();

		try {

			String query = "Select * from User";
			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			ResultSet rs = p.executeQuery();

			while (rs.next()) {
				list.add(new User(rs.getInt("id"), rs.getString("Name"), rs.getString("Phone"), rs.getString("Email"),
						rs.getString("Password"), rs.getInt("Active"), rs.getString("Role")

				));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public String insert(User ur) {
		try {
			String query = "insert into User " + "(name,phone,email,password) " + "values" + "(?,?,?,?)";

			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);
			p.setString(1, ur.getName());
			p.setString(2, ur.getPhone());
			p.setString(3, ur.getEmail());
			p.setString(4, ur.getPassword());
			/*
			 * p.setInt(5, ur.getActive()); p.setString(6, ur.getRole());
			 */
			p.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception

		}

		return "User Inserted Successfully";
	}

	/*
	 * public String active(User ur) { try { String query =
	 * "update User set Active=0 where id=?"; Connection conn = Configuration.conn;
	 * PreparedStatement p = conn.prepareStatement(query); p.setInt(1, ur.getId());
	 * p.executeUpdate();
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } return "User is Inactive Now";
	 * }
	 * 
	 * public String inActive(User ur) { try { String query =
	 * "update User set Active=1 where id=?"; Connection conn = Configuration.conn;
	 * PreparedStatement p = conn.prepareStatement(query); p.setInt(1, ur.getId());
	 * p.executeUpdate();
	 * 
	 * } catch (Exception e) { e.printStackTrace(); } return "User is Active Now"; }
	 */

	public String toggleActive(int id, boolean state) {
		try {
			String query = "update User set active=? where id=?";

			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			p.setInt(1, state ? 1 : 0);
			p.setInt(2, id);

			p.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			return e.getMessage();
		}

		return "Success";
	}

	public User checkUser(String email, String password) {

		try {

			String query = "Select * from User where Email=? and Password=? and Active = 1";

			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			p.setString(1, email);
			p.setString(2, password);

			ResultSet rs = p.executeQuery();
			 
			while (rs.next()) {
				User u = new User();
				
				u.setEmail(rs.getString("Email"));
				 u.setName(rs.getString("Name")); 
				u.setRole(rs.getString("Role"));
				u.setId(rs.getInt("id"));
				
				return u;
			}
	
		} catch (Exception e) {
			e.printStackTrace();
		}

		return  null;
	}

	public boolean deleteById(int id) {
		try {

			String query = "delete from User where id=?";
			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);

			p.setInt(1, id);

			p.executeUpdate();

			return true;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

}
