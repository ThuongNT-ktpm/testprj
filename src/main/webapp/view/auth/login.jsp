<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <title>Online Shop Management</title>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <style>
            body {
                background: linear-gradient(135deg, #f8fafc, #e2e8f0);
                height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                font-family: Arial;
            }

            .container-box {
                width: 850px;
                background: white;
                border-radius: 10px;
                box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
                padding: 40px;
            }

            .title {
                text-align: center;
                font-weight: bold;
                margin-bottom: 30px;
                letter-spacing: 2px;
            }

            .left-box {
                border-right: 1px solid #eee;
                padding: 30px;
            }

            .left-box h4 {
                font-weight: bold;
            }

            .login-btn {
                width: 100%;
            }
        </style>
    </head>

    <body>

        <div class="container-box">

            <h3 class="title">ONLINE SHOP MANAGEMENT</h3>

            <div class="row">

                <!-- LEFT -->
                <div class="col-md-6 left-box">

                    <h4>Manage Your Store</h4>
                    <p class="text-muted">
                        
                        <img src="../../images/franky.jpg" alt="" height="350" width="350"/>
                    </p>
                   

                </div>

                <!-- RIGHT -->
                <div class="col-md-6">

                    <h5 class="mb-4 text-center">Login</h5>

                    <form action="${pageContext.request.contextPath}/login" method="post">

                        <div class="mb-3">
                            <label class="form-label">Username</label>
                            <input type="text" class="form-control" name="name">
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" class="form-control" name="password">
                        </div>

                        <button type="submit" class="btn btn-primary login-btn">
                            Login
                        </button>

                        <p class="text-danger mt-2 text-center">
                            ${wrong}
                        </p>

                    </form>

                </div>

            </div>

        </div>

    </body>

    </html>