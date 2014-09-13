/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Model.Cart;
import Model.Orderlist;
import Model.Productlist;
import java.io.IOException;
import javax.jms.Session;
import javax.persistence.metamodel.SetAttribute;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Adisorn
 */
public class InsertToDatabase extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        
        int orderno = Integer.parseInt(request.getParameter("orderno"));
        String productNo[] = request.getParameterValues("productno");
        String productName[] = request.getParameterValues("productname");
        String memberNo[] = request.getParameterValues("memberno");
        String quantity[] = request.getParameterValues("quantity");
        String orderNumber = request.getParameter("removeOrder");
        if(orderNumber != null) {
            Cart cart = (Cart) session.getAttribute("cart");
            cart.remove(Integer.parseInt(orderNumber));
            getServletContext().getRequestDispatcher("/ViewCart.jsp").forward(request, response);
        } else {
        for (int i = 0; i < productNo.length; i++) {

            Productlist pl = new Productlist(
                    orderno,
                    productName[i],
                    Integer.parseInt(quantity[i]));
            Productlist.addProductList(pl);
        }

        Orderlist o = new Orderlist();
        o.setMemberno(Integer.parseInt(request.getParameter("memberno")));
        o.setTotalprice(Double.parseDouble(request.getParameter("totalprice")));
        o.setAddress(request.getParameter("address"));
        Orderlist.addOrderList(o);
        
        
        }
        request.setAttribute("address", request.getParameter("address"));
        request.setAttribute("orderno",orderno);
        getServletContext().getRequestDispatcher("/Transfers.jsp").forward(request, response);

    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
