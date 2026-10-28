# Testing

| Test Case | Input | Expected Result | Status |
| --------- | ----- | --------------- | ------ |
| Registration | New student name, email, password | Student account is created and login page shows success | To Be Tested |
| Duplicate email | Register with existing email | Error message says email is already registered | To Be Tested |
| Invalid login | Wrong email or password | Login page shows invalid login message | To Be Tested |
| Valid student login | `student@campus.com` / `student123` | Student dashboard opens | To Be Tested |
| Complaint submission | Valid title, description, category, priority | Complaint is saved with `SUBMITTED` status | To Be Tested |
| Empty complaint | Submit blank required field | Error or browser validation prevents submission | To Be Tested |
| Student complaint list | Logged-in student opens My Complaints | Only that student's complaints are displayed | To Be Tested |
| Student unauthorized complaint access | Student changes URL to another complaint ID | Student is redirected with unauthorized access message | To Be Tested |
| Admin login | `admin@campus.com` / `admin123` | Admin dashboard opens | To Be Tested |
| Admin complaint list | Admin opens All Complaints | All complaints are displayed | To Be Tested |
| Admin status update | Admin changes status and response | Complaint status and admin response are updated | To Be Tested |
| Logout | Click logout | Session ends and login page opens | To Be Tested |
