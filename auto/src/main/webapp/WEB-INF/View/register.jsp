<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Student Registration</title>

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
            background-attachment: fixed;
            font-family: Arial, sans-serif;
        }

        .form-wrapper {
            width: 40%;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 30px;
            margin: 50px 0 50px 50px; 
            border-radius: 15px;
        }

        .form-wrapper h2 {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="form-wrapper">
        <h2 style="color: black; font-weight: bold;text-align: center;">Student Registration Form</h2>

        <form action="/register" method="post">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" class="form-control" name="name" required pattern="[A-Za-z\s]+" title="Only letters are allowed">
            </div>

            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" name="email" required pattern="[A-Za-z0-9._%+-]+@gmail\.com" title="Enter a valid Gmail address">
            </div>

            <div class="form-group">
                <label for="contactno">Contact Number:</label>
                <input type="text" class="form-control" name="contactno" required pattern="[0-9]{10}" title="Only 10 digit number">
            </div>

            <div class="form-group">
                <label for="course">Course:</label>
                <input type="text" class="form-control" name="course">
            </div>

            <button type="submit" class="btn btn-primary btn-block">Register</button>
        </form>
    </div>
</body>
</html>
