package model;

public class HocSinh {
	String email;
	String matkhau;
	String sdt;
	String namsinh;

	

	public HocSinh(String email, String matkhau, String sdt, String namsinh) {
		super();
		this.email = email;
		this.matkhau = matkhau;
		this.sdt = sdt;
		this.namsinh = namsinh;
	}

	public HocSinh() {
		super();
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMatkhau() {
		return matkhau;
	}

	public void setMatkhau(String matkhau) {
		this.matkhau = matkhau;
	}

	public String getSdt() {
		return sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	public String getNamsinh() {
		return namsinh;
	}

	public void setNamsinh(String namsinh) {
		this.namsinh = namsinh;
	}

	@Override
	public String toString() {
		return "HocSinh [email=" + email + ", matkhau=" + matkhau + ", sdt=" + sdt + ", namsinh=" + namsinh + "]";
	}
}
	