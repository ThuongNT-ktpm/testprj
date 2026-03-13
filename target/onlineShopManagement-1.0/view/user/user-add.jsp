<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>

        <title>Add User</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <style>
            body {
                background: #f5f7fa;
                font-family: Arial;
            }

            .form-box {
                width: 450px;
                margin: auto;
                margin-top: 80px;
                background: white;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            }
        </style>

    </head>

    <body>

        <div class="form-box">

            <h3 class="mb-4 text-center">Add User</h3>

            <form action="addUser" method="post">

                <div class="mb-3">
                    <label class="form-label">Username</label>
                    <input type="text" name="username" class="form-control">
                </div>

                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-control">
                </div>

                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <input type="password" name="password" class="form-control">
                </div>

                <div class="mb-3">
                    <label class="form-label">Role</label>

                    <select name="role" class="form-control">
                        <option value="Admin">Admin</option>
                        <option value="Staff">Staff</option>
                    </select>

                </div>

                <button class="btn btn-primary w-100">
                    Save
                </button>

            </form>

        </div>

    </body>

    </html>