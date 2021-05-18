/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hungnm.servlet;

import hungnm.account.AccountDAO;
import hungnm.account.AccountDTO;
import hungnm.email.EmailUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

/**
 *
 * @author Admin
 */
public class RegisterServlet extends HttpServlet {

    final static Logger LOG = Logger.getLogger(RegisterServlet.class);
    private final String ERROR_PAGE = "error.html";
    private final String VERIFY_PAGE = "verify.jsp";
    private final String REGISTER_PAGE = "register_page.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        //get session
        HttpSession session = request.getSession();
        //default url
        String url = ERROR_PAGE;
        try {
            //get param
            String txtEmail = request.getParameter("txtEmail");
            String txtPassword = request.getParameter("txtPassword");
            String txtUsername = request.getParameter("txtUsername");
            String txtBirthday = request.getParameter("txtBirthday");
            String selectGender = request.getParameter("selectGender");
            String txtLinkImageAvatar = request.getParameter("txtLinkImageAvatar");
            //create instance object of the SendEmail Class
            EmailUtil emailUtil = new EmailUtil();
            //get the 6-digit code
            String code = emailUtil.getRandom();
            //create dto of account          
            AccountDTO accountDto = new AccountDTO(txtEmail, txtPassword, txtUsername, txtLinkImageAvatar, txtBirthday, selectGender, "1", null);
            AccountDAO accountDao = new AccountDAO();
            boolean resultCreateUser = accountDao.createAccount(accountDto);
            if (resultCreateUser) {
                //call the send email method
                boolean test = emailUtil.sendEmail(accountDto, code);
                if (test) {
                    session.setAttribute("authcode", code);
                    session.setAttribute("email", accountDto.getEmail());
                    url = VERIFY_PAGE;
                }//end of test
            }//end of resultCreateUser
        } catch (NamingException ex) {
            url = ERROR_PAGE;
            LOG.error("NamingException at RegisterServlet: " + ex.getMessage());
        } catch (SQLException ex) {          
            if (ex.getMessage().contains("duplicate")) {
                request.setAttribute("RESIGTERFAILURE", "Your account is existed &#9940;");
                url = REGISTER_PAGE;
            }else{
                LOG.error("SQLException at RegisterServlet: " + ex.getMessage());
            }
        } catch (NoSuchAlgorithmException ex) {
            url = ERROR_PAGE;
            LOG.error("NoSuchAlgorithmException at RegisterServlet: " + ex.getMessage());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
