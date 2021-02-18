# DS_project



## Clone Project into Eclipse
File -> Import -> Git/Projects from Git -> Clone URI

the project url is https://github.com/JasonTrib/DS_project.git

when the prompt to select the kind of project appears, select Import as general project

![Alt text](/screenshots/import.png?raw=true "import_project")

Next, you should convert the current project to Dynamic Web project. To accomplish this, you should right-click the project and in properties go to Project Facets Enable Faceted Project

![Alt text](/screenshots/convert-to-facet.png?raw=true "enable_facets")


and select Dynamic Web Module from the facets list.

![Alt text](/screenshots/dynamic-facet.png?raw=true "facets")


Set the default JRE runtime to be Java 11. To accomplish this, right click the project and in Java Build Path, in Libraries Tab edit the JRE System Library to point to your Java 11 runtime (setting the appropriate value to Alternate JRE).

![Alt text](/screenshots/java-1.png?raw=true "facets")


![Alt text](/screenshots/java-2.png?raw=true "facets")


To fix the errors in jsp files, you should again right click the project, and in properties go to Targeted Runtimes and select the Apache Tomcat that is connected to your eclipse workspace.

![Alt text](/screenshots/targeted-runtimes.png?raw=true "Target Runtime")


Also, don't forget to convert the project to maven project (Configure->Convert to Maven Project) and select Maven--> Update Project from the menu appearing when right-clicking the project.


## Create a database

In order to run the project you need to have a jdbc connection.

Create a file `application.properties` under the source.

Copy the following into the file and swap in the appropriate credentials.

```
jdbc.url=jdbc://localhost:3306/db_name?useSSL=false&allowPublicKeyRetrieval=true
jdbc.user=username
jdbc.password=password
jdbc.driver=com.mysql.jdbc.Driver
hibernate.dialect=org.hibernate.dialect.MySQLDialect
hibernate.show_sql=true
```

## Execute the following query

```
CREATE TABLE IF NOT EXISTS `public_service` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(100) DEFAULT NULL,
`address` varchar(100) DEFAULT NULL,
`appointment_room` varchar(25) DEFAULT NULL,
`validated` boolean NOT NULL DEFAULT 0,
`schedule` varchar(100),
`postcode` int(5),
`call_center` int(10),
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `appointment` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`date` DATETIME(0) DEFAULT NULL,
`validated` boolean NOT NULL DEFAULT 0,
`ps_id` int(11) NOT NULL,
`citizen_name` varchar(50) NOT NULL,
`citizen_email` varchar(50),
PRIMARY KEY (`id`),
CONSTRAINT `FK_appointment_ps` FOREIGN KEY (`ps_id`)
REFERENCES `public_service` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `user` (
`username` varchar(50) NOT NULL,
`password` varchar(100) NOT NULL,
`enabled` tinyint(1) NOT NULL,
`fullname` varchar(50) ,
`title` varchar(20) ,
`email` varchar(50) ,
`ps_id` int(11) ,
PRIMARY KEY (`username`),
CONSTRAINT `FK_user_ps` FOREIGN KEY (`ps_id`)
REFERENCES `public_service` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `authorities` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`username` varchar(50) NOT NULL,
`authority` varchar(50) NOT NULL,
PRIMARY KEY (`id`),
CONSTRAINT `fk_authorities_users` FOREIGN KEY (`username`)
REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `public_service` (`id`,`name`,`address`,`appointment_room`,`validated`,`schedule`,`postcode`,`call_center`) VALUES
(1, 'ΕΦΚΑ', 'Solonos 132', 'C02', 1, 'Mon-Fri, 8:00-14:00 ', 14232, 2102344092),
(2, 'ΔΟΥ', 'Delfi 45', 'A08', 1, 'Mon-Fri, 8:00-14:30 ', 16156, 2102624583),
(3, 'ΙΚΑ', 'Makrygianni 98', 'A5', 0, 'Mon-Fri, 7:20-14:30 ', 11331, 2102400184),
(4, 'ΤΕΒΕ', 'Egnatias 17', 'B1', 0, 'Mon-Fri, 8:00-14:30 ', 12398, 2102210730),
(5, 'ΚΕΠ', 'Fedonos 40', '-', 1, 'Mon-Fri, 8:00-20:00 ', 14466, 2102558148);

INSERT INTO `appointment` (`id`, `date`, `validated`, `ps_id`, `citizen_name`, `citizen_email`) VALUES
(1, '2021-03-20 07:30:00', 1, 1, 'George Green', 'georgeg@email.com'),
(2, '2021-03-15 09:00:00', 1, 2, 'Barry Brown', 'barrybrown@email.com'),
(3, '2021-03-10 07:00:00', 1, 2, 'George Green', 'georgeg@email.com'),
(4, '2021-03-26 11:15:00', 0, 1, 'George Green', 'georgeg@email.com'),
(5, '2021-04-15 14:00:00', 0, 1, 'Whitney White', 'wwhite@email.com');

INSERT INTO `user` (`username`, `password`, `enabled`, `fullname`, `title`, `email`, `ps_id`) VALUES
('root', '$2a$04$DR/f..s1siWJc8Xg3eJgpeB28a4V6kYpnkMPeOuq4rLQ42mJUYFGC', 1, 'Root Admin', 'Admin', null, null),
('alex', '$2a$04$DR/f..s1siWJc8Xg3eJgpeB28a4V6kYpnkMPeOuq4rLQ42mJUYFGC', 1, 'Alex Norton', 'Manager', 'alexn@email.com', null),
('will', '$2a$04$DR/f..s1siWJc8Xg3eJgpeB28a4V6kYpnkMPeOuq4rLQ42mJUYFGC', 1, 'William Hill', 'Manager', 'willhill@email.com', null),
('ben', '$2a$04$DR/f..s1siWJc8Xg3eJgpeB28a4V6kYpnkMPeOuq4rLQ42mJUYFGC', 1, 'Benjamin Tatum', 'Supervisor', 'benja@email.com', 1),
('cindy', '$2a$04$DR/f..s1siWJc8Xg3eJgpeB28a4V6kYpnkMPeOuq4rLQ42mJUYFGC', 1, 'Cindy Weston ', 'Employee', 'cindyw@email.com', 1),
('martin', '$2a$04$DR/f..s1siWJc8Xg3eJgpeB28a4V6kYpnkMPeOuq4rLQ42mJUYFGC', 1, 'Martin Stevens', 'Employee', 'martin@email.com', 1),
('gerald', '$2a$04$DR/f..s1siWJc8Xg3eJgpeB28a4V6kYpnkMPeOuq4rLQ42mJUYFGC', 1, 'Gerald Stone', 'Employee', 'gstone@email.com', 1),
('mary', '$2a$04$DR/f..s1siWJc8Xg3eJgpeB28a4V6kYpnkMPeOuq4rLQ42mJUYFGC', 1, 'Mary Larsson', 'Employee', 'marylarsson@email.com', 1),
('david', '$2a$04$DR/f..s1siWJc8Xg3eJgpeB28a4V6kYpnkMPeOuq4rLQ42mJUYFGC', 1, 'David Alton', 'Supervisor', 'davidalton@email.com', 2),
('evan', '$2a$04$DR/f..s1siWJc8Xg3eJgpeB28a4V6kYpnkMPeOuq4rLQ42mJUYFGC', 1, 'Evan Dayton', 'Employee', 'evand@email.com', 2),
('emily', '$2a$04$DR/f..s1siWJc8Xg3eJgpeB28a4V6kYpnkMPeOuq4rLQ42mJUYFGC', 1, 'Emily Hale', 'Employee', 'emilyh@email.com', 2),
('chris', '$2a$04$DR/f..s1siWJc8Xg3eJgpeB28a4V6kYpnkMPeOuq4rLQ42mJUYFGC', 1, 'Chris Cooper', 'User', 'chris@email.com', 3),
('tim', '$2a$04$DR/f..s1siWJc8Xg3eJgpeB28a4V6kYpnkMPeOuq4rLQ42mJUYFGC', 1, 'Timothy Anderson', 'User', 'timand@email.com', 4),
('sean', '$2a$04$DR/f..s1siWJc8Xg3eJgpeB28a4V6kYpnkMPeOuq4rLQ42mJUYFGC', 1, 'Sean Beck', 'Supervisor', 'seanbeck@email.com', 5);

INSERT INTO `authorities` (`username`, `authority`) VALUES
('root', 'ROLE_ADMIN'),
('root', 'ROLE_MANAGER'),
('root', 'ROLE_SUPERVISOR'),
('root', 'ROLE_EMPLOYEE'),
('alex', 'ROLE_MANAGER'),
('will', 'ROLE_MANAGER'),
('ben', 'ROLE_SUPERVISOR'),
('cindy', 'ROLE_EMPLOYEE'),
('gerald', 'ROLE_EMPLOYEE'),
('martin', 'ROLE_EMPLOYEE'),
('mary', 'ROLE_EMPLOYEE'),
('david', 'ROLE_SUPERVISOR'),
('evan', 'ROLE_EMPLOYEE'),
('emily', 'ROLE_EMPLOYEE'),
('sean', 'ROLE_SUPERVISOR');
```
