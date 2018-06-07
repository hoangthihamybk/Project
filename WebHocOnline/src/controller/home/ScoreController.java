package controller.home;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.DeThiDAO;
import dao.QuestionDAO;
import dao.ScoreBoardDAO;
import dao.UserDetailDAO;
import model.ContentExam;
import model.ScoreBoard;
import model.UserAccount;
@WebServlet("/score111")
public class ScoreController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		System.out.println("Vao day");
		response.setContentType("text/html;charset=utf-8");
		String action = request.getParameter("action");
		String ExamID = request.getParameter("examID");
//		String NumberOfQuestion = request.getParameter("num");
//		String Evaluation = request.getParameter("eval");
		String MaDeThi = request.getParameter("maDeThi");
		
		String url="home/resuilt.jsp?examID="+ExamID;
		//String url = "abdsdfsf";
		if(action.equals("SCORE")){
			Map<String, ContentExam> mapContentExam = DeThiDAO.getMapContentExamByExamID(MaDeThi);
			Map<String, String> mapAnswer = new HashMap<>();
			for(ContentExam ce:mapContentExam.values()){
				String answer = request.getParameter(ce.getQuestionID());
				mapAnswer.put(ce.getQuestionID(), answer);
			}
			printMap(mapAnswer);
			printMap2(mapContentExam);
			int numberOfRight=new QuestionDAO().checkAnswer(mapAnswer,mapContentExam);
			int score1 = new QuestionDAO().resuiltScoreForExam(mapAnswer, mapContentExam);
			
			
			String score2 = String.valueOf(score1);
			String numberOfRight2 = String.valueOf(numberOfRight);
			
			HttpSession session =request.getSession();
			UserAccount us1 =(UserAccount) session.getAttribute("loginstudent");
			String userID = UserDetailDAO.mapUserDetail.get(us1.getUserID()).getUserID();
			String evaluationID = evaluation(score1);
						
			//System.out.println("đây là id"+userID );
			ScoreBoard sb = new ScoreBoard("none",userID, ExamID, "none", numberOfRight2, score2, evaluationID, "none", "TRUE");
			
			new ScoreBoardDAO().add(sb);
			
			System.out.println("dssadsadsadsadsadsadsa My");
			System.out.println("so cau dung la: "+numberOfRight);
			System.out.println("So diem cua ban la: "+score1);
			new DeThiDAO().delContentExam(MaDeThi);
			String url2 ="&score="+score1+"&number="+numberOfRight;
     		url+=url2;
     		
     		
		}
		response.sendRedirect(url);
	}

	public void printMap(Map<String,String> mapAnswer ){
		for(String t : mapAnswer.values()){
			System.out.println(t);
		}
	}
	public void printMap2(Map<String,ContentExam> mapContent ){
		for(ContentExam t : mapContent.values()){
			System.out.println(t.getQuestionID()+": "+ t.getAnswer());
		}
	}	

	public String evaluation(int score) {
		if (score >= 0 && score <= 10) {
			return "E0";
		} else if (score > 10 && score <= 20) {
			return "E1";
		} else if (score > 20 && score <= 30) {
			return "E2";
		} else if (score > 30 && score <= 40) {
			return "E3";
		} else if (score > 40 && score <= 50) {
			return "E4";
		} else if (score > 50 && score <= 60) {
			return "E5";
		} else if (score > 60 && score <= 70) {
			return "E6";
		} else if (score > 70 && score <= 80) {
			return "E7";
		} else if (score > 80 && score <= 90) {
			return "E8";
		} else if (score > 90 && score <= 100) {
			return "E9";
		}

		return null;
	}

}