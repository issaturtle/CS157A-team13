# CS157A-team13
For code JSP files go to appache->webapps

1. Pull this repository from Github
2. Launch IntelliJ and open a project  
    a. Inside of the zip, you will find a folder called CS157APRoject; select that project to open
3. The package will launch as a Jakarta 9 project. Update your dependencies by selecting Maven on the right-hand side and clicking the highlighted circle
4. Go to the edit configuration and select the Apache Tomcat server provided in the zip file, as well as the JAVA version SDK 17+
5. Run the project, and you will be launched to the homepage
6. If running into trouble connecting to the database, edit your username and password with this SQL query in MySQL Workbench:  
   
    a. RENAME USER 'current_username'@'localhost' TO 'root'@'localhost';  
    b. ALTER USER 'root'@'localhost' IDENTIFIED BY '013626210!';  
    c. FLUSH PRIVILEGES;  
    Where you change current_username to the current username you are using
