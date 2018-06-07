package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UndoDAO;
import dao.UserDAO;
import dao.UserDetailDAO;
import model.UserAccount;
import model.UserDetail;

@WebServlet("/User")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getParameter("action");
		
		System.out.println("action = "+ action);
	
		String url = "admin/Account/user.jsp";
		if (action == null) {
			System.out.println("none handling");
		} else if (action.equals("EDIT_USER")) {
			String userID = request.getParameter("userID");
			String userIDNew = request.getParameter("ID");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String role = request.getParameter("role");

			UserAccount us = UserDAO.mapUser.get(userID);
			UserAccount usNew = new UserAccount(userIDNew, email, password, us.getGoogleID(), us.getFacebookID(), role);
			new UserDAO().edit(userID, usNew);
			
		} else if (action.equals("DEL")) {
			String UserID = request.getParameter("UserID");
			UndoDAO.undoUserAccount.push(UserDAO.mapUser.get(UserID));
			new UserDAO().del(UserID);
		} else if (action.equals("ADD")) {
			String userID = request.getParameter("userID");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String role = request.getParameter("role");
			UserAccount us = new UserAccount(userID, email, password, "none", "none", role);
			new UserDAO().add(us);
		} else if (action.equals("EDIT_USER_DETAIL")) {
		System.out.println("đã tìm thây");
			String userID = request.getParameter("userID");

			String fullname = request.getParameter("fullname");
			String gender = request.getParameter("gender");
			String birthday = request.getParameter("birthday");
			String phoneNumber = request.getParameter("phoneNumber");
			String address = request.getParameter("address");
			String avatar = UserDetailDAO.mapUserDetail.get(userID).getAvatar();

			UserDetail ud = new UserDetail(userID, fullname, gender, birthday, phoneNumber, address, avatar);
			new UserDetailDAO().edit(userID, ud);
			url = "admin/Account/infoUser.jsp?UserID=" + userID;
		}
		else if (action.equals("edit")) {
			System.out.println("editinfo");
			
			String userID = request.getParameter("userID");
			System.out.println("userId = " + userID);
			String fullname = request.getParameter("fullname");
			String gender = request.getParameter("gender");
			String birthday = request.getParameter("birthday");
			String phoneNumber = request.getParameter("phoneNumber");
			String address = request.getParameter("address");
			String avatar = request.getParameter("avatar");

			UserDetail ud = new UserDetail(userID, fullname, gender, birthday, phoneNumber, address, avatar);
			new UserDetailDAO().edit(userID, ud);
			url = "home/index.jsp?UserID=" + userID;
		}
		else if (action.equals("DelAll")) {
			new UserDAO().delAll();
		} else if (action.equals("UndoAll")) {
			new UserDAO().undo();
		} else if (action.equals("UndoOne")) {
			new UndoDAO().restoreDeletedAccount();
		}
		response.sendRedirect(url);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
