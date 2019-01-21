package part02.main;

import java.util.List;

import part02.dao.MemDAO;
import part02.dto.MemDTO;

public class MemTest {
	public static void main(String[] args) {
		MemDAO dao = new MemDAO();
		//dao.insertMethod(new MemDTO("박사랑", 30, "평야")); // insert 활용하기 위해 생성자
		dao.insertMethod(new MemDTO("유대리", 20)); // 오라클로 바로 연동해서 사용하면 상관없지만(not null 선언이 아닌이상)
												  // mybatis는 오류가 발생함
		
		List<MemDTO> list = dao.allMethod();
		
		for(MemDTO dto1 : list)
			System.out.printf("%d %s %d %s\n", dto1.getNum(), dto1.getName(), dto1.getAge(), dto1.getLoc());
	
	}
	
	
}
