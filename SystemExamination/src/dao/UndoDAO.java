package dao;

import java.util.Stack;

import model.Classed;
import model.Evaluation;
import model.Exam;
import model.Rank;
import model.Role;
import model.ScoreBoard;
import model.Subject;
import model.UserAccount;

public class UndoDAO {
	public static Stack<UserAccount> undoUserAccount = new Stack<>();
	public static Stack<Role> undoRole = new Stack<>();
	public static Stack<Rank> undoRank = new Stack<>();
	public static Stack<Evaluation> undoEvaluation = new Stack<>();
	public static Stack<Classed> undoClassed = new Stack<>();
	public static Stack<Subject> undoSubject = new Stack<>();
	public static Stack<Exam> undoExamination = new Stack<>();
	public static Stack<ScoreBoard> undoScoreBoard = new Stack<>();

	public boolean restoreDeletedAccount() {/////////////////////////////
		UserAccount us = new UserAccount();
		if (!undoUserAccount.isEmpty()) {
			us = undoUserAccount.pop();
			if (us != null) {
				new UserDAO().add(us);
				UserDAO.mapUser.put(us.getUserID(), us);
			}
			return true;
		} else {
			return false;
		}
	}

	public boolean restoreDeletedRole() {
		Role r = new Role();
		if (!undoRole.isEmpty()) {
			r = undoRole.pop();
			if (r != null) {
				new RoleDAO().add(r);
				RoleDAO.mapRole.put(r.getRoleID(), r);
			}
			return true;
		} else {
			return false;
		}
	}
	public boolean restoreDeletedRank() {
		Rank r = new Rank();
		if (!undoRank.isEmpty()) {
			r = undoRank.pop();
			if (r != null) {
				new RankDAO().add(r);
				RankDAO.mapRank.put(r.getRankID(), r);
			}
			return true;
		} else {
			return false;
		}
	}
	public boolean restoreDeletedExam() {
		Exam r = new Exam();
		if (!undoExamination.isEmpty()) {
			r = undoExamination.pop();
			if (r != null) {
				new ExamDAO().add(r);
				ExamDAO.mapExam.put(r.getExamID(), r);
			}
			return true;
		} else {
			return false;
		}
	}
	public boolean restoreDeletedSubject() {
		Subject r = new Subject();
		if (!undoSubject.isEmpty()) {
			r = undoSubject.pop();
			if (r != null) {
				new SubjectDAO().add(r);
				SubjectDAO.mapSubject.put(r.getSubjectID(), r);
			}
			return true;
		} else {
			return false;
		}
	}
	public boolean restoreDeletedClassed() {
		Classed r = new Classed();
		if (!undoClassed.isEmpty()) {
			r = undoClassed.pop();
			if (r != null) {
				new ClassedDAO().add(r);
				ClassedDAO.mapClassed.put(r.getClassID(), r);
			}
			return true;
		} else {
			return false;
		}
	}
	public boolean restoreDeletedScoreBoard() {
		ScoreBoard r = new ScoreBoard();
		if (!undoScoreBoard.isEmpty()) {
			r = undoScoreBoard.pop();
			if (r != null) {
				new ScoreBoardDAO().add(r);
				ScoreBoardDAO.mapScoreBoard.put(r.getScoreBoardID(), r);
			}
			return true;
		} else {
			return false;
		}
	}
	public boolean restoreDeletedEvaluation() {
		Evaluation r = new Evaluation();
		if (!undoEvaluation.isEmpty()) {
			r = undoEvaluation.pop();
			if (r != null) {
				new EvaluationDAO().add(r);
				EvaluationDAO.mapEvaluation.put(r.getEvaluationID(), r);
			}
			return true;
		} else {
			return false;
		}
	}
}
