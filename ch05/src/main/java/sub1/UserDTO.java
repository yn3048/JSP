package sub1;

public class UserDTO {
	private String uid;
	private String pass;
	private String name;
	private int age;

	//기본 생성자가 없으면 useBean 태그 사용 안됨
	public UserDTO() {
		
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	
	@Override
	public String toString() {
		return "UserDTO [uid=" + uid + ", name=" + name + ", age=" + age + ", pass=" + pass + "]";
	}
}
