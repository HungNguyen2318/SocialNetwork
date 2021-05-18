/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hungnm.account;

/**
 *
 * @author Admin
 */

public class AccountDTO {
    private String email;
    private String password;
    private String username;
    private String image;
    private String birthday;
    private String gender;
    private String status;
    private String createdDate;

    public AccountDTO() {
    }

    public AccountDTO(String email, String password, String username, String image, String birthday, String gender, String status, String createdDate) {
        this.email = email;
        this.password = password;
        this.username = username;
        this.image = image;
        this.birthday = birthday;
        this.gender = gender;
        this.status = status;
        this.createdDate = createdDate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }
    
}
