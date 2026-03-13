<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>

        <title>User List</title>

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

            .container-box {
                background: white;
                padding: 30px;
                margin-top: 40px;
                border-radius: 10px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            }
        </style>

    </head>

    <body>

        <div class="header">
            ONLINE SHOP MANAGEMENT
        </div>

        <div class="container">

            <div class="container-box">

                <h3 class="mb-4 text-center">USER LIST</h3>

                <a href="${pageContext.request.contextPath}/view/user/user-add.jsp" class="btn btn-primary mb-3">
                    + Add User
                </a>

                <table class="table table-bordered table-hover">

                    <thead class="table-dark">

                        <tr>
                            <th>ID</th>
                            <th>Username</th>
                            <th>Email</th>
                            <th>Role</th>
                            <th>Action</th>
                        </tr>

                    </thead>

                    <tbody>

                        <tr>
                            <td>1</td>
                            <td>admin</td>
                            <td>admin@mail.com</td>
                            <td>Admin</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/view/user/user-update.jsp"
                                    class="btn btn-warning btn-sm">Edit</a>
                                <a href="#" class="btn btn-danger btn-sm">Delete</a>
                            </td>
                        </tr>

                        <tr>
                            <td>2</td>
                            <td>john</td>
                            <td>john@mail.com</td>
                            <td>Staff</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/view/user/user-update.jsp"
                                    class="btn btn-warning btn-sm">Edit</a>
                                <a href="#" class="btn btn-danger btn-sm">Delete</a>
                            </td>
                        </tr>

                        <tr>
                            <td>3</td>
                            <td>anna</td>
                            <td>anna@mail.com</td>
                            <td>Staff</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/view/user/user-update.jsp"
                                    class="btn btn-warning btn-sm">Edit</a>
                                <a href="#" class="btn btn-danger btn-sm">Delete</a>
                            </td>
                        </tr>

                    </tbody>

                </table>

            </div>

        </div>

    </body>

    </html>