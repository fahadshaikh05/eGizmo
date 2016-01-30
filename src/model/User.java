package model;

import java.io.Serializable;

public class User implements Serializable{

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	public String userName;
	public String password;
	public int userId;

	public String firstName;
	public String lastName;

	// Parameterized Constructors
	public User(String userName, String password, int userId) {
		super();
		this.userName = userName;
		this.password = password;
		this.userId = userId;
	}


	public User(String firstName, String lastName) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
	}

	public User() {
	}


	// Getters and Setters
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

}
