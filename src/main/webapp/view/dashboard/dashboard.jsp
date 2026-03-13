<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Dashboard</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <style>
            body {
                background: #f5f7fa;
                font-family: Arial;
            }

            .header {
                background: #1f2937;
                color: white;
                padding: 15px;
                text-align: center;
                font-weight: bold;
                letter-spacing: 2px;
            }

            .sidebar {
                background: white;
                height: 100vh;
                border-right: 1px solid #eee;
                padding: 20px;
            }

            .sidebar a {
                display: block;
                padding: 10px;
                text-decoration: none;
                color: #333;
                border-radius: 5px;
                margin-bottom: 5px;
            }

            .sidebar a:hover {
                background: #e2e8f0;
            }

            .card-box {
                background: white;
                padding: 20px;
                border-radius: 10px;
                text-align: center;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
            }

            .card-title {
                font-size: 18px;
                font-weight: bold;
            }

            .card-number {
                font-size: 28px;
                color: #2563eb;
            }
        </style>
    </head>

    <body>

        <div class="header">
            ONLINE SHOP MANAGEMENT
        </div>

        <div class="container-fluid">
            <div class="row">


                <div class="col-2 sidebar">

                    <h6>MENU</h6>

                    <a href="#">Home</a>
                    <a href="${pageContext.request.contextPath}/view/user/user-list.jsp">Users</a>
                    <a href="${pageContext.request.contextPath}/view/product/product-list.jsp">Products</a>
                    <a href="${pageContext.request.contextPath}/view/category/category-list.jsp">Categories</a>
                    <a href="${pageContext.request.contextPath}/view/customer/customer-list.jsp">Customers</a>
                    <a href="${pageContext.request.contextPath}/view/order/order-list.jsp">Order</a>
                    <a href="${pageContext.request.contextPath}/view/supplier/supplier-list.jsp">Supplier</a>

                </div>


                <div class="col-10 p-4">

                    <h4>Welcome Admin</h4>

                    <div class="row mt-4">

                        <div class="col-md-3">
                            <div class="card-box">
                                <div class="card-title">Products</div>
                                <div class="card-number">120</div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="card-box">
                                <div class="card-title">Customers</div>
                                <div class="card-number">80</div>
                            </div>
                        </div>

                    </div>

                    <div class="row mt-4">

                        <div class="col-md-3">
                            <div class="card-box">
                                <div class="card-title">Orders</div>
                                <div class="card-number">45</div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="card-box">
                                <div class="card-title">Categories</div>
                                <div class="card-number">10</div>
                            </div>
                        </div>

                    </div>

                </div>

            </div>
        </div>

    </body>

</html>