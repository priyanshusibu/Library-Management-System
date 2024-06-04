<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration</title>
    <link rel="stylesheet" href="new_student_css.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var dynamicContent = document.getElementById('dynamic-content');
            var dynamicHeading = document.getElementById('dynamic-heading');

            // Array of dynamic content
            var contentArray = [
                "A library is more than just a repository of books; it’s a sanctuary for the curious mind. Whether nestled in a bustling city or tucked away in a quiet corner, libraries serve as gateways to knowledge, imagination, and exploration.",
                "Books and Beyond: Within their walls, you’ll find a treasure trove of books, periodicals, and sometimes even films and music. Libraries house collections that span genres, languages, and centuries, making them invaluable resources for researchers, students, and avid readers.",
                "Community Hubs: Beyond the shelves, libraries foster a sense of community. They host events, workshops, and discussions, bringing people together to share ideas and learn from one another."
            ];

            // Function to generate random content
            function generateRandomContent() {
                var randomIndex = Math.floor(Math.random() * contentArray.length);
                dynamicContent.textContent = contentArray[randomIndex];
            }

            // Generate dynamic content on page load
            generateRandomContent();

            // Update dynamic content every 5 seconds
            setInterval(generateRandomContent, 5000);
        });

    </script>
</head>

<body>
    <div class="a">
        <div class="registration-container">
            <div class="registration-form">
                <h1>Student Registration</h1>
                <form action="student_get.jsp" >
                    <div class="input-group">
                        <label for="name">Name</label>
                        <input type="text" id="name" name="name" required>
                    </div>
                    <div class="input-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    <div class="input-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" required>
                    </div>
                    <div class="input-group">
                        <label for="confirm-password">Confirm Password</label>
                        <input type="password" id="confirm-password" name="confirm-password" required>
                    </div>
                    <button type="submit">Register</button>
                   <!-- <input type="submit" value="submiy"/> -->
                    <p class="login-link">Already registered? <a href="oldstudentlogin.jsp">Login here</a></p>
                </form>
            </div>
        </div>
        <div class="content-container">
            <div class="content">
                <h1 id="dynamic-heading">Welcome to Library !!!</h1> <!-- Updated heading -->
                <p id="dynamic-content"></p>
            </div>
        </div>
    </div>

    <script src="script.js"></script> <!-- Include your JavaScript file -->
</body>

</html>
