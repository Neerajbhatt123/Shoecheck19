package address;

public class Address {
	private int id;
	private String email,password,address,address2,city,state;
	private int zip;
	private String phoneNumber;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public int getZip() {
		return zip;
	}
	public void setZip(int zip) {
		this.zip = zip;
	}
	public Address(int id, String email, String password, String address, String address2, String city, String state,
			int zip, String phoneNumber) {
		super();
		this.id = id;
		this.email = email;
		this.password = password;
		this.address = address;
		this.address2 = address2;
		this.city = city;
		this.state = state;
		this.zip = zip;
		this.phoneNumber = phoneNumber;
	}
	public Address(String email, String password, String address, String address2, String city, String state, int zip,
			String phoneNumber) {
		super();
		this.email = email;
		this.password = password;
		this.address = address;
		this.address2 = address2;
		this.city = city;
		this.state = state;
		this.zip = zip;
		this.phoneNumber = phoneNumber;
	}
	public Address(int id, String email, String password, String address, String city, String state, int zip,
			String phoneNumber) {
		super();
		this.id = id;
		this.email = email;
		this.password = password;
		this.address = address;
		this.city = city;
		this.state = state;
		this.zip = zip;
		this.phoneNumber = phoneNumber;
	}
	public Address() {
		super();
	}
	@Override
	public String toString() {
		return "Address [id=" + id + ", email=" + email + ", password=" + password + ", address=" + address
				+ ", address2=" + address2 + ", city=" + city + ", state=" + state + ", zip=" + zip + ", phoneNumber="
				+ phoneNumber + "]";
	}
	
	
	
		
	

}
