/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hungnm.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class DispathController extends HttpServlet {

    private final String INIT_APP_SERVLET = "InitAppServlet";
    private final String LOGIN_SERVLET = "LoginServlet";
    private final String REGISTER_PAGE = "register_page.jsp";
    private final String REGISTER_SERVLET = "RegisterServlet";
    private final String ERROR_PAGE = "error.html";
    private final String VERIFY_SERVLET = "VerifyServlet";
    private final String RESEND_ACTIVE_CODE_SERVLET = "ResendActiveCodeServlet";
    private final String SIGN_OUT = "SignOutServlet";
    private final String POST_ARTICLE_SERVLET = "PostArticleServlet";
    private final String SEARCH_SERVLET = "SearchServlet";
    private final String DELETE_ARTICLE_SERVLET = "DeleteArticleServlet";
    private final String VIEW_DETAIL_SERVLET = "ViewDetailServlet";
    private final String EMOTION_SERVLET = "EmotionServlet";
    private final String POST_COMMENT_SERVLET = "PostCommentServlet";
    private final String DELETE_COMMENT_SERVLET = "DeleteCommentServlet";
    private final String NOTIFICATION_SERVLET = "NotificationServlet";

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
            //get button
            String button = request.getParameter("btAction");
            if (button == null) {
                url = INIT_APP_SERVLET;
            } else if (button.equals("Sign In")) {
                url = LOGIN_SERVLET;
            } else if (button.equals("Sign Up")) {
                url = REGISTER_PAGE;
            } else if (button.equals("Submit")) {
                url = REGISTER_SERVLET;
            } else if (button.equals("Verify")) {
                url = VERIFY_SERVLET;
            } else if (button.equals("Resend active code")) {
                url = RESEND_ACTIVE_CODE_SERVLET;
            } else if (button.equals("exit_to_app")) {
                url = SIGN_OUT;
            } else if (button.equals("Post")) {
                url = POST_ARTICLE_SERVLET;
            } else if (button.equals("search")) {
                url = SEARCH_SERVLET;
            } else if (button.equals("Delete")) {
                url = DELETE_ARTICLE_SERVLET;
            } else if (button.equals("View Detail")) {
                url = VIEW_DETAIL_SERVLET;
            } else if (button.equals("Like")) {
                url = EMOTION_SERVLET;
            } else if (button.equals("Dislike")) {
                url = EMOTION_SERVLET;
            } else if (button.equals("Post Comment")) {
                url = POST_COMMENT_SERVLET;
            } else if (button.equals("Delete Comment")) {
                url = DELETE_COMMENT_SERVLET;
            } else if (button.equals("notifications")) {
                url = NOTIFICATION_SERVLET;
            } else if (button.equals("home")) {
                url = SEARCH_SERVLET;
            } else{
                url = ERROR_PAGE;
            }//end of if button
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
