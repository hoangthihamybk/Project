package model;

public class Role {
	String roleID;
	String roleName;
	String describe;
	String enable;
	public Role(String roleID, String roleName, String describe, String enable) {
		super();
		this.roleID = roleID;
		this.roleName = roleName;
		this.describe = describe;
		this.enable = enable;
	}
	
	public Role() {
		super();
	}

	public String getRoleID() {
		return roleID;
	}
	public void setRoleID(String roleID) {
		this.roleID = roleID;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public String getEnable() {
		return enable;
	}
	public void setEnable(String enable) {
		this.enable = enable;
	}
	@Override
	public String toString() {
		return "Role [roleID=" + roleID + ", roleName=" + roleName + ", describe=" + describe + ", enable=" + enable
				+ "]";
	}
	
}
