package com.supermarket.registration.controller;

import com.supermarket.registration.dao.BillForProductDAO;
import com.supermarket.registration.model.BillDetail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

/**
 * Servlet for Bill Details by Product
 */
@WebServlet("/billDetail")
public class BillDetailServlet extends HttpServlet {

    private BillForProductDAO billForProductDAO;

    @Override
    public void init() throws ServletException {
        billForProductDAO = new BillForProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String productIdStr = request.getParameter("productId");
        String productName = request.getParameter("productName");
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");

        if (productIdStr == null || startDateStr == null || endDateStr == null) {
            request.setAttribute("error", "Thiếu tham số");
            request.getRequestDispatcher("/jsp/BillDetailView.jsp").forward(request, response);
            return;
        }

        try {
            int productId = Integer.parseInt(productIdStr);
            Date startDate = Date.valueOf(startDateStr);
            Date endDate = Date.valueOf(endDateStr);

            // Get bill details for product
            List<BillDetail> billDetails = billForProductDAO.getBillForProduct(productId, startDate, endDate);

            // Set attributes for JSP
            request.setAttribute("billDetails", billDetails);
            request.setAttribute("productId", productId);
            request.setAttribute("productName", productName);
            request.setAttribute("startDate", startDateStr);
            request.setAttribute("endDate", endDateStr);

            // Forward to view
            request.getRequestDispatcher("/jsp/BillDetailView.jsp").forward(request, response);

        } catch (IllegalArgumentException e) {
            request.setAttribute("error", "Tham số không hợp lệ");
            request.getRequestDispatcher("/jsp/BillDetailView.jsp").forward(request, response);
        }
    }
}
