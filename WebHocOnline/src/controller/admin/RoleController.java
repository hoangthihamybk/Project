package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RoleDAO;
import dao.UndoDAO;
import model.Role;

@WebServlet("/Role")
public class RoleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RoleController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getParameter("action");
		String url = "admin/Role/role.jsp";
		if (action == null) {
			System.out.println("none handling");
		} else if (action.equals("EDIT")) {
			String id = request.getParameter("roleID");
			
			String roleID = request.getParameter("ID");
			String roleName = request.getParameter("roleName");
			String describe = request.getParameter("describe");
			String enable = request.getParameter("enable");

			Role r = new Role(roleID, roleName, describe, enable);
			new RoleDAO().edit(id, r);
		} else if (action.equals("DEL")) {
			String roleID = request.getParameter("roleID");
			UndoDAO.undoRole.push(RoleDAO.mapRole.get(roleID));
			new RoleDAO().del(roleID);
		} else if (action.equals("ADD")) {
			String roleID = request.getParameter("ID");
			String roleName = request.getParameter("roleName");
			String describe = request.getParameter("describe");
			Role r = new Role(roleID, roleName, describe, "TRUE");
			new RoleDAO().add(r);
		}  else if (action.equals("DelAll")) {
			new RoleDAO().delAll();
		} else if (action.equals("UndoAll")) {
			new RoleDAO().undo();
		} else if (action.equals("UndoOne")) {
			new UndoDAO().restoreDeletedRole();
		}
		response.sendRedirect(url);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
