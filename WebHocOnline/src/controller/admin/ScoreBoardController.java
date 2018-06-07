package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ScoreBoardDAO;
import dao.UndoDAO;
import model.ScoreBoard;

@WebServlet("/ScoreBoard")
public class ScoreBoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ScoreBoardController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getParameter("action");
		String url = "admin/ScoreBoard/score.jsp";
		if (action == null) {
			System.out.println("none handling");
		} else if (action.equals("EDIT")) {
			String id = request.getParameter("scoreBoardID");
			
			String scoreBoardID = request.getParameter("ID");
			String userID = request.getParameter("userID");
			String examID = request.getParameter("examID");
			String timeEnd = request.getParameter("timeEnd");
			String numberOfCorrectSentences = request.getParameter("numberOfCorrect");
			String score = request.getParameter("score");
			String evaluationID = request.getParameter("evaluationID");
			String accumulatedPoints = request.getParameter("accumulatedPoints");
			String enable = request.getParameter("enable");

			ScoreBoard r = new ScoreBoard(scoreBoardID, userID, examID, timeEnd, numberOfCorrectSentences,score,evaluationID,accumulatedPoints,enable);
			new ScoreBoardDAO().edit(id, r);
		} else if (action.equals("DEL")) {
			String scoreBoardID = request.getParameter("scoreBoardID");
			UndoDAO.undoScoreBoard.push(ScoreBoardDAO.mapScoreBoard.get(scoreBoardID));
			new ScoreBoardDAO().del(scoreBoardID);
		} else if (action.equals("ADD")) {
			String scoreBoardID = request.getParameter("scoreBoardID");
			String userID = request.getParameter("userID");
			String examID = request.getParameter("examID");
			String timeEnd = request.getParameter("timeEnd");
			String numberOfCorrectSentences = request.getParameter("numberOfCorrect");
			String score = request.getParameter("score");
			String evaluationID = request.getParameter("evaluationID");
			String accumulatedPoints = request.getParameter("accumulatedPoints");
			
			ScoreBoard r = new ScoreBoard(scoreBoardID, userID, examID, timeEnd, numberOfCorrectSentences,score,evaluationID,accumulatedPoints, "TRUE");
			new ScoreBoardDAO().add(r);
		}  else if (action.equals("DelAll")) {
			new ScoreBoardDAO().delAll();
		} else if (action.equals("UndoAll")) {
			new ScoreBoardDAO().undo();
		} else if (action.equals("UndoOne")) {
			new UndoDAO().restoreDeletedScoreBoard();
		}
		response.sendRedirect(url);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
