/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import model.DAOBook;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "EditBook", urlPatterns = {"/EditBookURL"})
public class EditBook extends HttpServlet {


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
        try {
            response.setContentType("text/html;charset=UTF-8");
            int id = Integer.valueOf(request.getParameter("id"));
            int cateId = Integer.valueOf(request.getParameter("category"));
            double price = Double.valueOf(request.getParameter("price"));
            int stock = Integer.valueOf(request.getParameter("stock"));
            String img = request.getParameter("img");
            String descri = request.getParameter("descri");
            String name = request.getParameter("name");
            String creDate = request.getParameter("creDate");
            String author = request.getParameter("author");
            String publish = request.getParameter("publish");
            DAOBook dao = new DAOBook();
            dao.updateBook(id, name, author, publish, price, cateId, stock, creDate, descri, img);
            response.sendRedirect("ManagerBookURL");
        } catch (Exception ex) {
            response.sendRedirect("/html/404.html");
        }
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
