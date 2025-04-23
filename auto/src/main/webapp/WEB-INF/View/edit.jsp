<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Student Info</title>

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
            max-width: 600px;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
        }

        h2 {
            margin-bottom: 30px;
        }

        .btn-custom {
            width: 100%;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 style="color:black ; text-align:Center; font-weight:bold;">Edit Student Information</h2>
    
    <form action="/update" method="post">
        <input type="hidden" name="id" value="${student.id}" />

        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" class="form-control" name="name" value="${student.name}" required />
        </div>

        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" class="form-control" name="email" value="${student.email}" required />
        </div>

        <div class="form-group">
            <label for="contactno">Contact Number:</label>
            <input type="text" class="form-control" name="contactno" value="${student.contactno}" required pattern="[0-9]{10}" title="Enter 10 digit number" />
        </div>

        <div class="form-group">
            <label for="course">Course:</label>
            <input type="text" class="form-control" name="course" value="${student.course}" required />
        </div>

        <button type="submit" class="btn btn-primary btn-custom">Update</button>
    </form>
</div>

</body>
</html>
