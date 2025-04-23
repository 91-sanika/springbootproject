<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Students</title>

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
            margin-bottom: 20px;
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

        .btn-action {
            margin: 0 3px;
        }

        .register-link {
            display: block;
            text-align: right;
            margin-bottom: 15px;
        }

        .register-link a {
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 style="color:white ; text-align:Center; font-weight:bold;">All Students</h2>

    <div class="register-link">
        <a href="/register" class="btn btn-success">+ Register New Student</a>
    </div>

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
            <c:forEach items="${students}" var="student">
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
                            <c:otherwise>
                                <span class="label label-warning">Pending</span>
                            </c:otherwise>
                        </c:choose>
                        
                    </td>
                    <td>
                        <a href="/edit/${student.id}" class="btn btn-primary btn-xs btn-action">Edit</a>
                        <a href="/delete/${student.id}" class="btn btn-danger btn-xs btn-action">Delete</a>
                    </td>
                </tr>
                
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
