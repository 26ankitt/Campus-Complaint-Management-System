# Campus Complaint Management System

A simple Java Servlet, JSP, JDBC, and MySQL web application for managing campus complaints. Students can register, login, submit complaints, and track status. Admins can view all complaints and update status with a response.

## Features

- Student registration and login
- Admin and student dashboards
- Submit complaints by category and priority
- Student complaint tracking with admin response
- Admin complaint list, details, status update, and response
- Session-based authorization

## Tech Stack

Java, Java Servlets (`javax.servlet`), JSP, JDBC, MySQL, Maven, Apache Tomcat 9, HTML, CSS, JavaScript.

## Project Structure

```text
src/main/java/com/campuscomplaint
  dao/        JDBC database access
  model/      User and Complaint classes
  servlet/    Web request handling
  util/       DBConnection
src/main/webapp
  *.jsp       JSP pages
  css/        CSS
  js/         JavaScript
database.sql  MySQL schema and sample data
```

## Requirements

- JDK 8 or newer
- Maven
- MySQL
- Apache Tomcat 9

## MySQL Setup

1. Start MySQL.
2. Run:

```bash
mysql -u root -p < database.sql
```

3. Edit database credentials in:

```text
src/main/java/com/campuscomplaint/util/DBConnection.java
```

Default values:

```text
URL: jdbc:mysql://localhost:3306/campus_complaint
Username: root
Password: root
```

## Build

```bash
mvn clean package
```

The WAR file is created at:

```text
target/campus-complaint-system.war
```

## Run on Tomcat 9

1. Copy `target/campus-complaint-system.war` to Tomcat `webapps`.
2. Start Tomcat.
3. Open:

```text
http://localhost:8080/campus-complaint-system/
```

## Sample Credentials

Admin:

```text
Email: admin@campus.com
Password: admin123
```

Student:

```text
Email: student@campus.com
Password: student123
```

## Git/GitHub

```bash
git init
git add .
git commit -m "Initial campus complaint system"
git branch -M main
git remote add origin <your-repository-url>
git push -u origin main
```

## Common Errors

- `Access denied for user`: update username/password in `DBConnection.java`.
- `Unknown database`: run `database.sql`.
- `ClassNotFoundException com.mysql.cj.jdbc.Driver`: rebuild with Maven and deploy the generated WAR.
- 404 page: confirm WAR name and URL path.
- Tomcat error with Jakarta imports: use Tomcat 9, not Tomcat 10.