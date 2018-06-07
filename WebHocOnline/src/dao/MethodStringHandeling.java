package dao;

public class MethodStringHandeling {
	public String getNameAnswer(int i){
		switch (i) {
		case 0:
			return "A";
		case 1:
			return "B";
		case 2:
			return "C";
		case 3:
			return "D";

		default:
			return null;
		}
	}
}
