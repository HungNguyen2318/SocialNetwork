/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hungnm.notification;

import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class NotificationDTO implements Serializable{
    private String notificationId;
    private String articleId;
    private String email;
    private String contentNotification;
    private String createdDate;

    public NotificationDTO(String notificationId, String articleId, String email, String contentNotification, String createdDate) {
        this.notificationId = notificationId;
        this.articleId = articleId;
        this.email = email;
        this.contentNotification = contentNotification;
        this.createdDate = createdDate;
    }

    public NotificationDTO(String articleId, String email, String contentNotification) {
        this.articleId = articleId;
        this.email = email;
        this.contentNotification = contentNotification;
    }

    public String getNotificationId() {
        return notificationId;
    }

    public void setNotificationId(String notificationId) {
        this.notificationId = notificationId;
    }

    public String getArticleId() {
        return articleId;
    }

    public void setArticleId(String articleId) {
        this.articleId = articleId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getContentNotification() {
        return contentNotification;
    }

    public void setContentNotification(String contentNotification) {
        this.contentNotification = contentNotification;
    }

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }
    
    
}
