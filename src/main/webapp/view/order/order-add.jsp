<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Order</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <style>
        :root {
            --primary: #2C3E50;
            --secondary: #34495E;
            --bg-light: #F4F7F6;
            --surface: #FFFFFF;
            --text-main: #333333;
            --text-muted: #7f8c8d;
            --accent: #3498DB;
            --danger: #E74C3C;
            --success: #2ECC71;
            --warning: #F1C40F;
        }

        body {
            background-color: var(--bg-light);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: var(--text-main);
            margin: 0;
            overflow-x: hidden;
        }

        /* --- Sidebar Styling --- */
        .sidebar {
            width: 260px;
            background-color: var(--primary);
            min-height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            display: flex;
            flex-direction: column;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
            z-index: 1000;
        }

        .sidebar-header {
            padding: 20px;
            text-align: center;
            color: var(--surface);
            font-size: 1.25rem;
            font-weight: 700;
            letter-spacing: 1px;
            border-bottom: 1px solid rgba(255,255,255,0.1);
            margin-bottom: 10px;
        }

        .sidebar a {
            color: #bdc3c7;
            padding: 15px 25px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .sidebar a:hover, .sidebar a.active {
            color: var(--surface);
            background-color: var(--secondary);
            border-left: 4px solid var(--accent);
        }

        /* --- Main Content Styling --- */
        .main-content {
            margin-left: 260px;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* --- Navbar Styling --- */
        .top-navbar {
            background-color: var(--surface);
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        }

        .user-profile {
            font-weight: 500;
            color: var(--secondary);
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .btn-logout {
            color: var(--danger);
            border: 1px solid var(--danger);
            padding: 5px 15px;
            border-radius: 20px;
            text-decoration: none;
            font-size: 0.9rem;
            transition: all 0.2s;
        }

        .btn-logout:hover {
            background-color: var(--danger);
            color: white;
        }

        /* --- Page specific styling --- */
        .page-wrapper {
            padding: 30px;
        }

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .page-title {
            font-weight: 600;
            color: var(--primary);
            margin: 0;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .card-box {
            background: var(--surface);
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.03);
            border: 1px solid rgba(0,0,0,0.05);
        }

        /* --- Form Styling --- */
        .form-container {
            max-width: 650px;
        }

        .form-label {
            font-weight: 500;
            color: var(--secondary);
            margin-bottom: 8px;
        }

        .form-control, .form-select {
            padding: 10px 15px;
            border-radius: 6px;
            border: 1px solid var(--border);
            box-shadow: none;
            transition: all 0.2s;
        }

        .form-control:focus, .form-select:focus {
            border-color: var(--accent);
            box-shadow: 0 0 0 0.25rem rgba(52, 152, 219, 0.25);
        }
        
        .input-group-text {
            background-color: var(--bg-light);
            color: var(--secondary);
            border-color: var(--border);
        }

        /* Responsive */
        @media (max-width: 768px) {
            .sidebar { transform: translateX(-100%); transition: 0.3s; }
            .main-content { margin-left: 0; }
        }
    </style>
</head>

<body>

    <div class="sidebar">
        <div class="sidebar-header">
            <i class="bi bi-shop me-2"></i> ONLINE SHOP
        </div>
        
        <a href="${pageContext.request.contextPath}/dashboard"><i class="bi bi-speedometer2"></i> Dashboard</a>
        <a href="${pageContext.request.contextPath}/user"><i class="bi bi-people"></i> Users</a>
        <a href="${pageContext.request.contextPath}/product"><i class="bi bi-box-seam"></i> Products</a>
        <a href="${pageContext.request.contextPath}/category"><i class="bi bi-tags"></i> Categories</a>
        <a href="${pageContext.request.contextPath}/customer"><i class="bi bi-person-lines-fill"></i> Customers</a>
        <a href="${pageContext.request.contextPath}/order" class="active"><i class="bi bi-cart-check"></i> Orders</a>
        <a href="${pageContext.request.contextPath}/supplier"><i class="bi bi-truck"></i> Suppliers</a>
    </div>

    <div class="main-content">
        
        <nav class="top-navbar">
            <div class="d-none d-md-block"></div>
            <div class="user-profile">
                <span>
                    <i class="bi bi-person-circle fs-5 align-middle me-1"></i> 
                    Hi, <strong>${cookie.userName.value}</strong> 
                    <span class="badge bg-secondary ms-1">${cookie.userRole.value}</span>
                </span>
                <a class="btn-logout" href="${pageContext.request.contextPath}/logout">
                    <i class="bi bi-box-arrow-right"></i> Logout
                </a>
            </div>
        </nav>

        <div class="page-wrapper">
            
            <div class="page-header">
                <h4 class="page-title">
                    <a href="${pageContext.request.contextPath}/order" class="text-secondary text-decoration-none">
                        <i class="bi bi-arrow-left-circle me-2"></i>
                    </a>
                    Add New Order
                </h4>
            </div>

            <div class="card-box">
                <div class="form-container">
                    
                    <form action="order?action=add" method="post">

                        <div class="row">
                            <div class="col-md-6 mb-4">
                                <label class="form-label"><i class="bi bi-calendar3 text-secondary me-1"></i> Order Date & Time <span class="text-danger">*</span></label>
                                <input type="datetime-local" name="date" class="form-control" required>
                            </div>

                            <div class="col-md-6 mb-4">
                                <label class="form-label"><i class="bi bi-cash-stack text-secondary me-1"></i> Total Price <span class="text-danger">*</span></label>
                                <div class="input-group">
                                    <span class="input-group-text">$</span>
                                    <input type="number" step="0.01" name="total" class="form-control" placeholder="0.00" min="0" required>
                                </div>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label class="form-label"><i class="bi bi-person text-secondary me-1"></i> Customer <span class="text-danger">*</span></label>
                            <select name="cusId" class="form-select" required>
                                <option value="" disabled selected>-- Select a Customer --</option>
                                <c:forEach items="${customers}" var="cus">
                                    <option value="${cus.cusId}">${cus.cusName} (ID: ${cus.cusId})</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="mb-4">
                            <label class="form-label"><i class="bi bi-activity text-secondary me-1"></i> Order Status</label>
                            <select name="status" class="form-select">
                                <option value="Pending" selected>⌛ Pending</option>
                                <option value="Completed">✅ Completed</option>
                                <option value="Cancelled">❌ Cancelled</option>
                            </select>
                        </div>

                        <hr class="mt-5 mb-4 border-secondary opacity-25">

                        <div class="d-flex gap-3">
                            <button type="submit" class="btn btn-primary px-4">
                                <i class="bi bi-check-circle me-1"></i> Save Order
                            </button>
                            <a href="${pageContext.request.contextPath}/order" class="btn btn-light border px-4">
                                Cancel
                            </a>
                        </div>
                    </form>

                </div>
            </div>

        </div>
    </div>

</body>
</html>