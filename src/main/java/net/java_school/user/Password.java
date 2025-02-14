package net.java_school.user;

import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public class Password {

    @NotNull
    @Size(min = 4, message = "{passwd.validation.error}")
    private String currentPasswd;

    @NotNull
    @Size(min = 4, message = "{passwd.validation.error}")
    private String newPasswd;

    public String getCurrentPasswd() {
        return currentPasswd;
    }

    public void setCurrentPasswd(String currentPasswd) {
        this.currentPasswd = currentPasswd.trim();
    }

    public String getNewPasswd() {
        return newPasswd;
    }

    public void setNewPasswd(String newPasswd) {
        this.newPasswd = newPasswd.trim();
    }

}
