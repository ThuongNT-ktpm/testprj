<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Management</title>

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
        }

        .card-box {
            background: var(--surface);
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.03);
            border: 1px solid rgba(0,0,0,0.05);
        }

        /* Table Styling */
        .table {
            margin-bottom: 0;
        }
        
        .table thead th {
            background-color: var(--bg-light);
            color: var(--secondary);
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.85rem;
            letter-spacing: 0.5px;
            border-bottom: 2px solid var(--border);
            padding: 15px;
        }

        .table tbody td {
            vertical-align: middle;
            padding: 15px;
            color: var(--text-main);
            border-bottom: 1px solid var(--border);
        }
        
        .badge-status {
            padding: 6px 12px;
            font-weight: 500;
            border-radius: 30px;
            font-size: 0.85rem;
        }

        /* Action Buttons */
        .btn-action {
            padding: 5px 10px;
            font-size: 0.85rem;
            border-radius: 4px;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .sidebar { transform: translateX(-100%); transition: 0.3s; }
            .main-content { margin-left: 0; }
            .page-header { flex-direction: column; align-items: flex-start; gap: 15px; }
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
                <h4 class="page-title">Order List</h4>
                <a href="order?action=add" class="btn btn-primary">
                    <i class="bi bi-plus-lg"></i> Create New Order
                </a>
            </div>

            <div class="card-box">
                <div class="table-responsive">
                    <table class="table table-hover align-middle">
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Customer Info</th>
                                <th>Order Date</th>
                                <th>Total Amount</th>
                                <th>Status</th>
                                <th class="text-center">Action</th>
                            </tr>
                        </thead>  
                        <tbody> 
                            <c:forEach items="${listOrder}" var="o">
                                <tr>
                                    <td><strong class="text-primary">#ORD-${o.orderID}</strong></td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <i class="bi bi-person-badge fs-5 text-secondary me-2"></i>
                                            <span class="fw-medium">${o.cusId.cusName}</span>
                                        </div>
                                    </td>
                                    <td>
                                        <i class="bi bi-calendar-date text-muted me-1"></i> ${o.orderDate}
                                    </td>
                                    <td class="text-success fw-bold">
                                        $${o.orderTotal_price}
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${o.orderStatus == 'Completed'}">
                                                <span class="badge bg-success badge-status"><i class="bi bi-check-circle me-1"></i> Completed</span>
                                            </c:when>
                                            <c:when test="${o.orderStatus == 'Pending'}">
                                                <span class="badge bg-warning text-dark badge-status"><i class="bi bi-hourglass-split me-1"></i> Pending</span>
                                            </c:when>
                                            <c:when test="${o.orderStatus == 'Cancelled'}">
                                                <span class="badge bg-danger badge-status"><i class="bi bi-x-circle me-1"></i> Cancelled</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-secondary badge-status">${o.orderStatus}</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="text-center">
                                        <a href="order?action=edit&id=${o.orderID}" class="btn btn-warning btn-action text-dark me-1" title="Edit">
                                            <i class="bi bi-pencil-square"></i> Edit
                                        </a>
                                        <a href="order?action=delete&id=${o.orderID}" 
                                           onclick="return confirm('Are you sure you want to delete this order?')" 
                                           class="btn btn-danger btn-action" title="Delete">
                                            <i class="bi bi-trash"></i> Delete
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach> 
                            
                            <c:if test="${empty listOrder}">
                                <tr>
                                    <td colspan="6" class="text-center py-5 text-muted">
                                        <i class="bi bi-cart-x fs-1 d-block mb-3"></i>
                                        <h5>No orders found</h5>
                                        <p class="mb-0">You don't have any orders yet.</p>
                                    </td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>

</body>
</html>