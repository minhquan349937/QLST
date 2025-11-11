<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <title>Trang chủ siêu thị</title>
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@500;600;700&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />

    <style>
      body {
        font-family: "Inter", sans-serif;
        background: #f5f7fa;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 100vh;
      }

      .home-card {
        background: #fff;
        padding: 3rem 2.5rem;
        border-radius: 18px;
        box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
        text-align: center;
        width: 420px;
      }

      .card-title {
        font-weight: 700;
        color: #0d6efd;
        margin-bottom: 2rem;
        font-size: 1.75rem;
      }

      .page-title {
        font-weight: 700;
        color: #343a40;
        margin-bottom: 1.5rem;
        font-size: 2.5rem;
      }

      .btn-primary {
        background-color: #0d6efd;
        border: none;
        padding: 0.75rem 1.5rem;
        font-weight: 600;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(13, 110, 253, 0.3);
      }

      .btn-primary:hover {
        background-color: #0b5ed7;
      }

      .footer {
        margin-top: 1.5rem;
        font-size: 0.9rem;
        color: #6c757d;
      }
    </style>
  </head>
  <body>
    <h1 class="page-title">Quản lý siêu thị</h1>

    <div class="home-card">
      <h2 class="card-title">Trang chủ khách hàng</h2>
      <a
        href="<%= request.getContextPath() %>/jsp/RegisterMemberView.jsp"
        class="btn btn-primary"
        >Đăng ký thành viên</a
      >
      <div class="footer">© 2025 SuperMarket</div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  </body>
</html>
