<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Login</title>
    <link rel="stylesheet" href="old_student_css.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&display=swap" rel="stylesheet">
    <script>
        function openModal(type) {
            document.getElementById(type + '-modal').style.display = 'block';
        }

        function closeModal(type) {
            document.getElementById(type + '-modal').style.display = 'none';
        }

        window.onclick = function (event) {
            if (event.target.classList.contains('modal')) {
                event.target.style.display = 'none';
            }
        }

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
        <div class="login-container">
            <div class="login-form">
                <h1>Student Login</h1>
                <form action="StudentLogin" method="post">
                    <div class="input-group">
                        <label for="card-id">Library Card ID</label>
                        <input type="text" id="card-id" name="card-id" required>
                    </div>
                    <div class="input-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    <div class="input-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" required>
                    </div>
                    <input type="submit" value="Login">
                    <p class="register-link">Forgot password ? <a href="#" onclick="openModal('user')">Update</a></p>
                    <br>
                    <p class="login-link">New Student ? <a href="new_student.jsp">Login here</a></p>
                </form>
            </div>
        </div>
        <div class="content-container">
            <div class="content">
                <h1 id="dynamic-heading">Welcome to Library !!!</h1>
                <p id="dynamic-content"></p>
            </div>
        </div>
    </div>

    <div id="user-modal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal('user')">&times;</span>
            <h3>Update Password</h3>
            <form action="UpdatePassword" method="post">
                <div class="input-group">
                    <label for="user-card-no">Card No:</label>
                    <input type="text" id="user-card-no" name="card-no" required>
                </div>
                <div class="input-group">
                    <label for="user-old-password">Old Password</label>
                    <input type="password" id="user-old-password" name="old-password" required>
                </div>
                <div class="input-group">
                    <label for="user-new-password">New Password</label>
                    <input type="password" id="user-new-password" name="new-password" required>
                </div>
                <input type="submit" value="UPDATE">
            </form>
        </div>
    </div>

    <script src="script.js"></script> 
</body>

</html>
