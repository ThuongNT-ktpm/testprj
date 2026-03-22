<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>User Detail</title>

            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <style>
/* =============================================
   Online Shop Management - Shared Stylesheet
   File: css/style.css
   ============================================= */

/* --- CSS Variables / Design Tokens --- */
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
    --border: #e0e0e0;
}

/* --- Base --- */
body {
    background-color: var(--bg-light);
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    color: var(--text-main);
    margin: 0;
    overflow-x: hidden;
}

/* ======================
   Sidebar
   ====================== */
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

/* ======================
   Main Content Layout
   ====================== */
.main-content {
    margin-left: 260px;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

/* ======================
   Top Navbar
   ====================== */
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

/* ======================
   Page Layout
   ====================== */
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

/* ======================
   Card Box
   ====================== */
.card-box {
    background: var(--surface);
    padding: 25px;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.03);
    border: 1px solid rgba(0, 0, 0, 0.05);
}

/* ======================
   Table
   ====================== */
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

/* ======================
   Badges & Buttons
   ====================== */
.badge-role {
    padding: 5px 10px;
    border-radius: 4px;
    font-size: 0.8rem;
    font-weight: 500;
}

.btn-action {
    padding: 5px 10px;
    font-size: 0.85rem;
    border-radius: 4px;
}

/* ======================
   User Detail Page
   ====================== */
.detail-card {
    background: var(--surface);
    border-radius: 12px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.07);
    border: 1px solid rgba(0, 0, 0, 0.05);
    overflow: hidden;
    max-width: 680px;
    margin: 0 auto;
}

.detail-card-header {
    background: linear-gradient(135deg, var(--primary) 0%, var(--accent) 100%);
    color: white;
    padding: 30px;
    text-align: center;
}

.detail-avatar {
    width: 80px;
    height: 80px;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.2);
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 15px;
    font-size: 2rem;
}

.detail-card-body {
    padding: 30px;
}

.detail-row {
    display: flex;
    align-items: center;
    padding: 15px 0;
    border-bottom: 1px solid #f0f0f0;
}

.detail-row:last-child {
    border-bottom: none;
}

.detail-label {
    width: 140px;
    font-weight: 600;
    color: var(--text-muted);
    font-size: 0.85rem;
    text-transform: uppercase;
    letter-spacing: 0.5px;
    flex-shrink: 0;
    display: flex;
    align-items: center;
    gap: 8px;
}

.detail-value {
    color: var(--text-main);
    font-size: 1rem;
    flex: 1;
}

/* ======================
   Password Mask (Detail page)
   ====================== */
.password-mask {
    font-family: monospace;
    letter-spacing: 3px;
    background: #f8f9fa;
    padding: 4px 10px;
    border-radius: 4px;
    border: 1px solid #e9ecef;
    display: inline-flex;
    align-items: center;
    gap: 10px;
}

.password-text {
    display: none;
}

.toggle-password {
    cursor: pointer;
    color: var(--accent);
    font-size: 0.9rem;
}

/* ======================
   Responsive
   ====================== */
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
}    </style>
        </head>

        <body>

            <div class="sidebar">
                <div class="sidebar-header">
                    <i class="bi bi-shop me-2"></i> ONLINE SHOP
                </div>
                <a href="${pageContext.request.contextPath}/dashboard"><i class="bi bi-speedometer2"></i> Dashboard</a>
                <a href="${pageContext.request.contextPath}/user" class="active"><i class="bi bi-people"></i> Users</a>
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
                        <h4 class="page-title"><i class="bi bi-person-badge me-2"></i>User Detail</h4>
                        <a href="${pageContext.request.contextPath}/user" class="btn btn-outline-secondary">
                            <i class="bi bi-arrow-left me-1"></i> Back to List
                        </a>
                    </div>

                    <c:if test="${not empty userDetail}">
                        <div class="detail-card">
                            <div class="detail-card-header">
                                <div class="detail-avatar">
                                    <i class="bi bi-person-fill"></i>
                                </div>
                                <h5 class="mb-1">${userDetail.userName}</h5>
                                <span class="badge bg-light text-dark">${userDetail.userRole}</span>
                            </div>

                            <div class="detail-card-body">
                                <div class="detail-row">
                                    <div class="detail-label"><i class="bi bi-hash"></i> ID</div>
                                    <div class="detail-value"><strong>#${userDetail.userId}</strong></div>
                                </div>
                                <div class="detail-row">
                                    <div class="detail-label"><i class="bi bi-person"></i> Username</div>
                                    <div class="detail-value">${userDetail.userName}</div>
                                </div>
                                <div class="detail-row">
                                    <div class="detail-label"><i class="bi bi-envelope"></i> Email</div>
                                    <div class="detail-value">${userDetail.userEmail}</div>
                                </div>
                                <div class="detail-row">
                                    <div class="detail-label"><i class="bi bi-shield-check"></i> Role</div>
                                    <div class="detail-value">
                                        <span class="badge bg-info text-dark badge-role">${userDetail.userRole}</span>
                                    </div>
                                </div>
                                <div class="detail-row">
                                    <div class="detail-label"><i class="bi bi-key"></i> Password</div>
                                    <div class="detail-value">
                                        <span class="badge bg-secondary me-2" style="font-size:0.75rem;">MD5</span>
                                        <span class="password-mask">
                                            <span id="pwd-hidden">••••••••••••••••</span>
                                            <span id="pwd-visible" class="password-text">${userDetail.userPass}</span>
                                            <span class="toggle-password" id="toggleBtn" onclick="togglePassword()">
                                                <i class="bi bi-eye" id="toggleIcon"></i>
                                            </span>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <c:if test="${empty userDetail}">
                        <div class="alert alert-warning text-center mt-4">
                            <i class="bi bi-exclamation-triangle fs-4 d-block mb-2"></i>
                            User not found.
                        </div>
                    </c:if>

                </div>
            </div>

            <script>
                function togglePassword() {
                    const hidden = document.getElementById('pwd-hidden');
                    const visible = document.getElementById('pwd-visible');
                    const icon = document.getElementById('toggleIcon');
                    if (hidden.style.display === 'none') {
                        hidden.style.display = 'inline';
                        visible.style.display = 'none';
                        icon.className = 'bi bi-eye';
                    } else {
                        hidden.style.display = 'none';
                        visible.style.display = 'inline';
                        icon.className = 'bi bi-eye-slash';
                    }
                }
            </script>

        </body>

        </html>