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

                <h2>SUPPLIER LIST</h2>

                <a href="${pageContext.request.contextPath}/view/supplier/supplier-add.jsp" class="btn add-btn">Add
                    Supplier</a>

                <table>

                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Supplier Name</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>Action</th>
                        </tr>
                    </thead>

                    <tbody>

                        <tr>
                            <td>Apple Supplier</td>
                            <td>Vivo</td>
                            <td>fdssf</td>
                            <td>dfdf</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/view/supplier/supplier-update.jsp"
                                    class="btn edit">Edit</a>
                                <a href="#" class="btn delete">Delete</a>
                            </td>
                        </tr>

                        <tr>
                            <td>2</td>
                            <td>Samsung S23</td>
                            <td>900</td>
                            <td>15</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/view/supplier/supplier-update.jsp"
                                    class="btn edit">Edit</a>
                                <a href="#" class="btn delete">Delete</a>
                            </td>
                        </tr>

                        <tr>
                            <td>3</td>
                            <td>Oppo Reno</td>
                            <td>500</td>
                            <td>20</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/view/supplier/supplier-update.jsp"
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