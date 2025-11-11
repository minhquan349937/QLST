<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Đăng ký thành viên</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
      }
      .container {
        background-color: #fff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 0 12px rgba(0, 0, 0, 0.1);
        width: 400px;
      }
      h2 {
        text-align: center;
        color: #007bff;
        margin-bottom: 25px;
      }
      .form-group {
        margin-bottom: 15px;
      }
      label {
        display: block;
        margin-bottom: 5px;
        color: #555;
      }
      input[type="text"],
      input[type="password"],
      input[type="email"],
      input[type="tel"] {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 5px;
        box-sizing: border-box;
      }
      .checkbox-group {
        display: flex;
        align-items: center;
        margin-bottom: 20px;
      }
      .checkbox-group input[type="checkbox"] {
        margin-right: 10px;
      }
      .btn-register {
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
        margin-bottom: 10px;
      }
      .btn-register:hover {
        background-color: #0056b3;
      }
      .btn-back {
        width: 100%;
        padding: 10px;
        background-color: #6c757d;
        color: #fff;
        border: none;
        border-radius: 5px;
        font-size: 16px;
        cursor: pointer;
        text-decoration: none;
        display: inline-block;
        text-align: center;
      }
      .btn-back:hover {
        background-color: #5a6268;
      }
      .message {
        color: red;
        text-align: center;
        margin-top: 10px;
      }
      .message.success {
        color: green;
        padding: 15px;
        background-color: #d4edda;
        border: 1px solid #c3e6cb;
        border-radius: 5px;
        margin-bottom: 20px;
      }
      .message.error {
        color: red;
        padding: 15px;
        background-color: #f8d7da;
        border: 1px solid #f5c6cb;
        border-radius: 5px;
        margin-bottom: 20px;
      }
      .toast {
        position: fixed;
        top: 20px;
        right: 20px;
        min-width: 300px;
        background-color: #28a745;
        color: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
        z-index: 9999;
        display: none;
        animation: slideIn 0.3s ease-out;
      }
      .toast.show {
        display: block;
      }
      .toast-header {
        font-size: 18px;
        font-weight: bold;
        margin-bottom: 8px;
        display: flex;
        align-items: center;
      }
      .toast-header::before {
        content: "✓";
        margin-right: 10px;
        font-size: 24px;
      }
      .toast-body {
        font-size: 14px;
      }
      @keyframes slideIn {
        from {
          transform: translateX(400px);
          opacity: 0;
        }
        to {
          transform: translateX(0);
          opacity: 1;
        }
      }
      @keyframes slideOut {
        from {
          transform: translateX(0);
          opacity: 1;
        }
        to {
          transform: translateX(400px);
          opacity: 0;
        }
      }
      .toast.hiding {
        animation: slideOut 0.3s ease-in;
      }
    </style>
  </head>
  <body>
    <div id="toast" class="toast">
      <div class="toast-header">Đăng ký thành công!</div>
    </div>

    <div class="container">
      <h2>Đăng ký thành viên mới</h2>
      <form action="<%= request.getContextPath() %>/register" method="post">
        <div class="form-group">
          <label for="fullname">Họ và tên:</label>
          <input type="text" id="fullname" name="fullname" required />
        </div>
        <div class="form-group">
          <label for="username">Tên đăng nhập:</label>
          <input type="text" id="username" name="username" required />
        </div>
        <div class="form-group">
          <label for="password">Mật khẩu:</label>
          <input type="password" id="password" name="password" required />
        </div>
        <div class="form-group">
          <label for="email">Email:</label>
          <input type="email" id="email" name="email" required />
        </div>
        <div class="form-group">
          <label for="phoneNumber">Số điện thoại:</label>
          <input type="tel" id="phoneNumber" name="phoneNumber" required />
        </div>
        <div class="form-group">
          <label for="address">Địa chỉ:</label>
          <input type="text" id="address" name="address" />
        </div>
        <button type="submit" class="btn-register">Đăng ký</button>
      </form>

      <a
        href="<%= request.getContextPath() %>/jsp/CustomerHomeView.jsp"
        class="btn-back"
        >⬅ Quay lại</a
      >

      <% if (request.getAttribute("errorMessage") != null) { %>
      <div class="message error">
        <%= request.getAttribute("errorMessage") %>
      </div>
      <% } %>
    </div>

    <% if (request.getAttribute("successMessage") != null) { %>
    <script>
      window.addEventListener("DOMContentLoaded", function () {
        const toast = document.getElementById("toast");
        toast.classList.add("show");

        setTimeout(function () {
          toast.classList.add("hiding");
          setTimeout(function () {
            toast.classList.remove("show", "hiding");
          }, 300);
        }, 5000);
      });
    </script>
    <% } %>
  </body>
</html>
