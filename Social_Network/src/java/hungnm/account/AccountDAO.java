/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hungnm.account;

import hungnm.database.DatabaseUtil;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
public class AccountDAO {

    public boolean createAccount(AccountDTO accountDto) throws NamingException, SQLException, NoSuchAlgorithmException {
        //1.Open connection
        Connection con = null;
        PreparedStatement stm = null;
        try {
            con = DatabaseUtil.makeConnection();
            if (con != null) {
                //2.Create sql String
                String sql = "Insert into Account(Email,[Password],Username,LinkImage,Birthday,Gender,StateID) "
                        + "values (?,?,?,?,?,?,?)";
                //3.Create Statement and set values to parameters
                stm = con.prepareStatement(sql);
                stm.setString(1, accountDto.getEmail());
                stm.setString(2, getSHA_256SecurePassword(accountDto.getPassword()));
                stm.setString(3, accountDto.getUsername());
                stm.setString(4, accountDto.getImage());
                stm.setString(5, accountDto.getBirthday());
                stm.setString(6, accountDto.getGender());
                stm.setString(7, "1");
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

    public String getSHA_256SecurePassword(String passwordToHash) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        return new BigInteger(1, md.digest(passwordToHash.getBytes())).toString(16);
    }

    public boolean activeAccount(String email) throws NamingException, SQLException {
        //1.Open connection
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DatabaseUtil.makeConnection();
            if (con != null) {
                //2.Create sql String
                String sql = "UPDATE Account "
                        + "SET StateID = '2' "
                        + "Where Email = ?";
                //3.Create Statement and set values to parameters
                stm = con.prepareStatement(sql);
                stm.setString(1, email);
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

    public AccountDTO checkLogin(String email, String password)
            throws SQLException, NamingException, NoSuchAlgorithmException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        AccountDTO user = null;
        password = getSHA_256SecurePassword(password);
        try {
            con = DatabaseUtil.makeConnection();
            String sql = "SELECT Email,[Password],Username,LinkImage,Birthday,Gender,StateID,CreatedDay "
                    + "FROM Account "
                    + "where Email = ? AND [Password] = ?";
            stm = con.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, password);
            rs = stm.executeQuery();
            if (rs.next()) {
                String username = rs.getString("Username");
                String birthday = rs.getString("Birthday");;
                String gender = rs.getString("Gender");;
                String linkImageAvatar = rs.getString("LinkImage");
                String stateID = rs.getString("StateID");
                String createdDay = rs.getString("CreatedDay").substring(0, 10);
                user = new AccountDTO(email, password, username, linkImageAvatar, birthday, gender, stateID, createdDay);
            }
        } finally {
            if (con != null) {
                con.close();
            }
            if (stm != null) {
                stm.close();
            }
        }
        return user;
    }
}
