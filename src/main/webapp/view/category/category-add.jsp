<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>

        <title>Add Product</title>

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

            <h2>Add Product</h2>

            <div class="card">

                <form action="addProduct" method="post">

                    <div class="form-group">
                        <label>Name:</label>
                        <input type="text" name="name">
                    </div>

                    <div class="form-group">
                        <label>Price:</label>
                        <input type="number" name="price">
                    </div>

                    <div class="form-group">
                        <label>Quantity:</label>
                        <input type="number" name="quantity">
                    </div>

                    <div class="form-group">
                        <label>Category:</label>

                        <select name="category_id">
                            <option value="1">Phone</option>
                            <option value="2">Laptop</option>
                            <option value="3">Accessories</option>
                            <option value="4">Tablet</option>
                            <option value="5">Smart Watch</option>
                        </select>

                    </div>

                    <button type="submit">Save</button>

                </form>

            </div>

        </div>

    </body>

    </html>