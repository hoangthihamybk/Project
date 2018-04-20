package dao;

import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import model.HocSinh;
import model.MyConnectDB;

public class HocSinhDAO implements ObjectDAO {

	public static Map<String, HocSinh> mapHocSinh = loadDataHocSinh();

	public static Map<String, HocSinh> loadDataHocSinh() {
		Map<String, HocSinh> map = new HashMap<>();
		try {
			ResultSet rs = new MyConnectDB().chonDuLieu("select * from  hs");
			while (rs.next()) {
				String id = rs.getString(1);
				String email = rs.getString(2);
				String matkhau = rs.getString(3);
				String sdt = rs.getString(4);
				String namsinh = rs.getString(5);
				HocSinh hs1 = new HocSinh(email, matkhau, sdt, namsinh);
				map.put(id, hs1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return map;
	}

	@Override
	public boolean themTaiKhoan(Object obj) {
		HocSinh hs = (HocSinh) obj;
		try {
			new MyConnectDB().thucThiSQL("insert into hs values('" + hs.getEmail() + "','" + hs.getMatkhau() + "','"
					+ hs.getSdt() + "','" + hs.getNamsinh() + "')");
			return true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

//	public HocSinh layThongTinTaiKhoan(String username) {
//		try {
//			ResultSet rs = new MyConnectDB().chonDuLieu("select * from hs where email='" + username + "'");
//			while (rs.next()) {
//				String id = rs.getString(1);
//				String email = rs.getString(2);
//				String matkhau = rs.getString(3);
//				String sdt = rs.getString(4);
//				String namsinh = rs.getString(5);
//				return new HocSinh(email, matkhau, sdt, namsinh);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//			System.out.println(e.getMessage());
//		}
//		return null;
//
//	}

	@Override
	public boolean kiemTraDangNhap(String username, String pass) {

		try {
			ResultSet rs = new MyConnectDB().chonDuLieu("select * from hs where email='" + username + "'");
			while (rs.next()) {
				if (rs.getString(2).equals(username) && rs.getString(3).equals(pass)) {
					return true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}

		return false;
	}

	public static void main(String[] args) {
		HocSinh hs = new HocSinh("hoangthihamy@gmail.com", "1", "0965093110", "1995");
		System.out.println(new HocSinhDAO().kiemTraDangNhap("hoangthihamy@gmail.com", "1"));
		for(HocSinh s: mapHocSinh.values()){
			System.out.println(s.getEmail());
		}
	}
}
