/*
SQLyog Enterprise - MySQL GUI v6.56
MySQL - 5.0.81-community-nt : Database - socialmedia
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`socialmedia` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `socialmedia`;

/*Table structure for table `followers` */

DROP TABLE IF EXISTS `followers`;

CREATE TABLE `followers` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `follower_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Data for the table `followers` */

insert  into `followers`(`id`,`user_id`,`follower_id`) values (1,1,2),(2,1,3),(3,2,1),(4,2,3),(5,2,4),(6,4,1),(7,4,2),(8,4,3),(9,4,5),(10,2,5),(11,4,4),(12,6,1),(13,6,2),(14,6,3),(15,6,4),(16,8,1),(17,8,2),(18,8,6);

/*Table structure for table `profileimages` */

DROP TABLE IF EXISTS `profileimages`;

CREATE TABLE `profileimages` (
  `id` int(11) NOT NULL auto_increment,
  `image_title` varchar(255) NOT NULL,
  `location` varchar(20) NOT NULL,
  `upload_date` varchar(255) NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `profileimages` */

/*Table structure for table `userinformation` */

DROP TABLE IF EXISTS `userinformation`;

CREATE TABLE `userinformation` (
  `id` int(11) NOT NULL auto_increment,
  `firstname` varchar(255) default NULL,
  `middlename` varchar(255) default NULL,
  `lastname` varchar(255) default NULL,
  `profession` varchar(255) default NULL,
  `address` varchar(500) default NULL,
  `day` int(11) default NULL,
  `month` int(11) default NULL,
  `year` int(11) default NULL,
  `userid` int(11) NOT NULL,
  `gender` varchar(10) default NULL,
  `profileimage` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `userinformation` */

insert  into `userinformation`(`id`,`firstname`,`middlename`,`lastname`,`profession`,`address`,`day`,`month`,`year`,`userid`,`gender`,`profileimage`) values (1,'Amjad','Ali','Mirjat','Network Engineer','Hyderabad, Sindh, Pakistan',2,9,1995,2,'Male',NULL),(2,'Badsha','Baker','Qambrani','Food Quality Manager Officer','Larkana, Sindh, Pakistan',15,3,1929,4,'Male','humza.jpg'),(3,'Mukhtair','Ali','Chandio','Java Programmer','Hyderabad, Sindh, Pakistan',11,8,1987,6,'Male',NULL),(4,'Aslam','Ali','Khokhar','Programmer','Shedadhkot, Sindh, Pakistan',17,3,1938,8,'Male',NULL),(5,'Mama','Chacha','Nana','Devloper','Haveli, Azad Kashmir, Pakistan',13,6,1929,10,'Female',NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `username` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`email`) values (1,'hujjaj250','gabbar','hujjajali@gmail.com'),(2,'amjumirjat','sauuni','amjadali@gmail.com'),(3,'abuzarsindhi','sindhimanu','abuzarsindhi@gmail.com'),(4,'abubakerjambo','jambo','abubaker@vivid.com'),(5,'shahidshah','shah','shah@yahoo.com'),(6,'mukhtiarmama','mama','mukhtiarmama@gmail.com'),(7,'saeedahmed','saad','saad@gmail.com'),(8,'aslamba','aslam','aslam@gmail.com'),(9,'zash250','dsdsd','juma@gmail.com'),(10,'mama22','123','mama@mama.com'),(11,'Anil Kapoor','govinda','anilkapoor@gmail.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
