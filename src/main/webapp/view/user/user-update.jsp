<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>

        <title>Add User</title>

        <style>
            body {
                background: #0f172a;
                font-family: Consolas, monospace;
                color: white;
            }

            .container {
                width: 500px;
                margin: auto;
                margin-top: 80px;
            }

            .card {
                background: #020617;
                padding: 40px;
                border-radius: 15px;
                border: 1px solid #334155;
            }

            h2 {
                margin-bottom: 30px;
            }

            label {
                display: inline-block;
                width: 100px;
            }

            input,
            select {
                background: #0f172a;
                border: 1px solid #475569;
                padding: 6px;
                color: white;
                width: 200px;
            }

            button {
                margin-top: 20px;
                padding: 8px 20px;
                background: #2563eb;
                border: none;
                color: white;
                border-radius: 5px;
                cursor: pointer;
            }

            button:hover {
                background: #1d4ed8;
            }

            .form-group {
                margin-bottom: 20px;
            }
        </style>

    </head>

    <body>

        <div class="container">

            <h2>Add User</h2>

            <div class="card">

                <form action="addUser" method="post">

                    <div class="form-group">
                        <label>Username:</label>
                        <input type="text" name="username">
                    </div>

                    <div class="form-group">
                        <label>Email:</label>
                        <input type="email" name="email">
                    </div>

                    <div class="form-group">
                        <label>Password:</label>
                        <input type="password" name="password">
                    </div>

                    <div class="form-group">
                        <label>Role:</label>

                        <select name="role">
                            <option value="Admin">Admin</option>
                            <option value="Staff">Staff</option>
                        </select>

                    </div>

                    <button type="submit">Save</button>

                </form>

            </div>

        </div>

    </body>

    </html>