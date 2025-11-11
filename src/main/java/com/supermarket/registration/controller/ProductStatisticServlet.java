package com.supermarket.registration.controller;

import com.supermarket.registration.dao.ProductStatisticsDAO;
import com.supermarket.registration.model.ProductStatistics;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

/**
 * Servlet for Product Revenue Statistics
 */
@WebServlet("/productStatistic")
public class ProductStatisticServlet extends HttpServlet {

    private ProductStatisticsDAO productStatisticsDAO;

    @Override
    public void init() throws ServletException {
        productStatisticsDAO = new ProductStatisticsDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");

        if (startDateStr == null || endDateStr == null || 
            startDateStr.isEmpty() || endDateStr.isEmpty()) {
            request.setAttribute("error", "Vui lòng chọn khoảng thời gian");
            request.getRequestDispatcher("/jsp/ProductRevenueReportView.jsp").forward(request, response);
            return;
        }

        try {
            Date startDate = Date.valueOf(startDateStr);
            Date endDate = Date.valueOf(endDateStr);

            List<ProductStatistics> statistics = productStatisticsDAO.getProductRevenueStats(startDate, endDate);

            request.setAttribute("statistics", statistics);
            request.setAttribute("startDate", startDateStr);
            request.setAttribute("endDate", endDateStr);

            // Forward to view
            request.getRequestDispatcher("/jsp/ProductRevenueReportView.jsp").forward(request, response);

        } catch (IllegalArgumentException e) {
            request.setAttribute("error", "Định dạng ngày không hợp lệ");
            request.getRequestDispatcher("/jsp/ProductRevenueReportView.jsp").forward(request, response);
        }
    }
}
