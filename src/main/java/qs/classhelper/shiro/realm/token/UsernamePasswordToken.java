package qs.classhelper.shiro.realm.token;

public class UsernamePasswordToken extends org.apache.shiro.authc.UsernamePasswordToken {
	
	private String captha;

	public String getCaptha() {
		return captha;
	}

	public void setCaptha(String captha) {
		this.captha = captha;
	}

	public UsernamePasswordToken() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UsernamePasswordToken(String username, String password,String captha) {
		super(username, password);
		// TODO Auto-generated constructor stub
		this.captha=captha;
	}
	
}
