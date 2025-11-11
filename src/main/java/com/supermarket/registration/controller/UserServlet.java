package com.supermarket.registration.controller;

import com.supermarket.registration.dao.UserDAO;
import com.supermarket.registration.model.Customer;
import com.supermarket.registration.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class UserServlet extends HttpServlet {
    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullname = request.getParameter("fullname");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String address = request.getParameter("address");

        if (fullname == null || fullname.isEmpty() || username == null || username.isEmpty() ||
            password == null || password.isEmpty() || email == null || email.isEmpty() ||
            phoneNumber == null || phoneNumber.isEmpty()) {
            request.setAttribute("errorMessage", "Vui lòng điền đầy đủ thông tin.");
            request.getRequestDispatcher("/jsp/RegisterMemberView.jsp").forward(request, response);
            return;
        }

        if (!userDAO.checkIfUserExists(username, phoneNumber).equals("none")) {
            String errorMsg = "";
            String checkResult = userDAO.checkIfUserExists(username, phoneNumber);
            
            if (checkResult.equals("both")) {
                errorMsg = "Username và số điện thoại này đã tồn tại trong hệ thống.";
            } else if (checkResult.equals("username")) {
                errorMsg = "Username này đã được sử dụng. Vui lòng chọn username khác.";
            } else if (checkResult.equals("phone")) {
                errorMsg = "Số điện thoại này đã tồn tại. Vui lòng sử dụng số khác.";
            }
            
            request.setAttribute("errorMessage", errorMsg);
            request.getRequestDispatcher("/jsp/RegisterMemberView.jsp").forward(request, response);
            return;
        }

        User user = new User(username, password, fullname, email, phoneNumber);
        Customer customer = new Customer(0, address, "");

        if (userDAO.saveNewCustomer(user, customer)) {
            request.setAttribute("successMessage", "Đăng ký thành công.");
            request.setAttribute("fullname", fullname);
            request.getRequestDispatcher("/jsp/RegisterMemberView.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "Đăng ký thất bại. Vui lòng thử lại.");
            request.getRequestDispatcher("/jsp/RegisterMemberView.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/jsp/RegisterMemberView.jsp").forward(request, response);
    }
}
