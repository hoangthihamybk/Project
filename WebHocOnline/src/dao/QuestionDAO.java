package dao;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import model.ConnectDB;
import model.ConstDefine;
import model.ContentExam;
import model.DeThi;
import model.Question;

public class QuestionDAO {
	// static String pathLoadFile=System.getProperty("user.dir") + "";
	static String pathLoadFile;
	// static String pathLoadFile= "/src/file/exam/content/sinh/chsinh.txt";
	static String charset;
	static String delemited;

	public QuestionDAO() {

	}

	public QuestionDAO(String pathLoadFile) throws IOException {
		super();
		charset = "Unicode";
		delemited = "\t";
		QuestionDAO.pathLoadFile = pathLoadFile;

	}

	public Map<String, ContentExam> loadQuestionFromDatabase(String maDeThi) {
		Map<String, ContentExam> mapTemp = new HashMap<>();
		try {
			ResultSet rs = new ConnectDB().selectData("select * from ContentExam where maDeThi=" + maDeThi);
			while (rs.next()) {
				String id = rs.getString(1);
				String questionID = rs.getString(2);
				String answer = rs.getString(3);
				String evaluation = rs.getString(4);
				ContentExam ce = new ContentExam(id, questionID, answer, evaluation);
				mapTemp.put(questionID, ce);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return mapTemp;
	}

	public DeThi loadData() throws IOException {
		File sf = new File(pathLoadFile);
		if (!sf.exists())
			System.out.println("File not exists!!!");
		// return null;
		DeThi dt = new DeThi();
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(sf), charset));

			int numberOfQuestion = 0, numberAnswerForOneQuestion = 0;
			String line = br.readLine();
			// get first line
			if (line != null) {
				String data[] = line.split(delemited);
				dt.setMaDeThiID(data[0]);
				dt.setSubjectID(data[1]);
				dt.setClassID(data[2]);
				dt.setNumberOfQuestion(data[3]);
				dt.setNumberAnswerForOneQuestion(data[4]);
				numberOfQuestion = Integer.parseInt(data[3]);
				numberAnswerForOneQuestion = Integer.parseInt(data[4]);
			}
			int count = 0;
			while (count < numberOfQuestion) {
				// get info-base for question
				Question q = new Question();
				line = br.readLine();
				String data[] = line.split(delemited);
				q.setQuestionID(data[0]);
				q.setAnswerRight(data[1]);
				q.setContent(data[2]);

				// get info answer
				List<String> listOfAnswer = new ArrayList<>();
				for (int i = 0; i < numberAnswerForOneQuestion; i++) {
					String answer = br.readLine();
					if (answer != null) {
						listOfAnswer.add(answer);
					}
				}
				q.setListOfAnswer(listOfAnswer);
				dt.addQuestion(q);
				count++;
			}

			br.close();

		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return null;
		}

		return dt;
	}

	// get list of question with evaluation is DE or KHO or TB
	public Map<String, Question> getListOfQuestion(String evaluation, int num) throws IOException {
		Map<String, Question> map = new HashMap<>();
		File sf = new File(pathLoadFile);

		if (!sf.exists())
			System.out.println("File not exists!!!");
		try {
			BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(sf), charset));
			int numberOfQuestion = 0, numberAnswerForOneQuestion = 0;
			String line = br.readLine();
			if (line != null) {
				String data[] = line.split(delemited);
				numberOfQuestion = Integer.parseInt(data[0]);
				numberAnswerForOneQuestion = Integer.parseInt(data[1]);
			}
			int count = 0;
			while (count < numberOfQuestion) {
				Question q = new Question();
				line = br.readLine();
				String data[] = line.split(delemited);
				String ID = data[0];
				q.setQuestionID(ID);
				q.setAnswerRight(data[1]);
				q.setContent(data[2]);

				List<String> listOfAnswer = new ArrayList<>();
				for (int i = 0; i < numberAnswerForOneQuestion; i++) {
					String answer = br.readLine();
					if (answer != null) {
						listOfAnswer.add(answer);
					}
				}
				q.setListOfAnswer(listOfAnswer);
				if (ID.substring(ID.indexOf("-") + 1, ID.length()).equals(evaluation)) {
					map.put(ID, q);

				}

				if (map.size() == num) {
					break;
				}
				count++;
			}

			br.close();

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		return map;

	}

	public String getkey(Map<String, Question> map) {
		Random rd = new Random();
		List<String> list = new ArrayList<>();
		for (String mapa : map.keySet()) {
			list.add(mapa);
		}
		int count = rd.nextInt(list.size());
		return list.get(count);
	}

	public DeThi createDeThi(String evaluation, int numberOfQuestion) throws IOException {
		int numDE = 0, numKHO = 0, numTB = 0;
		switch (evaluation) {
		case ConstDefine.DE:
			// number of question for DE is 100%
			numDE = numberOfQuestion;
			break;
		case ConstDefine.KHO:
			/*
			 * number of question for DE is 40% number of question for KHO is
			 * 30% number of question for TB is 30%
			 */
			numKHO = (int) ((numberOfQuestion * 30) / 100);
			numTB = (int) ((numberOfQuestion * 30) / 100);
			numDE = numberOfQuestion - numKHO - numTB;
			break;
		case ConstDefine.TRUNG_BINH:
			/*
			 * number of question for DE is 40% number of question for KHO is
			 * 10% number of question for TB is 50%
			 */
			numKHO = (int) ((numberOfQuestion * 10) / 100);
			numTB = (int) ((numberOfQuestion * 50) / 100);
			numDE = numberOfQuestion - numKHO - numTB;
			break;

		default:
			break;
		}
		// System.out.println(numDE);System.out.println(numTB);System.out.println(numKHO);
		return createDeThiForEvaluation(numDE, numTB, numKHO);
	}

	public Map<String, Question> getListOfQuestionRandom(Map<String, Question> mapq) {
		Map<String, Question> mapRe = new HashMap<>();
		String k = getkey(mapq);
		mapRe.put(k, mapq.get(k));
		return mapRe;
	}

	private DeThi createDeThiForEvaluation(int numDE, int numTB, int numKHO) throws IOException {
		DeThi dt = new DeThi();
		dt.setMaDeThiID("CREATE_BY_AI_SINH_12" + ranDomMDT(2000));
		dt.setClassID("L12");
		dt.setNumberAnswerForOneQuestion(4 + "");
		dt.setSubjectID("SINH12");
		List<Question> listOfQuestion = new ArrayList<>();
		listOfQuestion.addAll(getListOfQuestion(ConstDefine.DE, numDE).values());
		listOfQuestion.addAll(getListOfQuestion(ConstDefine.KHO, numKHO).values());
		listOfQuestion.addAll(getListOfQuestion(ConstDefine.TRUNG_BINH, numTB).values());
		dt.setListOfQuestion(listOfQuestion);
		
		boolean ok=new DeThiDAO().addContentExam(dt);
		if(!ok) return null;
		return dt;
	}

	
	
	private int ranDomMDT(int i) {
		return new Random().nextInt(2000);
	}

	public int checkAnswer(Map<String, String> mapAnswer, Map<String, ContentExam> mapQuestion) {
		int numberAnswerRight = 0;
		for (ContentExam ce : mapQuestion.values()) {
			String q = mapAnswer.get(ce.getQuestionID());
			if (ce.getAnswer().equals(q))
				numberAnswerRight++;
		}
		return numberAnswerRight;
	}

	public int resuiltScoreForExam(Map<String, String> mapAnswer, Map<String, ContentExam> mapQuestion) {
		double answerRight = checkAnswer(mapAnswer, mapQuestion);
		double test = ((double) answerRight / mapQuestion.size()) * 100;
//		return (double) Math.round(test * 100) / 100;
		return (int) Math.round(test);
	}

	public static void main(String[] args) throws IOException {
		
	}

}