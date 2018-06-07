package controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ClassedDAO;
import dao.UndoDAO;
import model.Classed;

@WebServlet("/Classed")
public class ClassedController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ClassedController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getParameter("action");
		String url = "admin/Classed/classed.jsp";
		if (action == null) {
			System.out.println("none handling");
		} else if (action.equals("EDIT")) {
//			String id = request.getParameter("classID");
			
			String classID = request.getParameter("ID");
			String className = request.getParameter("className");
			String describe = request.getParameter("describe");
			String []listOfSubject = request.getParameterValues("listOfSubject");
			String list="";
			if(listOfSubject.length>0){
			for(String s : listOfSubject){
				list+=s+",";
			}}
			String enable = request.getParameter("enable");
			
			Classed e = new Classed(classID, className, describe, list, enable);
			new ClassedDAO().edit(classID, e);
		} else if (action.equals("DEL")) {
			String classedID = request.getParameter("classID");
			UndoDAO.undoClassed.push(ClassedDAO.mapClassed.get(classedID));
			new ClassedDAO().del(classedID);
		} else if (action.equals("ADD")) {
			String classID = request.getParameter("classID");
			String className = request.getParameter("className");
			String describe = request.getParameter("describe");
			String []listOfSubject = request.getParameterValues("listOfSubject");
			String list="";
			if(listOfSubject.length>0){
				for(String s : listOfSubject){
					list+=s+",";
				}}
			String enable = request.getParameter("enable");
			
			Classed e = new Classed(classID, className, describe, list, enable);
			new ClassedDAO().add(e);
		}  else if (action.equals("DelAll")) {
			new ClassedDAO().delAll();
		} else if (action.equals("UndoAll")) {
			new ClassedDAO().undo();
		} else if (action.equals("UndoOne")) {
			new UndoDAO().restoreDeletedClassed();
		}
		response.sendRedirect(url);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
