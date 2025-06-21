CREATE DATABASE Restaurant_Management_Systems;

USE Restaurant_Management_Systems;


CREATE TABLE Restaurants 
(Restaurant_ID INT AUTO_INCREMENT PRIMARY KEY,
 Restaurant_Name VARCHAR(50),
 Location VARCHAR(50), 
 Cuisine_Type VARCHAR(50));
 
 CREATE TABLE Customers
 (Customer_ID INT AUTO_INCREMENT PRIMARY KEY,
 First_Name VARCHAR(30) NOT NULL,
 Last_Name VARCHAR(30) NOT NULL,
 Mobile_Number CHAR(10),
 Email VARCHAR(50) UNIQUE KEY,
 Address TEXT);
 
CREATE TABLE Menu_Items 
 (Item_ID INT AUTO_INCREMENT PRIMARY KEY,
 Restaurant_ID INT NOT NULL,
 Name VARCHAR(100) NOT NULL,
 Description TEXT,
 Price DECIMAL(10,2) NOT NULL,
 Category VARCHAR(100),
FOREIGN KEY (Restaurant_ID) REFERENCES Restaurants(Restaurant_ID));
 
CREATE TABLE Tables
 (Table_ID INT AUTO_INCREMENT PRIMARY KEY,
 Table_number INT NOT NULL,
 Seats INT NOT NULL,
 Status ENUM("Available","Occupied","Reserved") DEFAULT "Available");
 
 CREATE TABLE Reservations
 (Reservation_ID INT AUTO_INCREMENT PRIMARY KEY,
 Customer_ID INT,
 Restaurant_ID INT NOT NULL,
 Table_ID INT,
 Reservation_Date DATETIME,
 Number_of_Guests INT,
 Status ENUM("Confirmed", "Cancelled", "Completed") DEFAULT "Confirmed",
 FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
 FOREIGN KEY (Restaurant_ID) REFERENCES Restaurants(Restaurant_ID),
 FOREIGN KEY (Table_ID) REFERENCES Tables(Table_ID));
 
 CREATE TABLE Orders
 (Order_ID INT AUTO_INCREMENT PRIMARY KEY,
 Customer_ID INT,
 Table_ID INT,
 Order_Time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 Status ENUM("Pending", "In Progress", "Completed", "Cancelled") DEFAULT "Pending",
 FOREIGN KEY(Customer_ID) REFERENCES Customers(Customer_ID),
 FOREIGN KEY(Table_ID) REFERENCES Tables(Table_ID));
 
 CREATE TABLE Order_Items
 (Order_Item_ID INT AUTO_INCREMENT PRIMARY KEY,
 Order_ID INT,
 Item_ID INT,
 Quantity INT,
 Item_Price DECIMAL(10,2),
 Total_Amount DECIMAL(10,2),
 FOREIGN KEY(Item_ID) REFERENCES Menu_Items(Item_ID),
 FOREIGN KEY(Order_ID) REFERENCES Orders(Order_ID));
 
 CREATE TABLE Payments
 (Payment_ID INT AUTO_INCREMENT PRIMARY KEY,
 Order_ID INT,
 Payment_Method VARCHAR(50),
 Amount DECIMAL(10,2),
 Payment_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(Order_ID) REFERENCES Orders(Order_ID));
 
 CREATE TABLE Reviews
 (Review_ID INT AUTO_INCREMENT PRIMARY KEY,
 Customer_ID INT,
 Restaurant_ID INT,
 Ratings DECIMAL(2,1),
 Comments VARCHAR(10),
 Review_Date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(Customer_ID) REFERENCES Customers(Customer_ID),
 FOREIGN KEY(Restaurant_ID) REFERENCES Restaurants(Restaurant_ID));
 
 INSERT INTO Restaurants VALUES(1, "Aromas_of_China", "Lalbagh_Road", "Chinese"),
(2, "Chinese_Hut", "Palace_Road", "Chinese"),
(3, "Hallimane", "Malleswaram", "South_Indian"),
(4, "Shangrila", "Brigade_Road", "Chinese"),
(5, "New_Arya_Bhavan", "Ganghinagar", "Mithai_Shops"),
(6, "Herbs_and_Spices", "Indiranagar", "Continental"),
(7, "Shezan", "Lavelle_Road", "Continental"),
(8, "Dahila", "Whitefield_Road", "Japanese"),
(9, "The_only_Place", "Museum_Road", "Continental"),
(10, "Lakeview", "MG_Road", "Confectionaries"),
(11, "Casa_Piccola", "Residency_Road", "Fast_Food"),
(12, "Domino's_Pizza", "Brigade_Road", "Fast_Food"),
(13, "Pool_Side_Barbeque", "RC_Road", "Indian_(Panjabi)"),
(14, "Pizza_Corner", "Brigade_Road", "Fast_Food"),
(15, "Cupps_&_Mugs", "Infantry_Road", "Coffee Shop"),
(16, "The_Briyani_Merchant", "Ashok_Nagar", "Fusion"),
(17, "The_Fusion_Lounge", "Magrath_Road", "Fusion"),
(18, "Bay_Leaf", "Koramangala", "Indian_(Panjabi)"),
(19, "Magnum", "Jayanagar", "North_Indian"),
(20, "Latino", "Curson_Road", "North_West_Frontier"),
(21, "Treat_Restaurant", "Indiranagar", "Indian_(Panjabi)"),
(22, "Lemon_Grass", "Ashok_Nagar", "Thai"),
(23, "Palki", "Residency_Road", "North_Indian"),
(24, "Canopy", "MG_Road", "Multi_Cuisine"),
(25, "The_Besil_Hotel", "Sampige_Road", "North_Indian"),
(26, "Civet_@_ITPL", "Whitefield_Road", "Thai"),
(27, "Aaranya", "HSR_Layout", "Multi_Cuisine"),
(28, "Blue_Ginger", "Race_Course_Road", "Vietnamese"),
(29, "Sossegado-Essentially_Coastal", "RR_Road", "Sea_Food"),
(30, "Zen", "Airport_Road", "Japanese"),
(31, "Lanai_@_Le_Meridian", "Sankey_Road", "Coffee_Shop"),
(32, "Samarkand", "Infantry_Road", "North_West_Frontier"),
(33, "Amaravathi", "Residency_Road", "Andhra"),
(34, "Annachi", "Indiranagar", "South_Indian"),
(35, "Ice_&_Spice", "St_Marks_Road", "Confectionaries"),
(36, "Banjara", "Kumara_Krupa_Road", "Multi_Cuisine"),
(37, "Baskin_Robbins", "Residency_Road", "Ice_Creams"),
(38, "Chillies", "Residency_Road", "Sea_Food"),
(39, "Mandarin", "High_Grounds", "Chinese"),
(40, "The_Jockey_Club", "MG_Road", "Continental"),
(41, "Indiana_Fast_Food", "St_Patrick's_Complex", "Fast_Food"),
(42, "Tandoor", "MG_Road", "Indian_(Panjabi)"),
(43, "Ramana's", "Cunningham_Road", "North_Indian");

 INSERT INTO Customers VALUES (101, "Krishna", "Kumar", "9820110409", "krish123@gmail.com", "Homeo_House,_Jew_Street,_Cochin"),
(102, "Ajaj", "Jadeja", "9044818730", "jadeja07@gmail.com", "83,_Uday_Parknew,_Delhi"),
(103, "Nitin", "Patel", "9807345614", "nitinpatel45@gmail.com", "B_58,_Sector_40,_Gurgaon"),
(104, "Rajinder", "Singh", "9821991836", "rajisin76@gmail.com", "155/11,_Tarna_Road,_Mandi"),
(105, "Awadhesh", "Pandey", "9597284374", "apandey@gamil.com", "Aashinana_Colony,_Lucknow"),
(106, "Sudesh", "Arya", "9794049201", "sudesharya123@gmail.com", "30-Dobhal_Wala,_Dehradun"),
(107, "Rakesh", "Kumar", "9970050896", "rakimar56@gmail.com", "Purani_Basti,_Mubarakpur"),
(108, "Kanhaiya", "Gahlot", "9549459367", "gahkan48@gmail.com", "1431,_Hamalo_Ki,_Bikaner"),
(109, "Sangeeta", "Sharma", "9651240334", "sanshar675@gmail.com", "26,_Rooprajat_Enclave,_Jodhpur"),
(110, "Ashokkumar", "Dadhaniya", "8010035836", "dadhankumar87@gmail.com", "Umipaji,_22,_Patel_Colony,_Gondal"),
(111, "Rajendra", "Vyas", "9415736691", "rajanvyas234@gmail.com", "AT-Mangrol,_Shakti_Nagar,_Mangrol"),
(112, "Pravinbhai", "Sheta", "9554617403", "pravinsheta@gmail.com", "7570_A,_Shrinath_Tenament,_Bhavnagar"),
(113, "Kapil", "Chopda", "7275300356", "kapcho97@gmail.com", "43,_Patel_street,_Kutchnakhatrana"),
(114, "Sanket", "Shah", "9919594708", "sansha756@gmail.com", "38,_B/H_Mahavir_Flats,_Ahmedabad"),
(115, "Tapan", "Thanki", "9911845160", "tapthan@gmail.com", "B/301,_Ambawadi_Flats,_Ahmedabad"),
(116, "Jayswal", "Atulkumar", "9971646954", "jaykumar475@gmail.com", "Sangam_Party_Plottopp,_Sabarkantha"),
(117, "Bharatkumar", "Harde", "9766089384", "bharade67@gmail.com", "1042,_Karnavati_Nagar,_Banaskantha"),
(118, "Kiribhai", "Patel", "9451630116", "kiripatel@gmail.com", "Nadiole_Gate,_Vadnagar"),
(119, "Harsha", "Doshi", "9892245949", "hardos23@gmail.com", "204,_Viral_Plazaopp,_Vidyanagar"),
(120, "Milind", "Belsare", "9305968325", "belsaremilind76@gmail.com", "25,Shatam_Estaten,_Vadodara"),
(121, "Monika", "Asnani", "9838868814", "monani12@gmail.com", "Flot_No.6,_Jesal_Apartment,_Vadodara"),
(122, "Rohit", "Chauhan", "9819674737", "chauhanrohi589@gmail.com", "199,_Hari_Nagar,_Surat"),
(123, "Asha", "Merja", "9769933128", "ashamer67@gmail.com", "35,_Ayodhya_Nagri,_Surat"),
(124, "Anilkumar", "Jain", "9956292724", "anijain34@gmail.com", "274/278,_Narshi_Nath_Street,_Mumbai"),
(125, "Sivarama", "Krishna", "9453912460", "sivakrish4356@gmail.com","003,_Officers_Flats,_Maharashtra"),
(126, "Jayesh", "Maniar", "9956292724", "manijaya456839@gmail.com", "D/713,_7th_Floor,_Kandivali_West"),
(127, "Ravindra", "Pisal", "9451015211", "pisandra67@gmail.com", "A_401,_Ruturangaran_Street,_Pune"),
(128, "Uma", "Acharya", "9702906420", "umaacha45@gmail.com", "42,_Rasta_Pethnandan,_Pune"),
(129, "Deshpande", "Sanjay", "9820957414", "deshsanjay123@gmail.com", "Flat_No.5,_Market_Yard,_Mumbai"),
(130, "Manoj", "Jamnekar", "9892745883", "manojam@gmail.com", "Sant_Gulabba_Nagar,_Amravati"),
(131, "Sanjeev", "Mishra", "9918096860", "sanmish35728@gmail.com", "Intellegence_Bureav,_Old_Pannai,_Jaipur"),
(132, "Shubha", "Gupta", "9833965552", "gupsubha76@gmail.com", "QR_No_3/7,_Chattisgarh"),
(133, "Anil", "Pentyala", "9415921043", "anilpent67@gmail.com", "411-25,_Krishna_Nagar,_Vijayawada"),
(134, "Ramamurthy", "Ramani", "9454298872", "ramram157@gmail.com", "65,_Serpentine_Road,_West_Banglore"),
(135, "Bijay", "Samantaray", "8508976734", "bijsam5@gmail.com", "Tota_Street,_Main_Road,_Orissa"),
(136, "Vimal", "Mandal", "9984608518", "vimdal64@gmail.com", "145,_Harichak_Kasdi,_Bhagalpur"),
(137, "Bhavin", "Sagar", "9819503906", "bhavisagar567@gmail.com", "501/A,_Madhuram_Appartment,_Chennai");

INSERT INTO Menu_Items VALUES (701, 1, "Crab_Rangoon", "Cream_cheese_filled_wontons_with_crab_flavor", "349", "Appetizers"),
(702, 2, "Shrimp_Roll", "Deep_fried_roll_with_shrimp_and_vegetables", "240", "Appetizers"),
(703, 3, "Paniyaram", "Bite_sized_dumplings_made_from_fermented_rice_and_lentil_batter,_served_with_chutney", "190.5", "Breakfast"),
(704, 4, "Chicken_Yat_Gaw_Mein", "Noodle_soup_with_chicken,_vegetables,_and_broth", "230.5", "Soups"),
(705, 5, "Cow_Milk_Peda", "Soft_milk_fudge_made_from_cow's_milk,_sugar,_and_cardamom", "180", "Mithai"),
(706, 6, "Brownie_with_Chocolate_Sauce", "Rich_chocolate_brownie_served_warm_with_a_drizzle_of_chocolate_sauce", "299", "Desserts"),
(707, 7, "Potato_Croquette", "Breaded_and_deep_fried_mashed_potatoes,_often_served_with_a_tangy_dip", "310.5", "Starters"),
(708, 8, "Katsu_Don", "Breaded_and_deep_fried_pork_cutlet_served_over_rice_with_a_savory_sauce", "549.5", "Bento_&_Set_Meals"),
(709, 9, "Sausage_Pepper_Burger", "Spicy_sausage_patty_topped_with_sauteed_peppers_and_onions_in_a_bun", "399", "Sandwiches"),
(710, 10, "Fruit_Chews", "Chewy_candies_with_intense_fruit_flavors", "40.5", "Fruit_Candies"),
(711, 11, "French_Fries", "Crispy,__thin_cut_fries_seasoned_with_salt", "150", "Fries_&_Sides"),
(712, 12, "Curly_Fries", "Spiral_cut_fries_seasoned_with_a_unique_blend_of_spices", "199", "Fries_&_Sides"),
(713, 13, "Chole_Bhature", "Spicy_chickpea_curry_served_with_deep_fried_bread", "249.5", "Main_Course"),
(714, 14, "Spicy_Chicken_Sandwich", "Spicy_fried_chicken_fillet_with_pickles_on_a_brioche_bun", "450.5", "Sandwiches"),
(715, 15, "Flat_White", "An_espresso_based_drink_with_velvety_steamed_milk,_offering_a_stronger_coffee_taste_than_a_latte", "299", "Hot_Coffee_Beverages"),
(716, 16, "Tandoori_Chicken_Pizza", "Combines_the_flavors_of_Indian_tandoori_chicken_with_the_format_of_an_Italian_pizza", "499", "Fusion"),
(717, 17, "Kimchi_Tacos", "A_fusion_of_Korean_and_Mexican_cuisines,_these_tacos_feature_spicy,_fermented_kimchi_and_tender,_marinated_meat", "549.5", "Fusion"),
(718, 18, "Paneer_Tikka", "Cottage_cheese_cubes_marinated_in_spices,_grilled_to_perfection", "210.5", "Main_Course"),
(719, 19, "North_Indian_Thali", "Includes_steamed_rice,_dal_tadka,_chapati,_papad,_and_a_choice_of_vegetable_curry", "330", "Thali_Combos"),
(720, 20, "Seekh_Kebab", "Minced_meat_skewers_seasoned_with_traditional_spices,_grilled_over_charcoal_for_smoky_flavor", "320.5", "Kebabs"),
(721, 21, "Dal_Makhani", "Slow_cooked_black_lentils_and_kidney_beans_in_a_rich,_buttery_gravy", "199.5", "Main_Course"),
(722, 22, "Tom_Kha_Gai", "Creamy_coconut_milk_soup_with_chicken,_galangal,_lemongrass,_and_mushrooms", "410.5", "Soups"),
(723, 23, "Garlic_Roti_Meal", "Includes_kadhai_paneer_or_kadhai_mushroom_with_garlic_roti", "250", "Thali_Combos"),
(724, 24, "Gajar_Ka_Halwa", "Sweet_carrot_pudding_cooked_with_milk,_sugar,_and_garnished_with_nuts_and_cardamom", "180.5", "Desserts"),
(725, 25, "Chili_Gobi", "Crispy_fried_cauliflower_florets_tossed_in_a_spicy_sauce", "249.4", "Starters"),
(726, 26, "Pad_Thai", "Stir-fried_rice_noodles_with_shrimp_or_chicken,_eggs,_tofu,_bean_sprouts,_and_peanuts,_flavored_with_tamarind_and_fish_sauce" , "450.5", "Main_Course"),
(727, 27, "Spicy_Tortilla_Soup", "Sweet_and_spicy_Mexican_soup", "180.3", "Soups"),
(728, 28, "Banh_beo", "Steamed_rice_cakes_topped_with_dried_shrimp,_crispy_pork_skin,_and_scallion_oil", "250.2", "Appetizers"),
(729, 29, "Prawn_Fried_Rice", "Stir_fried_rice_with_prawns,_vegetables,_and_soy_sauce", "750", "Rice"),
(730, 30, "Tempura_Set", "Assorted_battered_and_deep-fried_seafood_and_vegetables,_served_with_rice_and_dipping_sauce", "699.5", "Bento_&_Set_Meals"),
(731, 31, "Nitro_Cold_Brew", "Cold_brew_coffee_infused_with_nitrogen_for_a_creamy_texture_and_rich_flavor", "349.2", "Cold_Coffee_Beverages"),
(732, 32, "Chapli_Kebab", "Spiced_minced_meat_patties,_mixed_with_herbs,_tomatoes,_and_spices,_shallow_fried_to_perfection", "350", "Kebabs"),
(733, 33, "Kodi_Kura", "Chicken_cooked_with_aromatic_spices_and_herbs,_a_classic_Andhra_dish", "269.5", "Main_Course"),
(734, 34, "Mutton_Sukka", "Dry_fried_mutton_cooked_with_spices_and_herbs", "390.6", "Main_Dishes"),
(735, 35, "Candy_Sticks", "Hard_candy_sticks_in_various_fruit_flavors", "50.6", "Fruit_Candies"),
(736, 36, "Russian_Salad", "A_mix_of_pineapple,_potato,_fresh_beans,_carrot,_and_green_peas,_dressed_with_mayonnaise", "169.2", "Appetizers"),
(737, 37, "Mississippi_Mud", "Dark_chocolate_ice_cream_with_fudgy_brownie_pieces_for_a_decadent_treat", "199", "Fusion"),
(738, 38, "Seafood_Biryani", "Aromatic_basmati_rice_cooked_with_mixed_seafood_and_spices,_served_with_raita", "999.5", "Rice"),
(739, 39, "Lemon_Chicken", "Crispy_chicken_in_a_tangy_lemon_sauce", "320.1", "Poultry"),
(740, 40, "Fruit_Platter", "Assorted_fresh_seasonal_fruits,_often_served_as_a_refreshing_dessert_option", "249.3", "Desserts"),
(741, 41, "Whopper", "Flame_grilled_beef_patty_with_lettuce,_tomato,_pickles,_onions,_and_mayo_on_a_sesame_seed_bun", "349.6", "Burgers"),
(742, 42, "Lassi", "Traditional_yogurt_based_drink,_available_in_sweet_or_salty_variations", "120.5", "Desserts"),
(743, 43, "Paneer_Tikka", "Marinated_paneer_cubes_grilled_in_a_tandoor,_served_with_mint_chutney", "230.9", "Starters");

INSERT INTO Tables VALUES (301, 1, 6, "Available"),
(302, 2, 4, "Occupied"),
(303, 3, 2, "Reserved"),
(304, 4, 8, "Available"),
(305, 5, 4, "Occupied"),
(306, 6, 2, "Reserved"),
(307, 7, 6, "Available"),
(308, 8, 2, "Reserved"),
(309, 9, 4, "Occupied"),
(310, 10, 6, "Available"),
(311, 11, 8, "Available"),
(312, 12, 6, "Occupied"),
(313, 13, 4, "Occupied"),
(314, 14, 2, "Reserved"),
(315, 15, 6, "Reserved"),
(316, 16, 8, "Available"),
(317, 17, 2, "Available"),
(318, 18, 4, "Occupied"),
(319, 19, 2, "Occupied"),
(320, 20, 2, "Reserved"),
(321, 21, 6, "Reserved"),
(322, 22, 8, "Available"),
(323, 23, 4, "Occupied"),
(324, 24, 8, "Reserved"),
(325, 25, 4, "Occupied"),
(326, 26, 6, "Occupied"),
(327, 27, 8, "Available"),
(328, 28, 6, "Reserved"),
(329, 29, 4, "Occupied"),
(330, 30, 2, "Reserved"),
(331, 31, 6, "Available"),
(332, 32, 6, "Occupied"),
(333, 33, 4, "Reserved"),
(334, 34, 2, "Available"),
(335, 35, 2, "Reserved"),
(336, 36, 8, "Occupied"),
(337, 37, 6, "Reserved"),
(338, 38, 6, "Available"),
(339, 39, 2, "Reserved"),
(340, 40, 4, "Available"),
(341, 41, 2, "Occupied"),
(342, 42, 6, "Reserved"),
(343, 43, 2, "Available");

INSERT INTO Reservations VALUES (601, 101, 27, 301, "2025-06-03 08:00", 6, "Confirmed"),
(602, 102, 29, 302, "2025-06-04 14:20", 3, "Confirmed"),
(603, 103, 20, 303, "2025-06-04 20:00", 2, "Confirmed"),
(604, 104, 10, 304, "2025-06-10 17:00", 6, "Confirmed"),
(605, 105, 34, 305, "2025-05-28 20:20", 4, "Completed"),
(606, 106, 11, 306, "2025-06-07 10:00", 2, "Confirmed"),
(607, 107, 11, 307, "2025-05-29 14:00", 4, "Completed"),
(608, 108, 35, 308, "2025-06-03 16:00", 2, "Confirmed"),
(609, 109, 38, 309, "2025-06-06 20:00", 3, "Confirmed"),
(610, 110, 42, 310, "2025-05-30 17:20", 5, "Completed"),
(611, 111, 38, 311, "2025-06-05 13:00", 8, "Confirmed"),
(612, 112, 7, 312, "2025-06-06 08:00", 6, "Confirmed"),
(613, 113, 35, 313, "2025-06-06 11:00", 4, "Confirmed"),
(614, 114, 18, 314, "2025-06-08 12:15", 2, "Confirmed"),
(615, 115, 21, 315, "2025-05-21 18:00", 6, "Completed"),
(616, 116, 7, 316, "2025-05-31 17:30", 6, "Completed"),
(617, 117, 36, 317, "2025-06-09 14:30", 2, "Confirmed"),
(618, 118, 7, 318, "2025-06-10 11:00", 4, "Confirmed"),
(619, 119, 21, 319, "2025-05-28 19:00", 2, "Completed"),
(620, 120, 12, 320, "2025-05-30 18:30", 2, "Completed"),
(621, 121, 3, 321, "2025-05-30 18:00", 5, "Completed"),
(622, 122, 43, 322, "2025-06-04 17:15", 7, "Confirmed"),
(623, 123, 17, 323, "2025-05-25 16:30", 3, "Completed"),
(624, 124, 33, 324, "2025-06-05 14:30", 6, "Cancelled"),
(625, 125, 37, 325, "2025-06-06 18:00", 2, "Confirmed"),
(626, 126, 36, 326, "2025-06-06 09:30", 4, "Confirmed"),
(627, 127, 38, 327, "2025-06-10 10:15", 6, "Confirmed"),
(628, 128, 23, 328, "2025-06-04 10:00", 5, "Cancelled"),
(629, 129, 29, 329, "2025-06-03 11:20", 4, "Confirmed"),
(630, 130, 30, 330, "2025-05-31 15:00", 2, "Completed"),
(631, 131, 4, 331, "2025-05-30 16:45", 5, "Cancelled"),
(632, 132, 37, 332, "2025-06-05 12:00", 6, "Confirmed"),
(633, 133, 34, 333, "2025-06-05 12:15", 4, "Confirmed"),
(634, 134, 5, 334, "2025-06-07 15:30", 2, "Confirmed"),
(635, 135, 1, 335, "2025-06-07 10:15", 2, "Confirmed"),
(636, 136, 1, 336, "2025-06-09 21:10", 7, "Confirmed");

INSERT INTO Orders VALUES (201, 101, 301, "2025-06-03 08:15:07", "Completed"),
(202, 102, 302, "2025-06-04 14:25:12", "In Progress"),
(203, 103, 303, "2025-06-04 20:05:07", "In Progress"),
(204, 104, 304,	"2025-06-10 17:05:16", "Pending"),
(205, 105, 305, "2025-05-28 20:25:58", "Completed"),
(206, 106, 306, "2025-06-07 10:10:25", "In Progress"),
(207, 107, 307, "2025-05-29 14:15:13", "Completed"),
(208, 108, 308, "2025-06-03 16:10:09", "Pending"),
(209, 109, 309, "2025-06-06 20:05:08", "Pending"),
(210, 110, 310, "2025-05-30 17:26:15", "Completed"),
(211, 111, 311, "2025-06-05 13:15:00", "Pending"),
(212, 112, 312, "2025-06-06 08:05:46", "In Progress"),
(213, 113, 313, "2025-06-06 11:05:33", "In Progress"),
(214, 114, 314, "2025-06-08 12:18:12", "Completed"),
(215, 115, 315, "2025-05-21 18:06:11", "Completed"),
(216, 116, 316, "2025-05-31 17:38:35", "In Progress"),
(217, 117, 317, "2025-06-09 14:35:26", "In Progress"),
(218, 118, 318, "2025-06-10 11:10:58", "Pending"),
(219, 119, 319, "2025-05-28 19:07:46", "Completed"),
(220, 120, 320, "2025-05-30 18:38:39", "Completed"),
(221, 121, 321, "2025-05-30 18:05:19", "Completed"),
(222, 122, 322, "2025-06-04 17:17:15", "In Progress"),
(223, 123, 323, "2025-05-25 16:40:25", "Completed"),
(224, 124, 324, "2025-06-05 14:37:55", "Cancelled"),
(225, 125, 325, "2025-06-06 18:05:45", "In Progress"),
(226, 126, 326, "2025-06-06 09:33:46", "Pending"),
(227, 127, 327, "2025-06-10 10:25:57", "In Progress"),
(228, 128, 328, "2025-06-04 10:20:29", "Cancelled"),
(229, 129, 329, "2025-06-03 11:25:25", "Pending"),
(230, 130, 330, "2025-05-31 15:04:15", "Completed"),
(231, 131, 331, "2025-05-30 16:49:11", "Cancelled"),
(232, 132, 332, "2025-06-05 12:07:12", "In Progress"),
(233, 133, 333, "2025-06-05 12:19:00", "Pending"),
(234, 134, 334, "2025-06-07 15:38:01", "Pending"),
(235, 135, 335, "2025-06-07 10:25:05", "In Progress");

INSERT INTO Order_Items VALUES (401, 201, 727, 5, 180.3, 901.5),
(402, 202, 729, 3, 750, 2250),
(403, 203, 720, 2, 320.5, 641),
(404, 204, 710, 5, 40.5, 202.5),
(405, 205, 734, 4, 390.6, 1562.4),
(406, 206, 711, 2, 150, 300),
(407, 207, 711, 3, 150, 450),
(408, 208, 735, 2, 50.6, 101.2),
(409, 209, 738, 3, 999.5, 2998.5),
(410, 210, 742, 5, 120.5, 602.5),
(411, 211, 738, 6, 999.5, 5997),
(412, 212, 707, 6, 310.5, 1863),
(413, 213, 735, 4, 50.6, 202.4),
(414, 214, 718, 2, 210.5, 421),
(415, 215, 721, 5, 199.5, 997.5),
(416, 216, 707, 6, 310.5, 1863),
(417, 217, 736, 2, 169.2, 338.4),
(418, 218, 707, 4, 310.5, 1242),
(419, 219, 721, 2, 199.5, 399),
(420, 220, 712, 2, 199, 398),
(421, 221, 703, 5, 190.5, 952.5),
(422, 222, 743, 6, 230.9, 1385.4),
(423, 223, 717, 3, 549.5, 1648.5),
(424, 224, 733, 5, 269.5, 1347.5),
(425, 225, 737, 2, 199, 398),
(426, 226, 736, 4, 169.2, 676.8),
(427, 227, 738, 5, 999.5, 4997.5),
(428, 228, 723, 5, 250, 1250),
(429, 229, 729, 4, 750, 3000),
(430, 230, 730, 2, 699.5, 1399),
(431, 231, 704, 5, 230.5, 1152.5),
(432, 232, 737, 5, 199, 995),
(433, 233, 734, 3, 390.6, 1171.8),
(434, 234, 705, 2, 180, 360),
(435, 235, 701, 2, 349, 698);

INSERT INTO Payments VALUES(901, 201, "Cash", 901.5, "2025-06-03 09:15:01"),
(902, 202, "Credit _Card", 2250, "2025-06-04 15:35:52"),
(903, 203, "Debit_Card", 641, "2025-06-04 21:15:07"),
(904, 204, "QR", 202.5, "2025-06-10 19:25:12"),
(905, 205, "Credit_Card", 1562.4, "2025-05-28 22:15:20"),
(906, 206, "QR", 300, "2025-06-07 11:11:35"),
(907, 207, "Cash", 450, "2025-05-29 16:17:06"),
(908, 208, "Cash", 101.2, "2025-06-03 17:20:12"),
(909, 209, "QR", 2998.5, "2025-06-06 21:04:25"),
(910, 210, "Cash", 602.5, "2025-05-30 18:16:03"),
(911, 211, "QR", 5997, "2025-06-05 15:17:07"),
(912, 212, "Credit_Card", 1863, "2025-06-06 10:25:09"),
(913, 213, "Cash", 202.4, "2025-06-06 11:56:25"),
(914, 214, "Credit_Card", 421, "2025-06-08 13:19:27"),
(915, 215, "Cash", 997.5, "2025-05-21 20:08:35"),
(916, 216, "Credi_Card", 1863, "2025-05-31 19:48:52"),
(917, 217, "Debit_Card", 338.4, "2025-06-09 15:38:32"),
(918, 218, "Cash", 1242, "2025-06-10 11:59:26"),
(919, 219, "QR", 399, "2025-05-28 21:27:35"),
(920, 220, "Cash", 398, "2025-05-30 20:28:26"),
(921, 221, "Credit_Card", 952.5, "2025-05-30 19:25:24"),
(922, 222, "Debit_Card", 1385.4, "2025-06-04 19:19:12"),
(923, 223, "Debit_Card", 1648.5, "2025-05-25 18:30:07"),
(924, 224, "Credit_Card", 1347.5, "2025-06-05 15:39:00"),
(925, 225, "Cash", 398, "2025-06-06 19:04:55"),
(926, 226, "Cash", 676.8, "2025-06-06 10:53:42"),
(927, 227, "QR", 4997.5, "2025-06-10 11:25:00"),
(928, 228, "QR", 1250, "2025-06-04 11:10:16"),
(929, 229, "Credit_Card", 3000, "2025-06-03 11:59:48"),
(930, 230, "Cash", 1399, "2025-05-31 16:14:33"),
(931, 231, "Credit_Card", 1152.5, "2025-05-30 18:45:11"),
(932, 232, "Debit_Card", 995, "2025-06-05 14:05:52"),
(933, 233, "Debit_Card", 1171.8, "2025-06-05 14:18:49"),
(934, 234, "Cash", 360, "2025-06-07 16:34:28"),
(935, 235, "QR", 698, "2025-06-07 11:35:12");

INSERT INTO Reviews VALUES (401, 101, 27, 3.8, "Good", "2025-06-04 09:00:05"),
(402, 102, 29, 3.9, "Better", "2025-06-05 15:20:04"),
(403, 103, 20, 4.1, "Better", "2025-06-12 16:00:12"),
(404, 104, 10, 4.3, "Best", "2025-05-29 20:30:22"),
(405, 105, 34, 4.2, "Best", "2025-06-08 00:00:05"),
(406, 106, 11, 3.9, "Better", "2025-06-07 21:00:07"),
(407, 107, 11, 4.5, "Best", "2025-05-31 16:20:02"),
(408, 108, 35, 4.7, "Best", "2025-06-07 14:00:06"),
(409, 109, 38, 4.1, "Good", "2025-06-08 00:00:20"),
(410, 110, 42, 4.1, "Good", "2025-06-09 13:15:09"),
(411, 111, 38, 3.9, "Normal", "2025-06-10 14:00:10"),
(412, 112, 7, 4.2, "Better", "2025-06-07 23:30:50"),
(413, 113, 35, 4.3, "Best", "2025-06-10 15:30:40"),
(414, 114, 18, 3.9, "Good", "2025-06-12 00:00:30"),
(415, 115, 21, 4.2, "Best", "2025-05-31 22:30:33"),
(416, 116, 7, 3.9, "Good", "2025-06-05 19:15:35"),
(417, 117, 36, 4.5, "Best", "2025-06-11 18:30:21"),
(418, 118, 7, 4.2, "best", "2025-06-12 08:30:10"),
(419, 119, 21, 3.7, "Normal", "2025-06-11 03:15:15"),
(420, 120, 12, 4.6, "Best", "2025-06-04 00:20:07"),
(421, 121, 3, 4.8, "Best", "2025-05-31 14:00:11"),
(422, 122, 43, 3.9, "Better", "2025-06-06 13:00:10"),
(423, 123, 17, 3.7, "Normal", "2025-06-08 17:30:43"),
(424, 125, 37, 3.8, "Good", "2025-06-07 20:05:25"),
(425, 126, 36, 4.2, "Best", "2025-06-06 10:33:50"),
(426, 127, 38, 4.3, "Best", "2025-06-11 11:25:30"),
(427, 129, 29, 3.9, "Normal", "2025-06-05 00:25:55"),
(428, 130, 30, 4.1, "Better", "2025-05-31 22:04:40"),
(429, 132, 37, 3.9, "Good", "2025-06-07 13:07:33"),
(430, 133, 34, 3.8, "Normal", "2025-06-06 13:19:25"),
(431, 134, 5, 4.3, "Best", "2025-06-09 17:38:40"),
(432, 135, 1, 4.5, "Best", "2025-06-08 10:55:20");



 SELECT * FROM Restaurants
 SELECT * FROM Customers
 SELECT * FROM Menu_Items
 SELECT * FROM Tables
 SELECT * FROM Reservations
 SELECT * FROM Orders
 SELECT * FROM Order_Items
 SELECT * FROM Payments
 SELECT * FROM Reviews



DELIMITER &&
CREATE PROCEDURE GetTotalRevenue()
BEGIN
   SELECT SUM(Total_Amount) FROM Order_Items;
END  &&
DELIMITER;


DELIMITER &&
CREATE PROCEDURE GetAllOrdersWithDetails()
BEGIN
   SELECT o.order_id, c.first_name, c.last_name, mi.name AS item, oi.quantity, oi.total_amount
   FROM orders AS o
   JOIN customers AS c ON o.customer_id = c.customer_id
   JOIN order_items AS oi ON o.order_id = oi.order_id
   JOIN menu_items AS mi ON oi.item_id = mi.item_id;
END &&
DELIMITER;


DELIMITER &&
CREATE PROCEDURE GetTotalRevenuePerDay()
BEGIN
   SELECT DATE(o.order_time) AS day, SUM(oi.total_amount) AS revenue
   FROM orders as o
   JOIN order_items as oi on o.order_id = oi.order_id
   GROUP BY day
   ORDER BY day DESC;
END &&
DELIMITER;


DELIMITER &&
CREATE PROCEDURE GetTopSellingMenuItems()
BEGIN
   SELECT mi.name, sum(oi.quantity) AS total_sold
   FROM order_items AS oi
   JOIN menu_items AS mi ON oi.item_id = mi.item_id
   GROUP BY mi.name
   ORDER BY total_sold DESC
   LIMIT 10;
END &&
DELIMITER;


DELIMITER &&
CREATE PROCEDURE GetRevenueGeneratedByEachMenuItemCategory()
BEGIN
   SELECT mi.category, SUM(oi.quantity * mi.price) AS revenue
   FROM Order_items AS oi
   JOIN Menu_Items AS mi ON oi.item_id = mi.item_id
   GROUP BY mi.category
   ORDER BY revenue DESC;
END&&
DELIMITER;


DELIMITER &&
CREATE PROCEDURE GetOrderSummaryForASpecificCustomer(in cusid int)
BEGIN
   SELECT o.order_id, o.order_time, mi.name AS item, oi.quantity, mi.price, oi.quantity * mi.price AS total
   FROM Orders AS o
   JOIN Order_items AS oi ON o.order_id = oi.order_id
   JOIN Menu_Items AS mi ON oi.item_id = mi.item_id
   WHERE o.customer_id = cusid;
END&&
DELIMITER;


DELIMITER &&
CREATE PROCEDURE GetAverageOrderValue()
BEGIN
   SELECT AVG(total_amount) AS average_order_value
   FROM Order_items;
END&&
DELIMITER;


DELIMITER &&
CREATE PROCEDURE GetMonthlyRevenueReport()
BEGIN
   SELECT DATE_FORMAT(o.order_time, '%Y-%m') AS month, SUM(oi.total_amount) AS monthly_revenue
   FROM Orders AS o
   JOIN order_items AS oi ON o.order_id = oi.order_id
   GROUP BY month
   ORDER BY month DESC;
END&&
DELIMITER;


DELIMITER &&
CREATE PROCEDURE GetListOfCustomersWhoHavenotOrderedRecently()
BEGIN
   SELECT * FROM Customers
   WHERE customer_id NOT IN (SELECT DISTINCT customer_id
   FROM Orders
   WHERE order_time >= CURDATE() - INTERVAL 21 DAY);
END&&
DELIMITER;


DELIMITER &&
CREATE PROCEDURE GetDailyOrderCount()
BEGIN
   SELECT DATE(order_time) AS order_day, COUNT(*) AS total_orders
   FROM Orders as o
   GROUP BY order_day
   ORDER BY order_day;
END&&
DELIMITER;


DELIMITER &&
CREATE PROCEDURE GetMostRecentOrders()
BEGIN
   SELECT o.order_id, c.first_name, c.last_name, o.order_time, oi.total_amount
   FROM Orders AS o
   JOIN order_items AS oi ON o.order_id = oi.order_id
   JOIN Customers AS c ON o.customer_id = c.customer_id
   ORDER BY o.order_time DESC
   LIMIT 5;
END &&
DELIMITER;


DELIMITER &&
CREATE PROCEDURE GetCustomersWithItemsOrdered()
BEGIN
   SELECT CONCAT(c.first_name,' ',c.last_name) AS customer, GROUP_CONCAT(mi.name SEPARATOR ', ') AS items_ordered
   FROM Orders AS o
   JOIN Order_items AS oi ON o.order_id = oi.order_id
   JOIN Menu_Items AS mi ON oi.item_id = mi.item_id
   JOIN Customers AS c ON o.customer_id = c.customer_id
   GROUP BY o.order_id;
END &&
DELIMITER;


DELIMITER &&
CREATE PROCEDURE GetRecentCustomerFeedback()
BEGIN
   SELECT CONCAT(c.first_name,' ',c.last_name) AS customer_names, re.restaurant_name, r.ratings, r.comments, r.review_date
   FROM reviews AS r
   JOIN customers AS c ON c.customer_id = r.customer_id
   JOIN restaurants AS re ON re.restaurant_id = r.restaurant_id
   WHERE review_date >= CURRENT_DATE - INTERVAL 21 DAY
   ORDER BY review_date DESC;
END &&
DELIMITER;


DELIMITER &&
CREATE PROCEDURE GetAvailableSummary()
BEGIN
  SELECT table_id, table_number, status,
   CASE
      WHEN status = "available" THEN "proceed"
      WHEN status = "reserved" THEN "not proceed"
      ELSE "cannot proceed"
   END AS table_status FROM tables;
END &&
DELIMITER;


DELIMITER &&
CREATE PROCEDURE GetSecondHighestPrice()
BEGIN
    SELECT MAX(price) AS second_highest_price FROM menu_items WHERE price < (SELECT MAX(price) FROM menu_items);
END &&
DELIMITER;


DELIMITER &&
CREATE PROCEDURE GetTheSecondHighestPriceForEachCategory(in pricerank int)
BEGIN
	SELECT category, MAX(price) AS second_highest_price
	FROM (SELECT category, price, DENSE_RANK() OVER(PARTITION BY category ORDER BY price DESC) AS price_rank 
	FROM menu_items) AS ranked_prices 
    WHERE price_rank = pricerank GROUP BY category;
END &&
DELIMITER;



CALL GetTotalRevenue
CALL GetAllOrdersWithDetails
CALL GetTotalRevenuePerDay
CALL GetTopSellingMenuItems
CALL GetRevenueGeneratedByEachMenuItemCategory
CALL GetOrderSummaryForASpecificCustomer(121)
CALL GetAverageOrderValue
CALL GetMonthlyRevenueReport
CALL GetListOfCustomersWhoHavenotOrderedRecently
CALL GetDailyOrderCount
CALL GetMostRecentOrders
CALL GetCustomersWithItemsOrdered
CALL GetRecentCustomerFeedback
CALL GetAvailableSummary
CALL GetSecondHighestPrice
CALL GetTheSecondHighestPriceForEachCategory(2)