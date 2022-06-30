package student;

import java.util.ArrayList;

public class StudentDAO {
	
	public ArrayList<StudentDTO> getManualList(){
		ArrayList<StudentDTO> list = new ArrayList<StudentDTO>();
		StudentDTO dto = new StudentDTO(4, "SB", "S", "SSB", "SSB123");
		for(int i = 0; i < 10; i++) {
			list.add(dto);
		}
		return list;
	}
	
}
