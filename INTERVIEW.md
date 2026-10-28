# Campus Complaint Management System Interview Notes

## Key Concepts

- Java: Main programming language used for models, DAO classes, and servlets.
- Servlet: Java class that handles HTTP requests and responses.
- JSP: View page used to display forms, tables, and messages.
- JDBC: Java API used to connect to MySQL and run SQL queries.
- MySQL: Database used to store users and complaints.
- Maven: Build tool used to manage dependencies and create the WAR file.
- Tomcat: Servlet container used to run the web application.
- MVC: Model stores data, View displays JSP pages, Controller uses servlets.
- DAO: Data Access Object. It keeps database code separate from servlets and JSP.
- HttpSession: Stores logged-in user details between requests.
- GET vs POST: GET is used to fetch pages/data. POST is used for form submissions and updates.
- PreparedStatement: Safer way to run SQL with parameters and reduce SQL injection risk.
- CRUD: Create, Read, Update, Delete database operations.
- Primary key: Unique row identifier, such as `users.id`.
- Foreign key: Links one table to another, such as `complaints.user_id`.

## Flows

Login flow: User submits email/password, `LoginServlet` calls `UserDAO`, session is created, user is redirected by role.

Complaint submission flow: Student submits form, `SubmitComplaintServlet` gets user ID from session, `ComplaintDAO` inserts complaint with `SUBMITTED` status.

Admin update flow: Admin opens complaint details, changes status/response, `UpdateComplaintServlet` updates the complaint.

## Likely Questions

1. What is the purpose of this project?
   It helps students submit and track campus complaints while admins manage and resolve them.

2. Why did you use servlets?
   Servlets handle requests, process form data, call DAO methods, and decide which JSP to show.

3. Why should SQL not be written in JSP?
   JSP should focus on display. Keeping SQL in DAO classes makes code cleaner and easier to maintain.

4. What is the role of `DBConnection`?
   It creates JDBC connections to the MySQL database.

5. What is a DAO?
   A DAO class contains database operations for a specific model.

6. How is login maintained?
   Login is maintained using `HttpSession` attributes like `userId`, `userName`, and `role`.

7. How do you prevent students from seeing other complaints?
   The detail servlet checks that the complaint `user_id` matches the logged-in student's ID.

8. Why use `PreparedStatement`?
   It safely passes values to SQL queries and helps prevent SQL injection.

9. What is the difference between admin and student?
   Students submit and view their own complaints. Admins view all complaints and update status.

10. What is a WAR file?
    A packaged Java web application that can be deployed to Tomcat.

11. What is a foreign key?
    A field that links records between tables, such as complaint owner to user.

12. What happens on logout?
    The session is invalidated and the user is redirected to login.

13. Why is Tomcat 9 required?
    This project uses `javax.servlet`, which is compatible with Tomcat 9.

14. How is duplicate registration handled?
    `UserDAO.emailExists()` checks the email before inserting a new student.

15. How is complaint status updated?
    Admin submits a status and response, then `ComplaintDAO.updateComplaint()` updates the database.
