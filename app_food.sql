-- MySQL dump 10.13  Distrib 9.0.1, for Linux (x86_64)
--
-- Host: localhost    Database: node44
-- ------------------------------------------------------
-- Server version	9.0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,'Margherita Pizza','https://example.com/images/margherita_pizza.jpg',12.99,'Classic Italian pizza with tomato, mozzarella, and basil',1),(2,'Kung Pao Chicken','https://example.com/images/kung_pao_chicken.jpg',10.99,'Spicy stir-fried chicken with peanuts and vegetables',2),(3,'Sushi Platter','https://example.com/images/sushi_platter.jpg',25.5,'Assorted sushi rolls with fresh fish and vegetables',3),(4,'Tacos al Pastor','https://example.com/images/tacos_al_pastor.jpg',8.99,'Traditional Mexican tacos with marinated pork',4),(5,'Butter Chicken','https://example.com/images/butter_chicken.jpg',15.99,'Rich and creamy Indian curry with butter and spices',5),(6,'Croissant','https://example.com/images/croissant.jpg',3.5,'Buttery and flaky French pastry',6),(7,'Greek Salad','https://example.com/images/greek_salad.jpg',9.99,'Fresh salad with feta cheese, olives, and cucumber',7),(8,'Pad Thai','https://example.com/images/pad_thai.jpg',11.99,'Popular Thai stir-fried noodle dish with peanuts and lime',8),(9,'Pho','https://example.com/images/pho.jpg',10.5,'Vietnamese noodle soup with beef and herbs',9),(10,'Bibimbap','https://example.com/images/bibimbap.jpg',13.5,'Korean mixed rice bowl with vegetables and meat',10),(11,'Hummus','https://example.com/images/hummus.jpg',6.99,'Classic Mediterranean dip made from chickpeas and tahini',11),(12,'Burger','https://example.com/images/burger.jpg',14.5,'American-style burger with beef patty and toppings',12),(13,'Paella','https://example.com/images/paella.jpg',18.99,'Traditional Spanish rice dish with seafood and saffron',13),(14,'Shawarma','https://example.com/images/shawarma.jpg',9.5,'Middle Eastern wrap with spiced meat and vegetables',14),(15,'Feijoada','https://example.com/images/feijoada.jpg',16.99,'Brazilian black bean stew with pork and beef',15),(16,'Baklava','https://example.com/images/baklava.jpg',5.99,'Sweet Turkish dessert made with layers of filo pastry and nuts',16),(17,'Tagine','https://example.com/images/tagine.jpg',14.99,'Moroccan slow-cooked stew with meat and vegetables',17),(18,'Injera with Doro Wat','https://example.com/images/injera_doro_wat.jpg',13.99,'Ethiopian flatbread with spicy chicken stew',18),(19,'Jerk Chicken','https://example.com/images/jerk_chicken.jpg',12.99,'Caribbean spicy grilled chicken with jerk seasoning',19),(20,'Schnitzel','https://example.com/images/schnitzel.jpg',11.99,'German breaded and fried meat cutlet',20);
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_type`
--

DROP TABLE IF EXISTS `food_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_type`
--

LOCK TABLES `food_type` WRITE;
/*!40000 ALTER TABLE `food_type` DISABLE KEYS */;
INSERT INTO `food_type` VALUES (1,'Italian'),(2,'Chinese'),(3,'Japanese'),(4,'Mexican'),(5,'Indian'),(6,'French'),(7,'Greek'),(8,'Thai'),(9,'Vietnamese'),(10,'Korean'),(11,'Mediterranean'),(12,'American'),(13,'Spanish'),(14,'Lebanese'),(15,'Brazilian'),(16,'Turkish'),(17,'Moroccan'),(18,'Ethiopian'),(19,'Caribbean'),(20,'German');
/*!40000 ALTER TABLE `food_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like_res`
--

DROP TABLE IF EXISTS `like_res`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `like_res` (
  `like_res_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` datetime DEFAULT NULL,
  PRIMARY KEY (`like_res_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like_res`
--

LOCK TABLES `like_res` WRITE;
/*!40000 ALTER TABLE `like_res` DISABLE KEYS */;
INSERT INTO `like_res` VALUES (21,5,1,NULL),(24,10,1,NULL),(26,15,1,NULL),(27,7,1,NULL),(28,6,13,NULL);
/*!40000 ALTER TABLE `like_res` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `discount_code` varchar(30) DEFAULT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `food_id` (`food_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (21,5,5,5,NULL,NULL),(22,12,7,2,NULL,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rate_res`
--

DROP TABLE IF EXISTS `rate_res`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rate_res` (
  `rate_res_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` datetime DEFAULT NULL,
  PRIMARY KEY (`rate_res_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rate_res`
--

LOCK TABLES `rate_res` WRITE;
/*!40000 ALTER TABLE `rate_res` DISABLE KEYS */;
INSERT INTO `rate_res` VALUES (24,5,1,4,NULL),(25,8,1,2,NULL),(26,19,1,3,NULL),(27,17,1,4,NULL),(28,5,12,5,NULL);
/*!40000 ALTER TABLE `rate_res` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(100) NOT NULL,
  `image` text,
  `description` text,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'The Gourmet Spot','https://example.com/images/gourmet_spot.jpg','A fine dining experience with a modern twist on classic dishes.'),(2,'Ocean Breeze','https://example.com/images/ocean_breeze.jpg','A seaside restaurant offering the freshest seafood with stunning views of the ocean.'),(3,'Mountain Grille','https://example.com/images/mountain_grille.jpg','Rustic dining with a hearty menu, perfect for adventurers and nature lovers.'),(4,'Vegan Delights','https://example.com/images/vegan_delights.jpg','A vegan-friendly restaurant serving plant-based meals full of flavor.'),(5,'Pasta Palace','https://example.com/images/pasta_palace.jpg','The best pasta dishes from traditional Italian recipes.'),(6,'Burger Barn','https://example.com/images/burger_barn.jpg','Homemade gourmet burgers with a variety of toppings.'),(7,'Sushi World','https://example.com/images/sushi_world.jpg','Authentic sushi experience with fresh ingredients and expert chefs.'),(8,'Spice Route','https://example.com/images/spice_route.jpg','A vibrant restaurant that takes you on a culinary journey through the spices of Asia.'),(9,'Pizza Paradise','https://example.com/images/pizza_paradise.jpg','A paradise for pizza lovers, offering traditional and innovative pizza flavors.'),(10,'Steakhouse Supreme','https://example.com/images/steakhouse_supreme.jpg','A high-end steakhouse specializing in perfectly cooked meats.'),(11,'Taco Haven','https://example.com/images/taco_haven.jpg','Mexican street food at its best with tacos that burst with flavor.'),(12,'Breakfast Bliss','https://example.com/images/breakfast_bliss.jpg','All-day breakfast restaurant with classic and modern brunch options.'),(13,'Mediterranean Feast','https://example.com/images/mediterranean_feast.jpg','Mediterranean dishes with a focus on fresh, healthy ingredients.'),(14,'The Barbecue Pit','https://example.com/images/barbecue_pit.jpg','Authentic slow-cooked barbecue with a variety of sauces.'),(15,'Curry House','https://example.com/images/curry_house.jpg','Indian cuisine featuring traditional curry dishes and spicy delicacies.'),(16,'Bistro Bella','https://example.com/images/bistro_bella.jpg','A cozy bistro offering a blend of French and Italian dishes.'),(17,'Noodle Nook','https://example.com/images/noodle_nook.jpg','Asian-inspired noodle dishes, from ramen to pho.'),(18,'Dessert Dreamland','https://example.com/images/dessert_dreamland.jpg','A dessert-focused restaurant with cakes, ice creams, and pastries.'),(19,'Fusion Flavors','https://example.com/images/fusion_flavors.jpg','A fusion restaurant combining flavors from different cultures in exciting ways.'),(20,'The Salad Bar','https://example.com/images/salad_bar.jpg','Healthy and refreshing salads with a wide range of toppings and dressings.');
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_food`
--

DROP TABLE IF EXISTS `sub_food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_food`
--

LOCK TABLES `sub_food` WRITE;
/*!40000 ALTER TABLE `sub_food` DISABLE KEYS */;
INSERT INTO `sub_food` VALUES (1,'Extra Cheese',2.5,1),(2,'Fried Peanuts',1.99,2),(3,'Extra Wasabi',0.5,3),(4,'Garlic Naan',3.5,5),(5,'Chocolate Filling',1.5,6),(6,'Extra Olives',1,7),(7,'Shrimp Add-on',3,8),(8,'Extra Lime',0.5,9),(9,'Kimchi',2,10),(10,'Pita Bread',1.5,11),(11,'Extra Bacon',2,12),(12,'Garlic Sauce',1,14),(13,'Rice',1.99,15),(14,'Pistachios',1.5,16),(15,'Couscous',2,17),(16,'Extra Injera',1.99,18),(17,'Rice & Peas',2,19),(18,'Potato Salad',1.99,20);
/*!40000 ALTER TABLE `sub_food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `pass_word` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (4,'Emily Davis','emily.davis@example.com','emilypass@'),(5,'Chris Brown','chris.brown@example.com','chris1234'),(6,'Anna Wilson','anna.wilson@example.com','anna5678'),(7,'James Clark','james.clark@example.com','clarksecure'),(8,'Laura Miller','laura.miller@example.com','laura7890'),(9,'Robert Lewis','robert.lewis@example.com','robpass2023'),(10,'Jennifer Lee','jennifer.lee@example.com','jenniferpwd'),(11,'David Walker','david.walker@example.com','walker!pass'),(12,'Emma Hall','emma.hall@example.com','emmahall123'),(13,'Daniel Young','daniel.young@example.com','daniel789'),(14,'Sophia Harris','sophia.harris@example.com','sophia_pass'),(15,'Matthew King','matthew.king@example.com','kingsecure'),(16,'Olivia Wright','olivia.wright@example.com','olivia@wright'),(17,'Joseph Allen','joseph.allen@example.com','josephpass'),(18,'Mia Scott','mia.scott@example.com','mia_pass@!'),(19,'William Green','william.green@example.com','green1234'),(20,'Ava Adams','ava.adams@example.com','adams7890'),(22,'Tran Van Hau 2002','hautran.01022002@gmai.com','$2b$10$C0rSGFkgNXAUv8S9HJ8UpuuJX0FE2gvnJSPVbjWPlH8wixXLGatMO');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-06 13:21:14
