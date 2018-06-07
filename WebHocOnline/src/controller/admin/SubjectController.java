package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SubjectDAO;
import dao.UndoDAO;
import model.Subject;

@WebServlet("/Subject")
public class SubjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SubjectController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getParameter("action");
		String url = "admin/Subject/subject.jsp";
		if (action == null) {
			System.out.println("none handling");
		} else if (action.equals("EDIT")) {
//			String id = request.getParameter("subjectID");			
			String subjectID = request.getParameter("subjectID");
			String subjectName = request.getParameter("subjectName");
			String linkImage = request.getParameter("linkImage");
			String describe = request.getParameter("describe");
			String []listOfExaminationID = request.getParameterValues("listOfExamination");
			String list="";
			for(String s : listOfExaminationID){
				list+=s+",";
			}
			String enable = request.getParameter("enable");
			
			Subject e = new Subject(subjectID, subjectName, linkImage, describe, list, enable);
			new SubjectDAO().edit(subjectID, e);
		} else if (action.equals("DEL")) {
			String subjectID = request.getParameter("subjectID");
			UndoDAO.undoSubject.push(SubjectDAO.mapSubject.get(subjectID));
			new SubjectDAO().del(subjectID);
		} else if (action.equals("ADD")) {
			String subjectID = request.getParameter("subjectID");
			String subjectName = request.getParameter("subjectName");
			String linkImage = request.getParameter("linkImage");
			String describe = request.getParameter("describe");
			String []listOfExaminationID = request.getParameterValues("listOfExamination");
			String list="";
			for(String s : listOfExaminationID){
				list+=s+",";
			}
			String enable = request.getParameter("enable");
			
			Subject e = new Subject(subjectID, subjectName, linkImage, describe, list, enable);
			new SubjectDAO().add(e);
		}  else if (action.equals("DelAll")) {
			new SubjectDAO().delAll();
		} else if (action.equals("UndoAll")) {
			new SubjectDAO().undo();
		} else if (action.equals("UndoOne")) {
			new UndoDAO().restoreDeletedSubject();
		}
		response.sendRedirect(url);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
