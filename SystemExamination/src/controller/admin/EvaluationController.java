package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EvaluationDAO;
import dao.UndoDAO;
import model.Evaluation;

@WebServlet("/Evaluation")
public class EvaluationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EvaluationController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getParameter("action");
		String url = "admin/Evaluation/evaluation.jsp";
		if (action == null) {
			System.out.println("none handling");
		} else if (action.equals("EDIT")) {
			String id = request.getParameter("evaluationID");
			
			String evaluationID = request.getParameter("ID");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String percentageOfPoint = request.getParameter("percentageOfPoint");
			
			Evaluation e = new Evaluation(evaluationID, title, content, percentageOfPoint, "TRUE");
			new EvaluationDAO().edit(id, e);
		} else if (action.equals("DEL")) {
			String evaluationID = request.getParameter("evaluationID");
			UndoDAO.undoEvaluation.push(EvaluationDAO.mapEvaluation.get(evaluationID));
			new EvaluationDAO().del(evaluationID);
		} else if (action.equals("ADD")) {
			String evaluationID = request.getParameter("evaluationID");
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String percentageOfPoint = request.getParameter("percentageOfPoint");
			
			Evaluation e = new Evaluation(evaluationID, title, content, percentageOfPoint, "TRUE");
			
			new EvaluationDAO().add(e);
		}  else if (action.equals("DelAll")) {
			new EvaluationDAO().delAll();
		} else if (action.equals("UndoAll")) {
			new EvaluationDAO().undo();
		} else if (action.equals("UndoOne")) {
			new UndoDAO().restoreDeletedEvaluation();
		}
		response.sendRedirect(url);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
