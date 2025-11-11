<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Thống kê mặt hàng theo doanh thu</title>
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
      .btn-primary {
        background: var(--accent);
        border-color: var(--accent);
      }
      .table-hover tbody tr:hover {
        background-color: #f8f9fa;
        cursor: pointer;
      }
      .revenue-high {
        color: #198754;
        font-weight: 600;
      }
      .revenue-medium {
        color: #fd7e14;
        font-weight: 600;
      }
      .revenue-low {
        color: #6c757d;
        font-weight: 600;
      }

      /* Format date input */
      input[type="date"] {
        position: relative;
      }

      input[type="date"]::-webkit-calendar-picker-indicator {
        cursor: pointer;
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
          <small class="text-muted">Thống kê doanh thu</small>
        </div>
      </div>
    </nav>

    <div class="container py-5">
      <div class="row justify-content-center">
        <div class="col-12">
          <div class="card card-surface">
            <div class="card-body p-4">
              <h3 class="mb-4">Thống kê mặt hàng theo doanh thu</h3>
              <form
                action="<%= request.getContextPath() %>/productStatistic"
                method="get"
                class="mb-4"
              >
                <div class="row g-3 align-items-end">
                  <div class="col-md-4">
                    <label for="startDate" class="form-label"
                      >Ngày bắt đầu</label
                    >
                    <input
                      type="date"
                      class="form-control"
                      id="startDate"
                      name="startDate"
                      value="${startDate}"
                      required
                    />
                  </div>
                  <div class="col-md-4">
                    <label for="endDate" class="form-label"
                      >Ngày kết thúc</label
                    >
                    <input
                      type="date"
                      class="form-control"
                      id="endDate"
                      name="endDate"
                      value="${endDate}"
                      required
                    />
                  </div>
                  <div class="col-md-4">
                    <button type="submit" class="btn btn-primary w-100">
                      Xem báo cáo
                    </button>
                  </div>
                </div>
              </form>

              <c:if test="${not empty error}">
                <div class="alert alert-danger" role="alert">${error}</div>
              </c:if>

              <c:if test="${not empty statistics}">
                <div class="table-responsive">
                  <table class="table table-hover">
                    <thead class="table-light">
                      <tr>
                        <th>STT</th>
                        <th>Mã mặt hàng</th>
                        <th>Tên mặt hàng</th>
                        <th class="text-end">Số lượng bán</th>
                        <th class="text-end">Doanh thu</th>
                        <th class="text-center">Chi tiết</th>
                      </tr>
                    </thead>
                    <tbody>
                      <c:forEach
                        var="stat"
                        items="${statistics}"
                        varStatus="status"
                      >
                        <tr>
                          <td>${status.index + 1}</td>
                          <td><strong>#${stat.productId}</strong></td>
                          <td><strong>${stat.productName}</strong></td>
                          <td class="text-end">${stat.totalQuantity}</td>
                          <td class="text-end">
                            <c:choose>
                              <c:when test="${stat.totalRevenue >= 10000000}">
                                <span class="revenue-high">
                                  <fmt:formatNumber
                                    value="${stat.totalRevenue}"
                                    pattern="#,###"
                                  />
                                  đ
                                </span>
                              </c:when>
                              <c:when test="${stat.totalRevenue >= 1000000}">
                                <span class="revenue-medium">
                                  <fmt:formatNumber
                                    value="${stat.totalRevenue}"
                                    pattern="#,###"
                                  />
                                  đ
                                </span>
                              </c:when>
                              <c:otherwise>
                                <span class="revenue-low">
                                  <fmt:formatNumber
                                    value="${stat.totalRevenue}"
                                    pattern="#,###"
                                  />
                                  đ
                                </span>
                              </c:otherwise>
                            </c:choose>
                          </td>
                          <td class="text-center">
                            <a
                              href="<%= request.getContextPath() %>/billDetail?productId=${stat.productId}&productName=${stat.productName}&startDate=${startDate}&endDate=${endDate}"
                              class="btn btn-sm btn-outline-primary"
                            >
                              Xem chi tiết
                            </a>
                          </td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>

                <c:if test="${empty statistics}">
                  <div class="alert alert-info text-center">
                    Không có dữ liệu trong khoảng thời gian này
                  </div>
                </c:if>
              </c:if>

              <c:if test="${empty statistics && empty error}">
                <div class="alert alert-info text-center">
                  Vui lòng chọn khoảng thời gian để xem báo cáo
                </div>
              </c:if>

              <div class="mt-4 d-flex gap-2 justify-content-center">
                <a
                  href="<%= request.getContextPath() %>/jsp/ReportView.jsp"
                  class="btn btn-outline-secondary"
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
    <script>
      // Set default dates if not set
      window.addEventListener("DOMContentLoaded", function () {
        const startDateInput = document.getElementById("startDate");
        const endDateInput = document.getElementById("endDate");

        if (!startDateInput.value) {
          const today = new Date();
          const firstDayOfMonth = new Date(
            today.getFullYear(),
            today.getMonth(),
            1
          );
          startDateInput.value = firstDayOfMonth.toISOString().split("T")[0];
        }

        if (!endDateInput.value) {
          const today = new Date();
          endDateInput.value = today.toISOString().split("T")[0];
        }

        // Format date display as dd/mm/yyyy
        formatDateInputs();
      });

      function formatDateDisplay(dateString) {
        if (!dateString) return "";
        const [year, month, day] = dateString.split("-");
        return `${day}/${month}/${year}`;
      }

      function formatDateInputs() {
        const startDateInput = document.getElementById("startDate");
        const endDateInput = document.getElementById("endDate");

        // Add event listeners to show formatted date
        startDateInput.addEventListener("change", function () {
          const formattedDate = formatDateDisplay(this.value);
          console.log("Ngày bắt đầu: " + formattedDate);
        });

        endDateInput.addEventListener("change", function () {
          const formattedDate = formatDateDisplay(this.value);
          console.log("Ngày kết thúc: " + formattedDate);
        });
      }
    </script>
  </body>
</html>
