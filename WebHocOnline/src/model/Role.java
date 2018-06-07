package model;

public class Role {
	String RoleID;
	String RoleName;
	String Describe;
	String Enable;
	
	
	public Role() {
		super();
		
	}


	public Role(String roleID, String roleName, String describe, String enable) {
		super();
		RoleID = roleID;
		RoleName = roleName;
		Describe = describe;
		Enable = enable;
	}


	public String getRoleID() {
		return RoleID;
	}


	public void setRoleID(String roleID) {
		RoleID = roleID;
	}


	public String getRoleName() {
		return RoleName;
	}


	public void setRoleName(String roleName) {
		RoleName = roleName;
	}


	public String getDescribe() {
		return Describe;
	}


	public void setDescribe(String describe) {
		Describe = describe;
	}


	public String getEnable() {
		return Enable;
	}


	public void setEnable(String enable) {
		Enable = enable;
	}


	@Override
	public String toString() {
		return "Role [RoleID=" + RoleID + ", RoleName=" + RoleName + ", Describe=" + Describe + ", Enable=" + Enable
				+ "]";
	}


	
	
}
