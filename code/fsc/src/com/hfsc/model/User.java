package com.hfsc.model;

public class User {
    
    private long User_id;
    
    private String User_name;
    
    private String User_password;
    
    private String Role_name;
    
    private String Resource_name;
    
    public String getResource_name() {
		return Resource_name;
	}

	public void setResource_name(String resource_name) {
		Resource_name = resource_name;
	}

	public long getUser_id() {
		return User_id;
	}

	public void setUser_id(long user_id) {
		User_id = user_id;
	}

	public String getUser_name() {
		return User_name;
	}

	public void setUser_name(String user_name) {
		User_name = user_name;
	}

	public String getUser_password() {
		return User_password;
	}

	public void setUser_password(String user_password) {
		User_password = user_password;
	}

	public String getRole_name() {
		return Role_name;
	}

	public void setRole_name(String role_name) {
		Role_name = role_name;
	}

	public int getResource() {
		return Resource;
	}

	public void setResource(int resource) {
		Resource = resource;
	}

	private int Resource;
    
    public void setUserName(String userName) {
        this.User_name = userName;
    }
    
    public String getUserName() {
        return User_name;
    }
    
    public Long getId() {
        return User_id;
    }
    
    public void setId(Long id) {
        this.User_id = id;
    }
    
    public String getPassword() {
        return User_password;
    }
    
    public void setPassword(String password) {
        this.User_password = password;
    }
    
   
}
