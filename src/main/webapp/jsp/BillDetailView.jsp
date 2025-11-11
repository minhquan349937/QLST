<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Chi tiết giao dịch mặt hàng ${productName}</title>
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      crossorigin="anonymous"
    />
    <style>
      :root {
        --accent: #0d6efd;
        --card-bg: #ffffff;
        --muted: #6c757d;
      }
      body {
        font-family: "Inter", system-ui, -apple-system, "Segoe UI", Roboto,
          "Helvetica Neue", Arial;
        background: linear-gradient(180deg, #f6f8fb 0%, #eef2f7 100%);
        color: #222;
      }
      .navbar-brand {
        font-weight: 700;
        color: var(--accent) !important;
      }
      .card-surface {
        border-radius: 14px;
        background: var(--card-bg);
        box-shadow: 0 10px 30px rgba(33, 43, 54, 0.06);
      }
      .product-header {
        padding: 1.5rem;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
        border-radius: 12px;
        margin-bottom: 1.5rem;
      }
      .stat-box {
        padding: 1rem;
        border-radius: 8px;
        background: rgba(255, 255, 255, 0.2);
        text-align: center;
      }
      .stat-box h5 {
        margin: 0;
        font-size: 1.5rem;
      }
      .stat-box small {
        opacity: 0.9;
      }
      .btn-primary {
        background: var(--accent);
        border-color: var(--accent);
      }
    </style>
  </head>
  <body>
    <nav class="navbar navbar-light bg-white shadow-sm">
      <div class="container">
        <a
          class="navbar-brand"
          href="<%= request.getContextPath() %>/jsp/AdminDashboardView.jsp"
          >SuperMarket - Admin</a
        >
        <div>
          <small class="text-muted">Chi tiết giao dịch</small>
        </div>
      </div>
    </nav>

    <div class="container py-5">
      <div class="row justify-content-center">
        <div class="col-12">
          <div class="card card-surface">
            <div class="card-body p-4">
              <h3 class="mb-4">Chi tiết giao dịch mặt hàng: ${productName}</h3>

              <c:if test="${not empty billDetails}">
                <div class="table-responsive">
                  <table class="table table-hover">
                    <thead class="table-light">
                      <tr>
                        <th>STT</th>
                        <th>Mã hóa đơn</th>
                        <th>Ngày giao dịch</th>
                        <th class="text-end">Số lượng</th>
                        <th class="text-end">Đơn giá</th>
                        <th class="text-end">Thành tiền</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:set var="totalQuantity" value="0" />
                      <c:set var="totalAmount" value="0" />

                      <c:forEach
                        var="detail"
                        items="${billDetails}"
                        varStatus="status"
                      >
                        <tr>
                          <td>${status.index + 1}</td>
                          <td><strong>#${detail.billId}</strong></td>
                          <td>
                            <fmt:formatDate
                              value="${detail.billDate}"
                              pattern="dd/MM/yyyy"
                            />
                          </td>
                          <td class="text-end">${detail.quantity}</td>
                          <td class="text-end">
                            <fmt:formatNumber
                              value="${detail.unitPrice}"
                              pattern="#,###"
                            />
                            đ
                          </td>
                          <td class="text-end">
                            <fmt:formatNumber
                              value="${detail.lineTotal}"
                              pattern="#,###"
                            />
                            đ
                          </td>
                        </tr>

                        <c:set
                          var="totalQuantity"
                          value="${totalQuantity + detail.quantity}"
                        />
                        <c:set
                          var="totalAmount"
                          value="${totalAmount + detail.lineTotal}"
                        />
                      </c:forEach>

                      <tr class="table-info fw-bold">
                        <td colspan="3" class="text-end">Tổng cộng:</td>
                        <td class="text-end">${totalQuantity}</td>
                        <td></td>
                        <td class="text-end">
                          <fmt:formatNumber
                            value="${totalAmount}"
                            pattern="#,###"
                          />
                          đ
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </c:if>

              <c:if test="${empty billDetails && empty error}">
                <div class="alert alert-info text-center">
                  Không có giao dịch nào cho mặt hàng này trong khoảng thời gian
                  đã chọn
                </div>
              </c:if>

              <div class="mt-4 d-flex gap-2 justify-content-center">
                <a
                  href="<%= request.getContextPath() %>/productStatistic?startDate=${startDate}&endDate=${endDate}"
                  class="btn btn-primary"
                  >Quay lại</a
                >
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
