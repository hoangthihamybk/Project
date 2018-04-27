package controller.index;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.UserAccount;

@WebServlet("/Login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getParameter("action");
		System.out.println(action+" ákdjaskdjasd");
		String url="index.jsp";
		if (action == null) {
			System.out.println("Trường hợp chưa có dữ liệu");
		}else if(action.equals("SignIn")){
			String email = request.getParameter("email");
			String pass = request.getParameter("password");
			UserAccount ua = UserDAO.checkLogin(email, pass);
			System.out.println(ua);
			if(ua!=null){
				if(ua.getRoleID().equals("admin")){
					HttpSession session = request.getSession();
					session.setAttribute("loginadmin", ua);
					url="admin/index.jsp";
				}else{
					System.out.println("ko phai admin");
					HttpSession session = request.getSession();
					session.setAttribute("loginindex", ua);
					url="index.jsp";
				}
			}else{
				url="index.jsp";
			}
		}else if(action.equals("SignUp")){
			String email = request.getParameter("email");
			String userID = UserDAO.randomUserID(email);
			String password = request.getParameter("password");
			String facebookID= request.getParameter("FID");
			String googleID = request.getParameter("GID");
			String roles=request.getParameter("role");
			
			UserAccount ua = new UserAccount(userID, email, password, googleID, facebookID, roles);
			boolean ok=new UserDAO().add(ua);
			if(ok){
				HttpSession session = request.getSession();
				session.setAttribute("loginindex", ua);
				url="index.jsp";
			}else{
				url="index.jsp";
			}
			
			
		}else if(action.equals("SignOut")){
			HttpSession session = request.getSession();
			session.invalidate();
			url="index.jsp";
		}
		response.sendRedirect(url);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
