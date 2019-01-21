package part01.main;

import java.util.List;

import part01.dao.EmployeesDAO;
import part01.dto.EmployeesDTO;

public class EmpTest {
	public static void main(String[] args) {
		EmployeesDAO dao = new EmployeesDAO();
		
		System.out.printf("recored count:%d\n", dao.countMethod());
		List<EmployeesDTO> list = dao.allMethod();
		
		for(EmployeesDTO dto1 : list)
			System.out.printf("%s %d %s\n", dto1.getFirst_name(), dto1.getSalary(), dto1.getHire_date());
		
		System.out.println("--------------------------------------------------------------");
				
		System.out.printf("recored count:%d\n", dao.countMethod());
		
		List<EmployeesDTO> slist = dao.searchMethod("lex");
				
		for(EmployeesDTO dto2 : slist)
			System.out.printf("%s %d %s\n", dto2.getFirst_name(), dto2.getSalary(), dto2.getHire_date());
		
		System.out.println("--------------------------------------------------------------");
		
		EmployeesDTO dto = dao.oneMethod(100);
		System.out.printf("%s %d %s\n",
							dto.getFirst_name(),
							dto.getSalary(),
							dto.getHire_date());
		
		System.out.println("--------------------------------------------------------------");
		
		List<EmployeesDTO> ylist = dao.yearMethod(2007);
		
		for(EmployeesDTO dto3 : ylist)
			System.out.printf("%s %d %s\n", dto3.getFirst_name(), dto3.getSalary(), dto3.getHire_date());
		
	}
}
