<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Chọn loại báo cáo</title>
    
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous"/>
    
    <style>
        :root {
            --accent: #0d6efd;
            --card-bg: #ffffff;
            --muted: #6c757d;
        }
        
        body {
            font-family: "Inter", system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
            background: linear-gradient(180deg, #f6f8fb 0%, #eef2f7 100%);
            color: #222;
            font-size: 14px;
        }
        
        .navbar-brand {
            font-weight: 700;
            color: var(--accent) !important;
            font-size: 20px;
        }
        
        .card-surface {
            border-radius: 14px;
            background: var(--card-bg);
            box-shadow: 0 10px 30px rgba(33, 43, 54, 0.06);
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .card-body {
            padding: 1.5rem !important;
        }
        
        .report-option {
            padding: 1.2rem;
            margin: 0.6rem 0;
            border-radius: 12px;
            border: 3px solid #e0e0e0;
            background: white;
            transition: all 0.3s ease;
            cursor: pointer;
        }
        
        .report-option:hover {
            border-color: var(--accent);
            box-shadow: 0 4px 12px rgba(13, 110, 253, 0.15);
            background: #f8f9ff;
        }
        
        .report-option.disabled {
            opacity: 0.6;
            background: #f5f5f5;
            cursor: not-allowed;
            border-color: #ddd;
        }
        
        .report-option.disabled:hover {
            border-color: #ddd;
            box-shadow: none;
            background: #f5f5f5;
        }
        
        .report-option input[type="radio"] {
            cursor: pointer;
            width: 1.5rem;
            height: 1.5rem;
            margin-top: 0.3rem;
        }
        
        .report-option label {
            cursor: pointer;
            margin-bottom: 0;
        }
        
        .report-option h5 {
            font-weight: 600;
            color: #222;
            font-size: 16px;
        }
        
        .report-option p {
            font-size: 12px;
            line-height: 1.5;
        }
        
        .report-option.disabled h5,
        .report-option.disabled p {
            color: var(--muted);
        }
        
        .btn-primary {
            background: var(--accent);
            border-color: var(--accent);
            padding: 0.8rem 2rem;
            font-size: 14px;
            font-weight: 600;
        }
        
        .btn-outline-secondary {
            padding: 0.8rem 2rem;
            font-size: 14px;
            font-weight: 600;
        }
        
        .badge-coming {
            background-color: #ffc107;
            color: #333;
            font-weight: 600;
            padding: 0.5rem 0.8rem;
            font-size: 14px;
            margin-left: 0.5rem;
        }
        
        h3.mb-4 {
            font-size: 32px;
            font-weight: 700;
        }
        
        .container.py-5 {
            padding: 3rem 1rem !important;
        }
        
        .col-12.col-lg-12 {
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        .card-surface {
            border-radius: 14px;
            background: var(--card-bg);
            box-shadow: 0 10px 30px rgba(33, 43, 54, 0.06);
            max-width: 900px;
            margin: 0 auto;
        }
        
        .report-option {
            padding: 3rem;
            margin: 2rem auto;
            border-radius: 12px;
            border: 3px solid #e0e0e0;
            background: white;
            transition: all 0.3s ease;
            cursor: pointer;
            max-width: 800px;
            width: 100%;
        }
        
        .text-center-custom {
            text-align: center;
        }
        
        h3.mb-4 {
            font-size: 24px;
            font-weight: 700;
            text-align: center;
            margin-bottom: 0.8rem !important;
        }
        
        p.text-muted.mb-4 {
            text-align: center;
            margin-bottom: 1rem !important;
        }
        
        #reportForm {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        
        .btn-container {
            display: flex;
            gap: 1.5rem;
            justify-content: center;
            width: 100%;
            margin-top: 1.5rem;
        }

    </style>
</head>
<body>

<nav class="navbar navbar-light bg-white shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="<%= request.getContextPath() %>/jsp/AdminDashboardView.jsp">SuperMarket - Admin</a>
    </div>

<div class="container-fluid py-5" style="display: flex; justify-content: center; align-items: center; min-height: 100vh;">
    <div class="row w-100" style="justify-content: center;">
        <div class="col-12" style="max-width: 900px;">
            <div class="card card-surface">
                <div class="card-body p-4">
                    <h3 class="mb-4 text-center">Xem báo cáo thống kê</h3>
                    <form id="reportForm" method="post" onsubmit="return handleSubmit(event)">
                        <div class="report-option">
                            <label class="d-flex align-items-center">
                                <input type="radio" name="reportType" value="productRevenue" checked class="me-3" />
                                <div>
                                    <h5 class="mb-1">Thống kê mặt hàng theo doanh thu</h5>
                                </div>
                            </label>
                        </div>
                        <div class="report-option">
                            <label class="d-flex align-items-center">
                                <input type="radio" name="reportType" value="supplierRevenue" disabled class="me-3" />
                                <div>
                                    <h5 class="mb-1">Thống kê nhà cung cấp</h5>
                                </div>
                            </label>
                        </div>
                        <div class="report-option">
                            <label class="d-flex align-items-center">
                                <input type="radio" name="reportType" value="timeRevenue" disabled class="me-3" />
                                <div>
                                    <h5 class="mb-1">Thống kê doanh thu theo thời gian</h5>
                                </div>
                            </label>
                        </div>

                        <div class="btn-container">
                            <button type="submit" class="btn btn-primary">Xem báo cáo</button>
                            <a href="<%= request.getContextPath() %>/jsp/AdminDashboardView.jsp" class="btn btn-outline-secondary">Quay lại Dashboard</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script>
    function handleSubmit(event) {
        event.preventDefault();
        
        const reportType = document.querySelector('input[name="reportType"]:checked').value;
        const contextPath = '<%= request.getContextPath() %>';
        
        const urls = {
            'productRevenue': contextPath + '/jsp/ProductRevenueReportView.jsp',
            'supplierRevenue': contextPath + '/jsp/SupplierReportView.jsp',
            'timeRevenue': contextPath + '/jsp/TimeRevenueReportView.jsp'
        };
        
        if (urls[reportType]) {
            window.location.href = urls[reportType];
        } else {
            alert('Chức năng này đang được phát triển!');
        }
        
        return false;
    }
</script>

</body>
</html>
