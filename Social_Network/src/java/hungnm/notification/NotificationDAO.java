/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hungnm.notification;

import hungnm.database.DatabaseUtil;
import java.io.Serializable;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
public class NotificationDAO implements Serializable{
    public boolean insertNotification(NotificationDTO notificationDto) throws NamingException, SQLException, NoSuchAlgorithmException {
        //1.Open connection
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DatabaseUtil.makeConnection();
            if (con != null) {
                //2.Create sql String
                String sql = "Insert into Notification(ArticleID,Email,ContentNotification) values (?,?,?)";
                //3.Create Statement and set values to parameters
                stm = con.prepareStatement(sql);
                stm.setString(1, notificationDto.getArticleId());
                stm.setString(2, notificationDto.getEmail());
                stm.setString(3, notificationDto.getContentNotification());
                //4.Execute Query
                int row = stm.executeUpdate();
                //5.Process result
                if (row > 0) {
                    return true;
                }
            }//end if con existed 
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
    
    public List<NotificationDTO> findByEmail(String email)
            throws SQLException, NamingException {
        NotificationDTO notificationDto = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<NotificationDTO> listOfNotification = new ArrayList<>();
        try {
            con = DatabaseUtil.makeConnection();
            String sql = "Select NotificationID,ArticleID,ContentNotification,CreatedDay from [Notification] where Email = ? ORDER BY CreatedDay DESC";
            stm = con.prepareStatement(sql);
            stm.setString(1, email);
            rs = stm.executeQuery();

            while (rs.next()) {
                String notificationID = rs.getString("NotificationID");
                String articleID = rs.getString("ArticleID");
                String contentNotification = rs.getString("ContentNotification");
                String createdDate = rs.getString("CreatedDay");
                notificationDto = new NotificationDTO(notificationID, articleID, email, contentNotification, createdDate);
                listOfNotification.add(notificationDto);
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return listOfNotification;
    }
}
