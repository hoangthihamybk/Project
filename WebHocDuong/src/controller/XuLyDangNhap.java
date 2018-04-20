package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.HocSinhDAO;
import model.HocSinh;

@WebServlet("/XuLyDangNhap")
public class XuLyDangNhap extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public XuLyDangNhap() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username= request.getParameter("username");
		String pass = request.getParameter("pass");
		
//		HocSinh hs = new HocSinhDAO().layThongTinTaiKhoan(username);
//		System.out.println(hs);
		if(new HocSinhDAO().kiemTraDangNhap(username, pass)){
			System.out.println("login success");
			response.sendRedirect("index.jsp");
		}else{
			System.out.println("Loi dang nhap");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
