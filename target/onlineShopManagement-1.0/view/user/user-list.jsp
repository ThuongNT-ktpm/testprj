<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>User Management</title>

                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <link rel="stylesheet"
                    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

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
                        box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
                        z-index: 1000;
                    }

                    .sidebar-header {
                        padding: 20px;
                        text-align: center;
                        color: var(--surface);
                        font-size: 1.25rem;
                        font-weight: 700;
                        letter-spacing: 1px;
                        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
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

                    .sidebar a:hover,
                    .sidebar a.active {
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
                        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
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
                        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.03);
                        border: 1px solid rgba(0, 0, 0, 0.05);
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

                    .badge-role {
                        padding: 5px 10px;
                        border-radius: 4px;
                        font-size: 0.8rem;
                        font-weight: 500;
                    }

                    /* Action Buttons */
                    .btn-action {
                        padding: 5px 10px;
                        font-size: 0.85rem;
                        border-radius: 4px;
                    }

                    /* Responsive */
                    @media (max-width: 768px) {
                        .sidebar {
                            transform: translateX(-100%);
                            transition: 0.3s;
                        }

                        .main-content {
                            margin-left: 0;
                        }

                        .page-header {
                            flex-direction: column;
                            align-items: flex-start;
                            gap: 15px;
                        }
                    }
                </style>
            </head>

            <body>

                <div class="sidebar">
                    <div class="sidebar-header">
                        <i class="bi bi-shop me-2"></i> ONLINE SHOP
                    </div>

                    <a href="${pageContext.request.contextPath}/dashboard"><i class="bi bi-speedometer2"></i>
                        Dashboard</a>
                    <a href="${pageContext.request.contextPath}/user" class="active"><i class="bi bi-people"></i>
                        Users</a>
                    <a href="${pageContext.request.contextPath}/product"><i class="bi bi-box-seam"></i> Products</a>
                    <a href="${pageContext.request.contextPath}/category"><i class="bi bi-tags"></i> Categories</a>
                    <a href="${pageContext.request.contextPath}/customer"><i class="bi bi-person-lines-fill"></i>
                        Customers</a>
                    <a href="${pageContext.request.contextPath}/order"><i class="bi bi-cart-check"></i> Orders</a>
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
                            <h4 class="page-title">User List</h4>
                            <a href="user?action=add" class="btn btn-primary">
                                <i class="bi bi-plus-lg"></i> Add New User
                            </a>
                        </div>

                        <div class="card-box">
                            <div class="table-responsive">
                                <table class="table table-hover align-middle">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Username</th>
                                            <th>Email</th>
                                            <th>Role</th>
                                            <th class="text-center">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listUser}" var="u">
                                            <tr>
                                                <td><strong>#${u.userId}</strong></td>
                                                <td>
                                                    <div class="d-flex align-items-center">
                                                        <div class="bg-light rounded-circle p-2 me-2">
                                                            <i class="bi bi-person text-secondary"></i>
                                                        </div>
                                                        ${u.userName}
                                                    </div>
                                                </td>
                                                <td>${u.userEmail}</td>
                                                <td>
                                                    <span
                                                        class="badge bg-info text-dark badge-role">${u.userRole}</span>
                                                </td>
                                                <td class="text-center">
                                                    <c:if test="${fn:toLowerCase(cookie.userRole.value) == 'admin'}">
                                                        <a href="${pageContext.request.contextPath}/user?action=detail&id=${u.userId}"
                                                            class="btn btn-info btn-action text-white me-1"
                                                            title="Detail">
                                                            <i class="bi bi-eye"></i> Detail
                                                        </a>
                                                    </c:if>
                                                    <a href="user?action=update&id=${u.userId}"
                                                        class="btn btn-warning btn-action text-dark me-1" title="Edit">
                                                        <i class="bi bi-pencil-square"></i> Edit
                                                    </a>
                                                    <a href="${pageContext.request.contextPath}/user?action=delete&id=${u.userId}"
                                                        onclick="return confirm('Are you sure you want to delete this user?')"
                                                        class="btn btn-danger btn-action" title="Delete">
                                                        <i class="bi bi-trash"></i> Delete
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>

                                        <c:if test="${empty listUser}">
                                            <tr>
                                                <td colspan="5" class="text-center py-4 text-muted">
                                                    <i class="bi bi-inbox fs-2 d-block mb-2"></i>
                                                    No users found.
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