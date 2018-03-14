package qs.classhelper.shiro.realm.token;

public class SimpleAuthenticationInfo extends org.apache.shiro.authc.SimpleAuthenticationInfo{
	private String captha;

	public String getCaptha() {
		return captha;
	}

	public void setCaptha(String captha) {
		this.captha = captha;
	}

	public SimpleAuthenticationInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SimpleAuthenticationInfo(Object principal, Object credentials,String captha,String realmName) {
		super(principal, credentials, realmName);
		// TODO Auto-generated constructor stub
		this.captha=captha;
	}
	
}
