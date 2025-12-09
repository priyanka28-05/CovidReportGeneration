# 🏥 Covid Report Generation System

A streamlined web application designed for generating comprehensive Covid-19 reports using **JSP (JavaServer Pages)** on the frontend, integrating with the powerful reporting engine **JasperReports (Jaspersoft)**, and secured by a robust **SQL database** for the login module.



---

## ✨ Key Features

* **Secure Login Module:** User authentication is managed via a dedicated **SQL database** for secure access to the reporting features.
* **JasperReports Integration:** Leverages **Jaspersoft** to generate complex, data-driven reports in various formats (PDF, HTML, etc.).
* **Dynamic Report Generation:** Reports are generated in real-time based on parameters fetched from the underlying database (e.g., date range, region, specific metrics).
* **JSP Interface:** A simple, browser-based interface for user login, parameter input, and report viewing.
* **Data-Driven:** Designed to connect to a backend database containing Covid-19 case, testing, or vaccine data.

---

## 🛠️ Technologies Used

| Category | Technology | Role |
| :--- | :--- | :--- |
| **Frontend** | **JSP** (JavaServer Pages) | User interface and parameter input. |
| **Backend/Core** | **Java** (Servlet/JSP Container) | Application logic and handling of report requests. |
| **Reporting** | **JasperReports** (Jaspersoft) | Professional, printable report generation engine. |
| **Database** | **SQL Database** (e.g., MySQL, PostgreSQL) | Storing user credentials for the login module and Covid data for reporting. |

---

## ⚙️ Setup and Running

### Prerequisites

You must have the following installed:

1.  **Java Development Kit (JDK 8 or higher)**
2.  **Apache Tomcat** or another Servlet container (e.g., Jetty).
3.  **SQL Database** (with credentials/schema configured).
4.  **Database Driver** (JAR file for your specific SQL database).

### 1. Database Configuration 🔒

The following script sets up the `users` database and the `login` table.

> **Security Note:** Passwords must *always* be hashed (e.g., using Bcrypt) in your application code before being stored in the database. The value shown below is a placeholder for a secure hash, *not* a plain text password.

```sql
-- 1. Create the Database (if it doesn't exist)
CREATE DATABASE IF NOT EXISTS `users`;

-- 2. Use the new Database
USE `users`;

-- 3. Create the Table
-- 'password' length is increased to accommodate a secure hash (VARCHAR(255)).
CREATE TABLE `login` (
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(255) NOT NULL, 
  PRIMARY KEY (`username`)
);

-- 4. Insert Data (Admin/Default User)
INSERT INTO `users`.`login` (`username`, `password`)
VALUES ("admin", "$2a$10$w3vQ3b2F9kHlXjG5o7r8O.5JcE9pY1iT0u4I0zGv6W2M4kH6qL7"); 
-- This placeholder hash represents the password 'admin' securely hashed.
    

3.  Ensure your **database connection parameters** (URL, username, password) are correctly set within the Java Servlets or configuration files.

### 2. Deployment

1.  Compile the Java source code and package the project as a **WAR file**.
2.  Deploy the generated WAR file to your **Tomcat** or web container's `webapps` directory.
3.  Place the required database driver JAR (e.g., `mysql-connector-java.jar`) into the web container's `lib` directory or within the project's `WEB-INF/lib` directory.

### 3. Access the Application

1.  Start the Tomcat server.
2.  Access the login page in your browser (assuming Tomcat runs on port 8080):
    ```
    http://localhost:8080/covid-report-generation/login.jsp
    ```

---

## 🖥️ How Reporting Works

1.  **User Input:** The user logs in and navigates to the report input page, where they select reporting parameters (e.g., start date, end date).
2.  **Servlet Call:** The request is sent to the designated Java Servlet (e.g., `ReportGeneratorServlet`).
3.  **Jasper Filling:**
    * The Servlet locates the compiled report template (`.jasper` file).
    * It executes a **SQL query** against the database using the user-provided parameters.
    * It uses the `net.sf.jasperreports.engine.JasperFillManager` to fill the report template with the data.
4.  **Export & Display:** The filled report is exported to the desired format (usually PDF or HTML) and then streamed back to the user interface for display.

---

## 🔮 Future Enhancements

* **Data Visualization:** Add charts and graphs to the generated reports.
* **User Roles/Permissions:** Implement finer-grained access control based on user roles.
* **Report Scheduling:** Allow users to schedule reports to be generated and emailed automatically.
* **Secure Password Hashing:** Implement a strong hashing algorithm (like bcrypt) for password storage.
