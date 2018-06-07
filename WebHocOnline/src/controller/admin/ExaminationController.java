package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ExamDAO;
import dao.UndoDAO;
import model.Exam;

@WebServlet("/Examination")
public class ExaminationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ExaminationController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getParameter("action");
		String url = "admin/Exam/exam.jsp";
		if (action == null) {
			System.out.println("none handling");
		} else if (action.equals("EDIT")) {
			String id = request.getParameter("examID");		
			
			String examID = request.getParameter("ID");		
			String classID = request.getParameter("classID");
			String subjectID = request.getParameter("subjectID");
			String examName = request.getParameter("examName");
			String describe = request.getParameter("describe");
			String numberOfQuestions = request.getParameter("numberOfQuestions");	
			String time = request.getParameter("time");	
			String numberOfPeople = request.getParameter("numberOfPeople");	
			String linkContent = request.getParameter("linkContent");	
			String dateCreate = request.getParameter("dateCreate");	
			String enable = request.getParameter("enable");	

			Exam r = new Exam(examID, classID, subjectID, examName, describe, numberOfQuestions, time, numberOfPeople, linkContent, dateCreate, enable);
			new ExamDAO().edit(id, r);
		} else if (action.equals("DEL")) {
			String examID = request.getParameter("examID");
			UndoDAO.undoExamination.push(ExamDAO.mapExam.get(examID));
			new ExamDAO().del(examID);
		} else if (action.equals("ADD")) {
			String examID = request.getParameter("examID");
			String classID = request.getParameter("classID");
			String subjectID = request.getParameter("subjectID");
			String examName = request.getParameter("examName");
			String describe = request.getParameter("describe");
			String numberOfQuestions = request.getParameter("numberOfQuestions");
			String time = request.getParameter("time");
			String numberOfPeople = request.getParameter("numberOfPeople");
			String linkContent = request.getParameter("linkContent");
			String dateCreate = request.getParameter("dateCreate");
			
			Exam r = new Exam(examID, classID, subjectID, examName, describe,numberOfQuestions,time,numberOfPeople,linkContent,dateCreate, "TRUE");
			
			new ExamDAO().add(r);
		}  else if (action.equals("DelAll")) {
			new ExamDAO().delAll();
		} else if (action.equals("UndoAll")) {
			new ExamDAO().undo();
		} else if (action.equals("UndoOne")) {
			new UndoDAO().restoreDeletedExam();
		}
		response.sendRedirect(url);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
