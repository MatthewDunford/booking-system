USE `booking_system`;

--
-- Dumping data for table `target_audience`
--

set autocommit=0;
INSERT INTO `target_audience` VALUES (1,'General Public');
INSERT INTO `target_audience` VALUES (2,'Freelancers');
INSERT INTO `target_audience` VALUES (3,'UK Goverment');
INSERT INTO `target_audience` VALUES (4,'University Students');
INSERT INTO `target_audience` VALUES (5,'University Graduates');
INSERT INTO `target_audience` VALUES (6,'Small Businesses');
commit;

--
-- Dumping data for table `venue`
--

set autocommit=0;
INSERT INTO `venue` VALUES (1,'UWE Exhibition & Conference Centre',500,1200.00,'Frenchay Campus, Coldharbour Ln, Bristol BS16 1QY','0117 32 82000','events@uwe.ac.uk');
INSERT INTO `venue` VALUES (2,'University of Bristol - Wills Memorial Building',300,1500.00,'Queens Rd, Clifton, Bristol BS8 1RJ','0117 928 9000','conference-office@bristol.ac.uk');
INSERT INTO `venue` VALUES (3,'Engine Shed',60,450.00,'Station Approach, Temple Meads, Bristol BS1 6QH','0117 915 1278','info@engine-shed.co.uk');
INSERT INTO `venue` VALUES (4,'Easton Community Centre',100,200.00,'Kilburn St, Easton, Bristol BS5 6AW','0117 954 1409','bookings@eastoncommunitycentre.org.uk');
INSERT INTO `venue` VALUES (5,'Bristol Marriott Royal Hotel',400,2500.00,'College Green, Bristol BS1 5TA','0117 925 5100','events@marriottbristol.co.uk');
INSERT INTO `venue` VALUES (6,'Future Leap Clifton',40,350.00,'1-3 Gloucester Rd, Bishopston, Bristol BS7 8AA','0117 945 8730','clifton@futureleap.co.uk');
INSERT INTO `venue` VALUES (7,'The Bristol Hotel',200,900.00,'Prince St, Bristol BS1 4QF','0117 923 0333','bristol@doylecollection.com');
INSERT INTO `venue` VALUES (8,'Paintworks Event Space',250,1100.00,'Bath Rd, Arnos Vale, Bristol BS4 3EH','0117 971 4320','events@paintworks.biz');
INSERT INTO `venue` VALUES (9,'We The Curious - Rosary Room',150,800.00,'One Millennium Square, Bristol BS1 5DB','0117 915 1000','venue.hire@wethecurious.org');
INSERT INTO `venue` VALUES (10,'The Watershed',80,550.00,'1 Canons Rd, Bristol BS1 5TX','0117 927 5100','events@watershed.co.uk');
commit;

--
-- Dumping data for table `expert_guide`
--

set autocommit=0;
INSERT INTO `expert_guide` VALUES (1,'Paul Jackson','4411732 81912','Paul4.Jackson@uwe.ac.uk');
INSERT INTO `expert_guide` VALUES (2,'James Barrett','07700 900202','James6.Barrett@uwe.ac.uk');
INSERT INTO `expert_guide` VALUES (3,'Angus Hutchison','07700 900203','Angus.Hutchison@uwe.ac.uk');
INSERT INTO `expert_guide` VALUES (4,'Andrew McCarthy','07700 900204','Andrew6.Mccarthy@uwe.ac.uk');
INSERT INTO `expert_guide` VALUES (5,'Tunde Oduguwa','07700 900205','Tunde.Oduguwa@uwe.ac.uk');
commit;

--
-- Dumping data for table `team`
--

set autocommit=0;
INSERT INTO `team` VALUES (1,'Alpha Team',180.00);
INSERT INTO `team` VALUES (2,'Bravo Team',165.00);
INSERT INTO `team` VALUES (3,'Charlie Team',140.00);
INSERT INTO `team` VALUES (4,'Delta Team',220.00);
INSERT INTO `team` VALUES (5,'Echo Team',250.00);
INSERT INTO `team` VALUES (6,'Foxtrot Team',130.00);
INSERT INTO `team` VALUES (7,'Golf Team',195.00);
INSERT INTO `team` VALUES (8,'Hotel Team',175.00);
INSERT INTO `team` VALUES (9,'India Team',210.00);
INSERT INTO `team` VALUES (10,'Juliet Team',155.00);
commit;

--
-- Dumping data for table `member`
--

set autocommit=0;
INSERT INTO `member` VALUES (1,'George Atreides','07700 900111','george.a@tbpromotions.co.uk');
INSERT INTO `member` VALUES (2,'Zahra Mohammed','07700 900112','zahra.m@tbpromotions.co.uk');
INSERT INTO `member` VALUES (3,'Toby Henderson','07700 900113','toby.h@tbpromotions.co.uk');
INSERT INTO `member` VALUES (4,'Ollie Thompson','07700 900114','ollie.t@tbpromotions.co.uk');
INSERT INTO `member` VALUES (5,'Muna Abdi','07700 900115','muna.a@tbpromotions.co.uk');
INSERT INTO `member` VALUES (6,'Aidan Gallagher','07700 900116','aidan.g@tbpromotions.co.uk');
INSERT INTO `member` VALUES (7,'Alisha Khan','07700 900117','alisha.k@tbpromotions.co.uk');
INSERT INTO `member` VALUES (8,'Hala Ibrahim','07700 900118','hala.i@tbpromotions.co.uk');
INSERT INTO `member` VALUES (9,'Rizwan Ahmed','07700 900119','rizwan.a@tbpromotions.co.uk');
INSERT INTO `member` VALUES (10,'Sagal Farah','07700 900120','sagal.f@tbpromotions.co.uk');
INSERT INTO `member` VALUES (11,'Sam Edwards','07700 900121','sam.e@tbpromotions.co.uk');
INSERT INTO `member` VALUES (12,'Zainab Ali','07700 900122','zainab.a@tbpromotions.co.uk');
INSERT INTO `member` VALUES (13,'Zakarie Duale','07700 900123','zakarie.d@tbpromotions.co.uk');
INSERT INTO `member` VALUES (14,'Kajally Jobe','07700 900124','kajally.j@tbpromotions.co.uk');
INSERT INTO `member` VALUES (15,'Zak Barker','07700 900125','zak.b@tbpromotions.co.uk');
commit;

--
-- Dumping data for table `team_has_member`
--

set autocommit=0;
INSERT INTO `team_has_member` VALUES (1,1,1);
INSERT INTO `team_has_member` VALUES (2,1,2);
INSERT INTO `team_has_member` VALUES (3,2,3);
INSERT INTO `team_has_member` VALUES (4,2,4);
INSERT INTO `team_has_member` VALUES (5,3,5);
INSERT INTO `team_has_member` VALUES (6,3,6);
INSERT INTO `team_has_member` VALUES (7,4,7);
INSERT INTO `team_has_member` VALUES (8,4,8);
INSERT INTO `team_has_member` VALUES (9,5,9);
INSERT INTO `team_has_member` VALUES (10,5,10);
INSERT INTO `team_has_member` VALUES (11,6,11);
INSERT INTO `team_has_member` VALUES (12,6,12);
INSERT INTO `team_has_member` VALUES (13,7,13);
INSERT INTO `team_has_member` VALUES (14,8,14);
INSERT INTO `team_has_member` VALUES (15,9,15);
INSERT INTO `team_has_member` VALUES (16,10,1);
INSERT INTO `team_has_member` VALUES (17,1,3);
INSERT INTO `team_has_member` VALUES (18,2,5);
INSERT INTO `team_has_member` VALUES (19,3,7);
INSERT INTO `team_has_member` VALUES (20,4,9);
commit;

--
-- Dumping data for table `presentation`
--

set autocommit=0;
INSERT INTO `presentation` VALUES (1,'How To Beat Your Competition',3,'Business Strategy');
INSERT INTO `presentation` VALUES (2,'How To Monopolise Your industry',2,'Business Strategy');
INSERT INTO `presentation` VALUES (3,'How To Be More Motivated',4,'Motivational');
INSERT INTO `presentation` VALUES (4,'Sustainability!',2,'Environmental');
INSERT INTO `presentation` VALUES (5,'A Exciting Strategic Business Presentation',3,'Technology');
commit;

--
-- Dumping data for table `team_presentation`
--

set autocommit=0;
INSERT INTO `team_presentation` VALUES (1,1,1);
INSERT INTO `team_presentation` VALUES (2,4,1);
INSERT INTO `team_presentation` VALUES (3,2,2);
INSERT INTO `team_presentation` VALUES (4,10,3);
INSERT INTO `team_presentation` VALUES (5,3,4);
INSERT INTO `team_presentation` VALUES (6,5,5);
INSERT INTO `team_presentation` VALUES (7,7,1);
INSERT INTO `team_presentation` VALUES (8,9,5);
commit;

--
-- Dumping data for table `booking`
--

set autocommit=0;
INSERT INTO `booking` VALUES (1,1,1,'2026-03-10 09:00:00','2026-03-10 12:00:00');
INSERT INTO `booking` VALUES (2,3,2,'2026-03-15 13:00:00','2026-03-15 15:00:00');
INSERT INTO `booking` VALUES (3,6,1,'2026-03-22 10:00:00','2026-03-22 13:00:00');
INSERT INTO `booking` VALUES (4,5,4,'2026-04-05 09:30:00','2026-04-05 13:30:00');
INSERT INTO `booking` VALUES (5,4,3,'2026-04-12 14:00:00','2026-04-12 16:00:00');
INSERT INTO `booking` VALUES (6,2,5,'2026-04-20 10:00:00','2026-04-20 13:00:00');
commit;

--
-- Dumping data for table `team_audience`
--

set autocommit=0;
INSERT INTO `team_audience` VALUES (1, 1, 2);
INSERT INTO `team_audience` VALUES (2, 1, 4);
INSERT INTO `team_audience` VALUES (3, 2, 3);
INSERT INTO `team_audience` VALUES (4, 3, 1);
INSERT INTO `team_audience` VALUES (5, 4, 2);
INSERT INTO `team_audience` VALUES (6, 5, 5);
INSERT INTO `team_audience` VALUES (7, 6, 3);
INSERT INTO `team_audience` VALUES (8, 7, 1);
INSERT INTO `team_audience` VALUES (9, 8, 5);
INSERT INTO `team_audience` VALUES (10, 9, 2);
commit;

--
-- Dumping data for table `presentation_audience`
--

set autocommit=0;
INSERT INTO `presentation_audience` VALUES (1, 1, 3);
INSERT INTO `presentation_audience` VALUES (2, 1, 2);
INSERT INTO `presentation_audience` VALUES (3, 2, 2);
INSERT INTO `presentation_audience` VALUES (4, 2, 4);
INSERT INTO `presentation_audience` VALUES (5, 3, 1);
INSERT INTO `presentation_audience` VALUES (6, 3, 5);
INSERT INTO `presentation_audience` VALUES (7, 4, 1);
INSERT INTO `presentation_audience` VALUES (8, 4, 5);
INSERT INTO `presentation_audience` VALUES (9, 5, 2);
INSERT INTO `presentation_audience` VALUES (10, 5, 3);
commit;

--
-- Dumping data for table `expert_guide_audience`
--

set autocommit=0;
INSERT INTO `expert_guide_audience` VALUES (1, 1, 5);
INSERT INTO `expert_guide_audience` VALUES (2, 2, 2);
INSERT INTO `expert_guide_audience` VALUES (3, 3, 3);
INSERT INTO `expert_guide_audience` VALUES (4, 4, 4);
INSERT INTO `expert_guide_audience` VALUES (5, 5, 1);
INSERT INTO `expert_guide_audience` VALUES (6, 1, 2);
commit;

--
-- Dumping data for table `venue_audience`
--

set autocommit=0;
INSERT INTO `venue_audience` VALUES (1, 1, 5);
INSERT INTO `venue_audience` VALUES (2, 2, 5);
INSERT INTO `venue_audience` VALUES (3, 2, 4);
INSERT INTO `venue_audience` VALUES (4, 3, 3);
INSERT INTO `venue_audience` VALUES (5, 3, 2);
INSERT INTO `venue_audience` VALUES (6, 4, 1);
INSERT INTO `venue_audience` VALUES (7, 5, 2);
INSERT INTO `venue_audience` VALUES (8, 5, 4);
INSERT INTO `venue_audience` VALUES (9, 6, 3);
INSERT INTO `venue_audience` VALUES (10,9, 1);
INSERT INTO `venue_audience` VALUES (11,2, 1);
INSERT INTO `venue_audience` VALUES (12,3, 4);
INSERT INTO `venue_audience` VALUES (13, 7, 5); 
INSERT INTO `venue_audience` VALUES (14, 8, 2);
INSERT INTO `venue_audience` VALUES (15, 6, 2); 
commit;


