<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Supplier</title>

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
            max-width: 600px;
        }

        .form-label {
            font-weight: 500;
            color: var(--secondary);
            margin-bottom: 8px;
        }

        .form-control {
            padding: 10px 15px;
            border-radius: 6px;
            border: 1px solid var(--border);
            box-shadow: none;
            transition: all 0.2s;
        }

        .form-control:focus {
            border-color: var(--accent);
            box-shadow: 0 0 0 0.25rem rgba(52, 152, 219, 0.25);
        }
        
        .form-control[readonly] {
            background-color: #e9ecef;
            cursor: not-allowed;
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
        <a href="${pageContext.request.contextPath}/order"><i class="bi bi-cart-check"></i> Orders</a>
        <a href="${pageContext.request.contextPath}/supplier" class="active"><i class="bi bi-truck"></i> Suppliers</a>
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
                    <a href="${pageContext.request.contextPath}/supplier" class="text-secondary text-decoration-none">
                        <i class="bi bi-arrow-left-circle me-2"></i>
                    </a>
                    Update Supplier Info
                </h4>
            </div>

            <div class="card-box">
                <div class="form-container">
                    
                    <form action="${pageContext.request.contextPath}/supplier" method="post">
                        <input type="hidden" name="action" value="update">

                        <div class="mb-4">
                            <label class="form-label"><i class="bi bi-hash text-secondary me-1"></i> Supplier ID</label>
                            <input type="text" name="supId" class="form-control" value="${listUpdate.supId}" readonly>
                            <div class="form-text text-muted small mt-1">ID is auto-generated and cannot be modified.</div>
                        </div>

                        <div class="mb-4">
                            <label class="form-label"><i class="bi bi-building text-secondary me-1"></i> Supplier Name <span class="text-danger">*</span></label>
                            <input type="text" name="supName" class="form-control" value="${listUpdate.supName}" required>
                        </div>

                        <div class="mb-4">
                            <label class="form-label"><i class="bi bi-telephone text-secondary me-1"></i> Phone Number <span class="text-danger">*</span></label>
                            <input type="text" name="supPhone" class="form-control" value="${listUpdate.supPhone}" required>
                        </div>

                        <div class="mb-4">
                            <label class="form-label"><i class="bi bi-geo-alt text-secondary me-1"></i> Address <span class="text-danger">*</span></label>
                            <input type="text" name="supAddress" class="form-control" value="${listUpdate.supAddress}" required>
                        </div>

                        <div class="mb-4">
                            <label class="form-label"><i class="bi bi-envelope text-secondary me-1"></i> Email <span class="text-danger">*</span></label>
                            <input type="email" name="supEmail" class="form-control" value="${listUpdate.supEmail}" required>
                        </div>

                        <hr class="mt-5 mb-4 border-secondary opacity-25">

                        <div class="d-flex gap-3">
                            <button type="submit" class="btn btn-warning px-4 text-dark fw-medium">
                                <i class="bi bi-pencil-square me-1"></i> Save Updates
                            </button>
                            <a href="${pageContext.request.contextPath}/supplier" class="btn btn-light border px-4">
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