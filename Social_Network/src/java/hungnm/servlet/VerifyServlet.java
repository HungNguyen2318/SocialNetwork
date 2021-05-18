/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hungnm.servlet;

import hungnm.account.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.naming.NamingException;
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
public class VerifyServlet extends HttpServlet {

    final static Logger LOG = Logger.getLogger(VerifyServlet.class);
    private final String ERROR_PAGE = "error.html";
    private final String LOGIN_PAGE = "login.jsp";
    private final String VERIFY_PAGE = "verify.jsp";

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
            String code = (String) session.getAttribute("authcode");
            String email = (String) session.getAttribute("email");
            String confirm_code = request.getParameter("authcode");
            if (confirm_code.equals(code)) {
                AccountDAO accountDao = new AccountDAO();
                accountDao.activeAccount(email);
                session.setAttribute("Result", "Your account is actived. Now, you can Sign In.");
                url = LOGIN_PAGE;
            } else {
                session.setAttribute("Result", "Acctive code is wrong");
                url = VERIFY_PAGE;
            } //end of if confirm_code
        } catch (NamingException ex) {
            url = ERROR_PAGE;
            LOG.error("NamingException at VerifyServlet: " + ex.getMessage());
        } catch (SQLException ex) {
            url = ERROR_PAGE;
            LOG.error("SQLException at VerifyServlet: " + ex.getMessage());
        } finally {
            response.sendRedirect(url);
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
