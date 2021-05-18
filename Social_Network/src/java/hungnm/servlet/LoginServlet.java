/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hungnm.servlet;

import hungnm.account.AccountDAO;
import hungnm.account.AccountDTO;
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
public class LoginServlet extends HttpServlet {

    final static Logger LOG = Logger.getLogger(LoginServlet.class);
    private final String ERROR_PAGE = "error.html";
    private final String RESEND_ACTIVE_CODE_PAGE = "resend_code.jsp";
    private final String LOGIN_PAGE = "login.jsp";

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
        //default url
        String url = ERROR_PAGE;
        try {
            //get params
            String email = request.getParameter("txtEmail");
            String password = request.getParameter("txtPassword");
            //process function
            AccountDTO accountDto = null;
            AccountDAO accountDao = new AccountDAO();
            accountDto = accountDao.checkLogin(email, password);
            if (accountDto != null) {
                HttpSession session = request.getSession();
                session.setAttribute("USER", accountDto);
                if (accountDto.getStatus().equals("1")) {
                    url = RESEND_ACTIVE_CODE_PAGE;
                } else if (accountDto.getStatus().equals("2")) {
                    String txtSearchValue = "";
                    url = "DispathController?btAction=search&txtSearchValue=" + txtSearchValue;
                }//end of accountDto.getStatus().equals("1")
            } else {
                request.setAttribute("LOGINFAIL", "Your email or password is not corrcet &#9940;");
                url = LOGIN_PAGE;
            }//end if accountDto != null
        } catch (SQLException ex) {
            url = ERROR_PAGE;
            LOG.error("SQLException at LoginServlet: " + ex.getMessage());
        } catch (NamingException ex) {
            url = ERROR_PAGE;
            LOG.error("NamingException at LoginServlet: " + ex.getMessage());
        } catch (NoSuchAlgorithmException ex) {
            url = ERROR_PAGE;
            LOG.error("NoSuchAlgorithmException at LoginServlet: " + ex.getMessage());
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
