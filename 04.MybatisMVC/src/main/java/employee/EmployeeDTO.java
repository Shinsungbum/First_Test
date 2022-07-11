package employee;

public class EmployeeDTO {
	private String name, e_mail, phone_number, department_name, addr; 
	private int	employee_id, department_id;
	private double max_sal,min_sal, avg_sal;

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getE_mail() {
		return e_mail;
	}
	public void setE_mail(String e_mail) {
		this.e_mail = e_mail;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public double getMax_sal() {
		return max_sal;
	}
	public void setMax_sal(double max_sal) {
		this.max_sal = max_sal;
	}
	public double getMin_sal() {
		return min_sal;
	}
	public void setMin_sal(double min_sal) {
		this.min_sal = min_sal;
	}
	public double getAvg_sal() {
		return avg_sal;
	}
	public void setAvg_sal(double avg_sal) {
		this.avg_sal = avg_sal;
	}
	public int getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}
	public int getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}
		
}
