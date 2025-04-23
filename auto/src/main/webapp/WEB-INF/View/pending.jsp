<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Pending Students</title>

    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            }

        body {
            background-image: url('${pageContext.request.contextPath}/images/background.jpeg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            font-family: Arial, sans-serif;
        }


        .container {
            margin-top: 50px;
        }

        h2 {
            margin-bottom: 30px;
        }

        table {
            background-color: white;
        }

        th {
            background-color: #3498db;
            color: white;
            text-align: center;
        }

        td {
            text-align: center;
            vertical-align: middle;
        }

        .btn-sm {
            padding: 5px 12px;
        }

        .btn-approve {
            background-color: #27ae60;
            color: white;
            border: none;
        }

        .btn-reject {
            background-color: #e74c3c;
            color: white;
            border: none;
        }

        .btn-approve:hover {
            background-color: #219150;
        }

        .btn-reject:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>

<div class="container">
   <h2 style="color: white; font-weight: bold;text-align: center;">Pending Students</h2>


    <table class="table table-bordered table-hover">
        <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Contact No</th>
                <th>Course</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="student" items="${students}">
                <tr>
                    <td>${student.name}</td>
                    <td>${student.email}</td>
                    <td>${student.contactno}</td>
                    <td>${student.course}</td>
                    <td>
                    
                        <c:choose>
                            <c:when test="${student.status == 'Approved'}">
                                <span class="label label-success">Approved</span>
                            </c:when>
                            <c:when test="${student.status == 'Rejected'}">
                                <span class="label label-danger">Rejected</span>
                            </c:when>
                            <c:otherwise>
                                <span class="label label-warning">Pending</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/approve/${student.id}" class="btn btn-approve btn-sm">Approve</a>
                        <a href="${pageContext.request.contextPath}/admin/reject/${student.id}" class="btn btn-reject btn-sm">Reject</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
