<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

                <h2>ORDER LIST</h2>

                <a href="order?action=add" class="btn add-btn">Add Order</a>

                <table>

                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Customer</th>
                            <th>Date</th>
                            <th>Total</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach items="${list}" var="o">
                            <tr>
                                <td>${o.orderID}</td>
                                <td>${o.cusId.cusName}</td>
                                <td>${o.orderDate}</td>
                                <td>${o.orderTotal_price}</td>
                                <td>${o.orderStatus}</td>
                                <td>
                                    <a href="order?action=edit&id=${o.orderID}" class="btn edit">Edit</a>
                                    <a href="order?action=delete&id=${o.orderID}" class="btn delete" onclick="return confirm('Are you sure?')">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>

                </table>

            </div>

        </div>

    </body>

    </html>