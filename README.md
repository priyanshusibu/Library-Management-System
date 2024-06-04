<h1>Library Management System</h1>
<h2>Overview</h2>
The Library Management System is a comprehensive web application designed to streamline the process of book issuance and management for a library. The system includes functionalities for both students and administrators, making it easy to manage book inventories and handle book lending.

<h2>Features</h2>
Student Section<br>
Registration and Login: Students can register and log in to their accounts.<br>
Book Issuance: Students can issue books.<br>
Real-time Availability: Students can view the real-time availability of books.<br>
Admin Section<br>
Librarian Management: Admins can add librarians.<br>
Inventory Management: Librarians can manage book inventory, including issuing and returning books.<br>
Technology Stack<br>
Frontend: HTML, CSS, JavaScript<br>
Backend: JSP (Java Server Pages), Apache Tomcat<br>
Database: MySQL<br>
Database Connectivity: JDBC (Java Database Connectivity)<br>
Build and Deploy:<br>

Build the project using your preferred IDE Eclipse.<br>
Deploy the application on Apache Tomcat.<br>
Database Schema<br>
Tables:<br>
student (id, name, email, password, etc.)<br>
e_books (id, title, author, availability, etc.)<br>
e_librarians (id, name, email, password, etc.)<br>
issued_books (id, student_id, book_id, issue_date, return_date, etc.)<br>
Acknowledgments<br>
A big thank you to my mentor for his guidance and support throughout this project.<br>
