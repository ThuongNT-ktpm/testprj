<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>

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
            --purple: #9b59b6;
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

        /* --- Dashboard Cards --- */
        .dashboard-wrapper {
            padding: 30px;
        }

        .page-title {
            font-weight: 600;
            color: var(--primary);
            margin-bottom: 25px;
        }

        .card-box {
            background: var(--surface);
            padding: 25px 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.03);
            display: flex;
            align-items: center;
            justify-content: space-between;
            transition: transform 0.2s, box-shadow 0.2s;
            border: 1px solid rgba(0,0,0,0.05);
            height: 100%;
        }

        .card-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 15px rgba(0,0,0,0.08);
        }

        .card-info {
            display: flex;
            flex-direction: column;
        }

        .card-title {
            color: var(--text-muted);
            font-size: 0.9rem;
            text-transform: uppercase;
            font-weight: 600;
            letter-spacing: 0.5px;
            margin-bottom: 5px;
        }

        .card-number {
            color: var(--primary);
            font-size: 2rem;
            font-weight: 700;
            line-height: 1;
        }

        .card-icon {
            font-size: 2.5rem;
            opacity: 0.8;
        }

        /* Colored Borders & Icons for Specific Cards */
        .border-blue { border-left: 5px solid var(--accent); }
        .text-blue { color: var(--accent); }

        .border-green { border-left: 5px solid var(--success); }
        .text-green { color: var(--success); }

        .border-purple { border-left: 5px solid var(--purple); }
        .text-purple { color: var(--purple); }

        .border-yellow { border-left: 5px solid var(--warning); }
        .text-yellow { color: var(--warning); }
        
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
        
        <a href="#" class="active"><i class="bi bi-speedometer2"></i> Dashboard</a>
        <a href="${pageContext.request.contextPath}/user"><i class="bi bi-people"></i> Users</a>
        <a href="${pageContext.request.contextPath}/product"><i class="bi bi-box-seam"></i> Products</a>
        <a href="${pageContext.request.contextPath}/category"><i class="bi bi-tags"></i> Categories</a>
        <a href="${pageContext.request.contextPath}/customer"><i class="bi bi-person-lines-fill"></i> Customers</a>
        <a href="${pageContext.request.contextPath}/order"><i class="bi bi-cart-check"></i> Orders</a>
        <a href="${pageContext.request.contextPath}/supplier"><i class="bi bi-truck"></i> Suppliers</a>
    </div>

    <div class="main-content">
        
        <nav class="top-navbar">
            <div class="d-none d-md-block">
                </div>
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

        <div class="dashboard-wrapper">
            <h4 class="page-title">Dashboard Overview</h4>

            <div class="row g-4">
                
                <div class="col-12 col-sm-6 col-xl-3">
                    <div class="card-box border-blue">
                        <div class="card-info">
                            <span class="card-title">Products</span>
                            <span class="card-number">${totalProducts}</span>
                        </div>
                        <i class="bi bi-box-seam card-icon text-blue"></i>
                    </div>
                </div>

                <div class="col-12 col-sm-6 col-xl-3">
                    <div class="card-box border-green">
                        <div class="card-info">
                            <span class="card-title">Customers</span>
                            <span class="card-number">${totalCustomers}</span>
                        </div>
                        <i class="bi bi-people card-icon text-green"></i>
                    </div>
                </div>

                <div class="col-12 col-sm-6 col-xl-3">
                    <div class="card-box border-purple">
                        <div class="card-info">
                            <span class="card-title">Orders</span>
                            <span class="card-number">${totalOrders}</span>
                        </div>
                        <i class="bi bi-cart-check card-icon text-purple"></i>
                    </div>
                </div>

                <div class="col-12 col-sm-6 col-xl-3">
                    <div class="card-box border-yellow">
                        <div class="card-info">
                            <span class="card-title">Categories</span>
                            <span class="card-number">${totalCategories}</span>
                        </div>
                        <i class="bi bi-tags card-icon text-yellow"></i>
                    </div>
                </div>

            </div>
            
            </div>
    </div>

</body>
</html>