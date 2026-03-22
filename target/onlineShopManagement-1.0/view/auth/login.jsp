<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - Online Shop</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

    <style>
        :root {
            --primary: #2C3E50;
            --secondary: #34495E;
            --bg-light: #F4F7F6;
            --surface: #FFFFFF;
            --text-main: #333333;
            --accent: #3498DB;
            --danger: #E74C3C;
        }

        body {
            background-color: var(--bg-light);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: var(--text-main);
            margin: 0;
            /* Căn giữa toàn bộ nội dung trên màn hình */
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        .login-card {
            background: var(--surface);
            width: 100%;
            max-width: 420px;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.05);
            border: 1px solid rgba(0, 0, 0, 0.05);
        }

        .brand-icon {
            font-size: 3.5rem;
            color: var(--primary);
            line-height: 1;
        }

        .login-title {
            color: var(--primary);
            font-weight: 700;
            letter-spacing: 1px;
            margin-top: 10px;
            margin-bottom: 5px;
        }

        .login-subtitle {
            color: #7f8c8d;
            font-size: 0.95rem;
            margin-bottom: 30px;
        }

        .form-label {
            font-weight: 600;
            color: var(--secondary);
            font-size: 0.9rem;
        }

        .input-group-text {
            background-color: transparent;
            color: var(--secondary);
            border-right: none;
        }

        .form-control {
            border-left: none;
            padding: 12px 15px 12px 0;
        }

        .form-control:focus {
            box-shadow: none;
            border-color: #dee2e6;
        }

        /* Tạo hiệu ứng viền màu xanh khi focus vào input group */
        .input-group:focus-within {
            box-shadow: 0 0 0 0.25rem rgba(52, 152, 219, 0.25);
            border-radius: 0.375rem;
        }
        .input-group:focus-within .input-group-text,
        .input-group:focus-within .form-control {
            border-color: var(--accent);
        }

        .btn-login {
            background-color: var(--primary);
            border: none;
            padding: 12px;
            font-weight: 600;
            letter-spacing: 0.5px;
            transition: all 0.3s;
        }

        .btn-login:hover {
            background-color: var(--accent);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.3);
        }
    </style>
</head>

<body>

    <div class="login-card">
        <div class="text-center">
            <i class="bi bi-shop brand-icon"></i>
            <h3 class="login-title">ONLINE SHOP</h3>
            <p class="login-subtitle">Sign in to start your session</p>
        </div>

        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger d-flex align-items-center py-2 px-3 mb-4" role="alert">
                <i class="bi bi-exclamation-triangle-fill me-2"></i>
                <div style="font-size: 0.9rem;">
                    ${error}
                </div>
            </div>
        <% } %>

        <form method="post" action="${pageContext.request.contextPath}/login">
            
            <div class="mb-3">
                <label for="u_id" class="form-label">Username</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="bi bi-person"></i></span>
                    <input type="text" class="form-control" name="user" id="u_id" required placeholder="Enter username">
                </div>
            </div>

            <div class="mb-4">
                <label for="u_pwd" class="form-label">Password</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="bi bi-lock"></i></span>
                    <input type="password" class="form-control" name="pass" id="u_pwd" required placeholder="Enter password">
                </div>
            </div>

            <button type="submit" class="btn btn-primary w-100 btn-login">
                LOGIN
            </button>

            <div class="text-center mt-4">
                <a href="#" class="text-decoration-none text-muted" style="font-size: 0.85rem;">
                    <i class="bi bi-arrow-left me-1"></i> Back to Store
                </a>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>