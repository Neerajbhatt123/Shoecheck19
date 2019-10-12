package address;

import java.sql.Connection;
import java.sql.PreparedStatement;

import config.Configuration;

interface AddressStandard {
	String insert(Address ad);
}

public class AddressHandler implements AddressStandard {

	public String insert(Address ad) {
		try {
			String query = "insert into Address(email,password,address,address2,city,state,zip,phoneNumber) values(?,?,?,?,?,?,?,?)";
			Connection conn = Configuration.conn;
			PreparedStatement p = conn.prepareStatement(query);
			p.setString(1, ad.getEmail());
			p.setString(2, ad.getPassword());
			p.setString(3, ad.getAddress());
			p.setString(4, ad.getAddress2());
			p.setString(5, ad.getCity());
			p.setString(6, ad.getState());
			p.setInt(7, ad.getZip());
			p.setString(8, ad.getPhoneNumber());

			p.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "Address Inserted Successfully";
	}

}
