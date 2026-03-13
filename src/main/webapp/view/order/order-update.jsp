<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>

        <title>Edit Order</title>

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
                background: #22c55e;
                border: none;
                color: white;
                border-radius: 5px;
                cursor: pointer;
            }

            button:hover {
                background: #16a34a;
            }

            .form-group {
                margin-bottom: 20px;
            }
        </style>

    </head>

    <body>

        <div class="container">

            <h2>Edit Order</h2>

            <div class="card">

                <form action="order?action=edit" method="post">

                    <input type="hidden" name="id" value="${order.orderID}">

                    <div class="form-group">
                        <label>Date:</label>
                        <input type="text" name="date" value="${order.orderDate}" required>
                    </div>

                    <div class="form-group">
                        <label>Total Price:</label>
                        <input type="number" step="0.01" name="total" value="${order.orderTotal_price}" required>
                    </div>

                    <div class="form-group">
                        <label>Status:</label>
                        <select name="status">
                            <option value="Pending" ${order.orderStatus == 'Pending' ? 'selected' : ''}>Pending</option>
                            <option value="Completed" ${order.orderStatus == 'Completed' ? 'selected' : ''}>Completed</option>
                            <option value="Cancelled" ${order.orderStatus == 'Cancelled' ? 'selected' : ''}>Cancelled</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Customer:</label>
                        <select name="cusId">
                            <c:forEach items="${customers}" var="cus">
                                <option value="${cus.cusId}" ${cus.cusId == order.cusId.cusId ? 'selected' : ''}>${cus.cusName}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <button type="submit">Update</button>

                </form>

            </div>

        </div>

    </body>

    </html>