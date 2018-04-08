package pt.francisco.action;

import com.opensymphony.xwork2.ActionSupport;

public class WelcomeUserAction extends ActionSupport{
	
	public static final long serialVersionUID = 1L;

    private String userName;
    private String message;
    private String passWord;

    public String execute() {
            message = "Welcome " + userName;
            return SUCCESS;
    }

    public void setUserName(String userName) {
            this.userName = userName;
    }

    public void setMessage(String message) {
            this.message = message;
    }

    public String getUserName() {
            return userName;
    }

    public String getMessage() {
            return message;
    }

    public String getPassword() {
        return passWord;
	}
	
	public void setPasswprd(String passWord) {
	        this.passWord = passWord;
	}
    
}
