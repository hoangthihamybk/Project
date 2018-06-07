package dao;

import java.util.HashMap;
import java.util.Map;

import model.Exam;

public class SearchDAO {

	public static Map<String, Exam> getMapExamByID(String ClassID, String SubjectID) {
		Map<String, Exam> mapTmp = new HashMap<>();
		Map<String, Exam> mapExam = ExamDAO.mapExam;
		for(Exam e : mapExam.values()){
			if(e.getClassID().equals(ClassID) && e.getSubjectID().equals(SubjectID)){
				mapTmp.put(e.getExamID(), e);
			}
		}
		return mapTmp;
	}

}
