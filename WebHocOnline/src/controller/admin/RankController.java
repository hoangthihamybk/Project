package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RankDAO;
import dao.UndoDAO;
import model.Rank;

@WebServlet("/Rank")
public class RankController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RankController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getParameter("action");
		String url = "admin/Rank/rank.jsp";
		if (action == null) {
			System.out.println("none handling");
		} else if (action.equals("EDIT")) {
			String id = request.getParameter("rankID");
			
			String rankID = request.getParameter("ID");
			String userID = request.getParameter("userID");
			String rank = request.getParameter("rank");
			String enable = request.getParameter("enable");

			Rank r = new Rank(rankID, userID, rank, enable);
			new RankDAO().edit(id, r);
		} else if (action.equals("DEL")) {
			String rankID = request.getParameter("rankID");
			UndoDAO.undoRank.push(RankDAO.mapRank.get(rankID));
			new RankDAO().del(rankID);
		} else if (action.equals("ADD")) {
			String rankID = request.getParameter("rankID");
			String userID = request.getParameter("userID");
			String rank = request.getParameter("rank");
			
			Rank r = new Rank(rankID, userID, rank, "TRUE");
			
			new RankDAO().add(r);
		}  else if (action.equals("DelAll")) {
			new RankDAO().delAll();
		} else if (action.equals("UndoAll")) {
			new RankDAO().undo();
		} else if (action.equals("UndoOne")) {
			new UndoDAO().restoreDeletedRank();
		}
		response.sendRedirect(url);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
