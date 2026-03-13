<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>

        <title>Product List</title>

        <style>
            body {
                background: #0f172a;
                font-family: Consolas, monospace;
                color: white;
            }

            .container {
                width: 800px;
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
                text-align: center;
                margin-bottom: 30px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            th,
            td {
                padding: 10px;
                border-bottom: 1px solid #475569;
            }

            th {
                text-align: left;
            }

            .btn {
                padding: 6px 12px;
                text-decoration: none;
                border-radius: 5px;
            }

            .add-btn {
                display: inline-block;
                margin-bottom: 20px;
                background: #2563eb;
                color: white;
            }

            .edit {
                background: #facc15;
                color: black;
            }

            .delete {
                background: #ef4444;
                color: white;
            }
        </style>

    </head>

    <body>

        <div class="container">

            <div class="card">

                <h2>CATEGORY LIST</h2>

                <a href="${pageContext.request.contextPath}/view/category/category-add.jsp" class="btn add-btn">Add
                    Category</a>

                <table>

                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Category Name</th>
                            <th>Description</th>
                            <th>Action</th>
                        </tr>
                    </thead>

                    <tbody>

                        <tr>
                            <td>1</td>
                            <td>iPhone 15</td>
                            <td>10</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/view/category/category-update.jsp"
                                    class="btn edit">Edit</a>
                                <a href="#" class="btn delete">Delete</a>
                            </td>
                        </tr>

                        <tr>
                            <td>2</td>
                            <td>Samsung S23</td>
                            <td>15</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/view/category/category-update.jsp"
                                    class="btn edit">Edit</a>
                                <a href="#" class="btn delete">Delete</a>
                            </td>
                        </tr>

                        <tr>
                            <td>3</td>
                            <td>Oppo Reno</td>
                            <td>20</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/view/category/category-update.jsp"
                                    class="btn edit">Edit</a>
                                <a href="#" class="btn delete">Delete</a>
                            </td>
                        </tr>

                    </tbody>

                </table>

            </div>

        </div>

    </body>

    </html>