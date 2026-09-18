USE `booking_system`;

--
-- Dumping data for table `target_audience`
--


SET autocommit=0;
INSERT INTO `target_audience` (`target_audience_id`, `category`) VALUES 
(1, 'General Public'), 
(2, 'Freelancers'), 
(3, 'UK Government'), 
(4, 'University Students'), 
(5, 'University Graduates'), 
(6, 'Small Businesses'), 
(7, 'Medium Businesses'), 
(8, 'Policy Makers');  
COMMIT;



--
-- Dumping data for table `venue`
--



SET autocommit=0;
INSERT INTO `venue` (`venue_id`, `name`, `capacity`, `max_booking_fee`, `location`, `phone`, `email`) VALUES 
(1, 'UWE Exhibition & Conference Centre', 500, 1200.00, 'Frenchay Campus, Bristol BS16 1QY', '0117 1023495', 'events@uwe.ac.uk'), 
(2, 'University of Bristol - Wills Memorial Building', 300, 1500.00, 'Queens Rd, Bristol BS8 1RJ', '0227 1023495', 'bookings@bristol.su'), 
(3, 'Engine Shed', 60, 450.00, 'Station Approach, Temple Meads, Bristol BS1 6QH', '0227 102948', 'venue.hire@engine-shed.co.uk'), 
(4, 'Easton Community Centre', 100, 200.00, 'Kilburn St, Easton, Bristol BS5 6AW', '0333 123400', 'bookings@eastoncommunitycentre.su'), 
(5, 'Bristol Marriott Royal Hotel', 400, 2500.00, 'College Green, Bristol BS1 5TA', '07434 607192', 'events@marriottbristol.co.uk'),
(6, 'Future Leap Clifton', 40, 350.00, '1-3 Gloucester Rd, Bristol BS7 8AA', '07434 958273', 'venue.hire@futureleap.co.uk'),
(7, 'The Bristol Hotel', 200, 900.00, 'Prince St, Bristol BS1 4QF', '07434 1032483', 'venue.hire@thebristolhotel.com'), 
(8, 'Paintworks Event Space', 250, 1100.00, 'Bath Rd, Bristol BS4 3EH', '07434 1029358', 'venue.hire@paintworks.su'), 
(9, 'We The Curious - Rosary Room', 150, 800.00, 'One Millennium Square, Bristol BS1 5DB', '07434 2046050', 'venue.hire@wethecurious.co.uk'),
(10, 'The Watershed', 80, 550.00, '1 Canons Rd, Bristol BS1 5TX', '07434 92835100', 'venue.hire@watershed.co.uk');
COMMIT;



--
-- Dumping data for table `venue_audience`
--


SET autocommit=0;
INSERT INTO `venue_audience` (`venue_id`, `target_audience_id`) VALUES 
(1, 4),
(1, 5),
(1, 6),  
(2, 4),
(2, 5),
(2, 2), 
(2, 6), 
(3, 2),
(3, 6),
(4, 1),
(5, 6), 
(5, 4), 
(5, 1), 
(5, 2),  
(6, 3), 
(7, 5),  
(8, 2),  
(9, 1),  
(10, 2);
COMMIT;



--
-- Dumping data for table `expert_guide`
--


SET autocommit=0;
INSERT INTO `expert_guide` (`expert_guide_id`, `name`, `phone`, `email`) VALUES 
(1, 'Paul Jackson', '4411732 81912', 'Paul4.Jackson@uwe.ac.uk'), 
(2, 'James Barrett', '07700 900202', 'James6.Barrett@uwe.ac.uk'), 
(3, 'Angus Hutchison', '07700 900203', 'Angus.Hutchison@uwe.ac.uk'), 
(4, 'Andrew McCarthy', '07700 900204', 'Andrew6.Mccarthy@uwe.ac.uk'), 
(5, 'Tunde Oduguwa', '07700 900205', 'Tunde.Oduguwa@uwe.ac.uk'), 
(6, 'Elizabeth White', '4411 73287245', 'Elizabeth.White@uwe.ac.uk'),
(7, 'Peter Case', '4411 73281709', 'Peter.Case@uwe.ac.uk'), 
(8, 'Susanna Clasby', '4411 73287245', 'Susanna.Clasby@uwe.ac.uk'), 
(9, 'Jim Campbell', '4411 73285833', 'Jim.Campbell@uwe.ac.uk'), 
(10, 'Jim workbell', '0192 10293857', 'Jim.workbell@uwe.ac.uk'), 
(11, 'Ian Johnson', '4411 01923894', 'Ian.Johnson@uwe.ac.uk'); 
COMMIT;



--
-- Dumping data for table `team`
--


SET autocommit=0;
INSERT INTO `team` (`team_id`, `name`, `hourly_rate`) VALUES  
(1, 'Alpha Team', 180.00), 
(2, 'Bravo Team', 165.00), 
(3, 'Charlie Team', 140.00), 
(4, 'Delta Team', 250.00),
(5, 'Echo Team', 250.00), 
(6, 'Foxtrot Team', 130.00), 
(7, 'Golf Team', 195.00),  
(8, 'Hotel Team', 175.00),
(9, 'India Team', 210.00), 
(10, 'Juliet Team', 155.00); 
COMMIT;



--
-- Dumping data for table `member`
--


SET autocommit=0;
INSERT INTO `member` (`member_id`, `name`, `phone`, `email`) VALUES 
(1, 'George Atreides', '07700 900548', 'george.a@tbpromotions.co.uk'),   
(2, 'Zahra Mohammed', '07700 900102', 'zahra.m@tbpromotions.co.uk'), 
(3, 'Toby Henderson', '07700 406203', 'toby.h@tbpromotions.co.uk'),
(4, 'Ollie Thompson', '07700 193847', 'ollie.t@tbpromotions.co.uk'),
(5, 'Muna Abdi', '07700 1092958', 'muna.a@tbpromotions.co.uk'),
(6, 'Aidan Gallagher', '07773 203440', 'aidan.g@tbpromotions.co.uk'),
(7, 'Alisha Khan', '07773 193205', 'alisha.k@tbpromotions.co.uk'),
(8, 'Hala Ibrahim', '07773 957174', 'hala.i@tbpromotions.co.uk'),
(9, 'Rizwan Ahmed', '07773 295817', 'rizwan.a@tbpromotions.co.uk'),
(10, 'Sagal Farah', '07773 038381', 'sagal.f@tbpromotions.co.uk'),
(11, 'Sam Edwards', '07733 819248', 'sam.e@tbpromotions.co.uk'),
(12, 'Zainab Ali', '07733 900122', 'zainab.a@tbpromotions.co.uk'), 
(13, 'Zakarie Duale', '07733 900102', 'zakarie.d@tbpromotions.co.uk'), 
(14, 'Kajally Jobe', '07733 900123', 'kajally.j@tbpromotions.co.uk'), 
(15, 'Zak Barker', '07733 900124', 'zak.b@tbpromotions.co.uk'),
(16, 'Anish Adhikari', '07700 900129', 'anish.a@tbpromotions.co.uk'), 
(17, 'Ayub Aden', '07700 800293', 'ayub.a@tbpromotions.co.uk'),  
(18, 'Shovit Adhikari', '07700 700394', 'shovit.a@tbpromotions.co.uk'), 
(19, 'Sujal Adhikari', '07700 918239', 'sujal.a@tbpromotions.co.uk'),
(20, 'Leila Hassan', '07700 900881', 'leila.h@tbpromotions.co.uk'),
(21, 'Marcus Thorne', '07700 900772', 'marcus.t@tbpromotions.co.uk'),
(22, 'Chloe Whittaker', '07773 405912', 'chloe.w@tbpromotions.co.uk'),
(23, 'Arjun Singh', '07733 112233', 'arjun.s@tbpromotions.co.uk'),
(24, 'Fiona Gallagher', '07700 304050', 'fiona.g@tbpromotions.co.uk'),
(25, 'Omar Sharif', '07773 667788', 'omar.s@tbpromotions.co.uk'),
(26, 'Elena Rossi', '07733 998877', 'elena.r@tbpromotions.co.uk'),
(27, 'David Okoro', '07700 554433', 'david.o@tbpromotions.co.uk'),
(28, 'Sophie Bennett', '07773 121212', 'sophie.b@tbpromotions.co.uk'),
(29, 'Liam O’Connor', '07733 343434', 'liam.o@tbpromotions.co.uk'),
(30, 'Maya Patel', '07700 789456', 'maya.p@tbpromotions.co.uk'),
(31, 'Noah Williams', '07773 456789', 'noah.w@tbpromotions.co.uk'),
(32, 'Isabella Martinez', '07733 654321', 'isabella.m@tbpromotions.co.uk'),
(33, 'Yusuf Mansour', '07700 111222', 'yusuf.m@tbpromotions.co.uk'),
(34, 'Grace Taylor', '07773 333444', 'grace.t@tbpromotions.co.uk');
COMMIT;



--
-- Dumping data for table `team_has_member`
--


SET autocommit=0;
INSERT INTO `team_has_member` (`team_id`, `member_id`) VALUES 

(2,3),  
(2,4), 
(3,5), 
(3,6),
(4,7), 
(4,8), 
(5,9), 
(5,10), 
(7,13), 
(8,14), 
(9,15), 
(10,1), 
(1,3), 
(2,5), 
(3,7), 
(4,9),
(5,16),
(8,18),
(8,19),
(2,22),  
(2,23), 
(3,24), 
(3,25),
(4,26), 
(4,27), 
(5,28), 
(5,29), 
(6,30), 
(7,31), 
(8,32), 
(9,33), 
(2,28), 
(3,30), 
(4,32),
(5,34),
(8,23),
(8,24);
COMMIT;



--
-- Dumping data for table `presentation`
--


SET autocommit=0;
INSERT INTO `presentation` (`presentation_id`, `name`, `length_in_hours`, `topic`, `file_path`) VALUES 
(1, 'How To Beat Your Competition', 3, 'Business Strategy', '/home/TeamBuilder-Promotions/database-files/Beat Your Competition.pptx'),
(2, 'How To Monopolise Your Industry', 2, 'Business Strategy', '/home/TeamBuilder-Promotions/database-files/Monopolise Your Industry 101.pptx'),
(3, 'How To Be More Motivated', 2, 'Motivational', '/home/TeamBuilder-Promotions/database-files/Motivate-The-Motivation.pptx'),
(4, 'Sustainability!', 1, 'Environmental', '/home/TeamBuilder-Promotions/database-files/Sustainability-Is-Important-v13.pptx'),
(5, 'An Exciting Strategic Business Presentation', 1, 'Technology', '/home/TeamBuilder-Promotions/database-files/Exciting Strategic Business Presentation-FINAL.pptx'),
(6, 'How To Be A Team Player!', 2, 'Motivational', '/home/TeamBuilder-Promotions/database-files/Team Player Presentation.pptx'),
(7, 'Guide On Overworking Your University Graduates ', 2, 'Business Strategy', '/home/TeamBuilder-Promotions/database-files/Guide On Overworking Employees.pptx');
COMMIT;



--
-- Dumping data for table `team_presentation`
--


SET autocommit=0;
INSERT INTO `team_presentation` (`team_id`, `presentation_id`) VALUES 
(1,1), 
(4,1), 
(2,2), 
(10,3), 
(3,4), 
(5,5), 
(7,1), 
(9,5),
(5, 2),
(1, 2), 
(2, 1), 
(3, 6), 
(4, 2),
(6, 4), 
(7, 7), 
(8, 3), 
(9, 6),
(10, 6),
(1, 7), 
(5, 1); 
COMMIT;



--
-- Dumping data for table `booking`
--


SET autocommit=0;
INSERT INTO `booking` (`team_presentation_id`, `venue_id`, `start_datetime`, `end_datetime`) VALUES 
(1, 1, '2026-03-10 09:00:00', '2026-03-10 12:00:00'),
(3, 3, '2026-03-15 13:00:00', '2026-03-15 15:00:00'),
(5, 4, '2026-03-22 10:00:00', '2026-03-22 11:00:00'),
(6, 5, '2026-04-05 09:30:00', '2026-04-05 10:30:00'),
(4, 2, '2026-04-12 14:00:00', '2026-04-12 16:00:00'),
(2, 2, '2026-04-20 10:00:00', '2026-04-20 13:00:00'),
(5, 6, '2026-06-15 11:00:00', '2026-06-15 12:00:00'),
(3, 10, '2026-07-01 10:00:00', '2026-07-01 12:00:00'),
(7, 7, '2026-05-14 10:00:00', '2026-05-14 13:00:00'),
(1, 8, '2026-06-02 14:00:00', '2026-06-02 17:00:00'),
(9, 4, '2026-08-10 10:00:00', '2026-08-10 12:00:00'),
(1, 2, '2026-09-05 10:00:00', '2026-09-05 13:00:00'), 
(2, 5, '2026-09-12 14:00:00', '2026-09-12 16:00:00'), 
(3, 1, '2026-09-20 09:00:00', '2026-09-20 11:00:00'), 
(4, 9, '2026-10-02 11:00:00', '2026-10-02 13:00:00'), 
(5, 3, '2026-10-15 15:00:00', '2026-10-15 16:00:00'), 
(6, 8, '2026-11-01 10:00:00', '2026-11-01 11:00:00'), 
(7, 1, '2026-11-10 13:00:00', '2026-11-10 16:00:00'), 
(8, 6, '2026-11-20 09:00:00', '2026-11-20 10:00:00'), 
(9, 10, '2026-12-05 14:00:00', '2026-12-05 15:00:00'),
(2, 7, '2026-12-12 10:00:00', '2026-12-12 12:00:00');
COMMIT;



--
-- Dumping data for table `team_audience`
--


SET autocommit=0;
INSERT INTO `team_audience` (`team_id`, `target_audience_id`) VALUES 
(1, 4), 
(1, 5), 
(2, 6), 
(3, 1), 
(4, 4), 
(5, 6), 
(6, 3), 
(7, 5), 
(8, 2), 
(9, 2), 
(10, 4);
COMMIT;



--
-- Dumping data for table `presentation_audience`
--


SET autocommit=0;
INSERT INTO `presentation_audience` (`presentation_id`, `target_audience_id`) VALUES 
(1, 4), 
(1, 6), 
(2, 6), 
(3, 4), 
(3, 5), 
(4, 1), 
(5, 6), 
(5, 3),
(6, 1), 
(6, 4), 
(7, 6),
(7, 7);
COMMIT;



--
-- Dumping data for table `expert_guide_audience`
--


SET autocommit=0;
INSERT INTO `expert_guide_audience` (`expert_guide_id`, `target_audience_id`) VALUES 
(1, 5), 
(2, 2), 
(3, 3), 
(4, 4), 
(5, 1), 
(1, 2),
(6, 4), 
(7, 8),
(8, 3),
(9, 7), 
(10, 8),
(11, 2),
(11, 3),
(3, 2),
(6, 5),
(2, 1),
(1,4);
COMMIT;