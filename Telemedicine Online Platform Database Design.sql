-- Drop existing objects if they exist
DROP TABLE Users CASCADE CONSTRAINTS;
DROP TABLE Appointments CASCADE CONSTRAINTS;
DROP TABLE Payment CASCADE CONSTRAINTS;
DROP TABLE MedicalRecord CASCADE CONSTRAINTS;
DROP TABLE Notifications CASCADE CONSTRAINTS;

DROP TYPE UserType FORCE;
DROP TYPE AppointmentType FORCE;
DROP TYPE NotificationType FORCE;
DROP TYPE MedicalRecordType FORCE;
DROP TYPE PaymentType FORCE;

COMMIT;

CREATE TYPE UserType AS OBJECT
(
    UserID NUMBER(5),
    UserName VARCHAR2(50),
    Email VARCHAR2(30),
    PhoneNo VARCHAR2(20),  
    UserAddress VARCHAR2(50)
)NOT FINAL;
/
-- Commit after creating PatientType
COMMIT;

CREATE TABLE Users of UserType
(
UserID Primary Key
);
COMMIT;

-- Create PatientType (Inheritance)
CREATE TYPE PatientType UNDER UserType
();
/


-- Create DoctorType (Inheritance)
CREATE TYPE DoctorType UNDER UserType
(   DoctorDegree VARCHAR2(100),
    Speciality VARCHAR2(20)  

);
/
COMMIT;


INSERT INTO Users VALUES (DoctorType(1, 'Dr. Thu', 'thuta11@gmail.com', '0943055941', 'Yadanarbon St, Kyi Myint Tine', 'Doctor of Osteopathic Medicine (DO) degree','Dermatology'));
INSERT INTO Users VALUES (DoctorType(2, 'Dr. Kaung', 'kaung97@gmail.com', '09788100633', 'Thuzitar 6th St, Northoakkala', 'Doctor of Dental Medicine (DMD) degree','Orthodontics'));
INSERT INTO Users VALUES (DoctorType(3, 'Dr. Chit Thway', 'chitthway76@gmail.com', '09457777554', 'Baho St, Sanchaung', 'Doctor of Medicine (MD) degree','Gynecology'));
INSERT INTO Users VALUES (DoctorType(4, 'Dr. Moe Htet', 'moehtet14@gmail.com', '09799499049', 'Damathukha Kyaung st, Hlaing', 'Doctor of Pharmacy (PharmD) degree','Psychiatric Pharmacy'));

INSERT INTO Users VALUES (PatientType(101, 'Soe Moe', 'soemoe13@gmail.com', '09793470122', 'Thuta St, South Oakkalapa'));
INSERT INTO Users VALUES (PatientType(102, 'Minkhant', 'minkhant65@gmail.com', '09791770513', 'Bahan 3th St, Bahan'));
INSERT INTO Users VALUES (PatientType(103, 'Phone Pyae', 'phonepyae43@gmail.com', '09759032315', 'Phyar Pone St, Sanchaung'));
INSERT INTO Users VALUES (PatientType(104, 'Kyaw Min', 'kyawmin23@gmail.com', '09771000071', 'Min Dhama St, South Oakkala'));
INSERT INTO Users VALUES (PatientType(105, 'Pyae Phyo', 'pyaephyo19@gmail.com', '09967860651', 'Sabel St, Yankin'));
INSERT INTO Users VALUES (PatientType(106, 'Kyaw Swar', 'kyawswar07@gmail.com', '09259627475', 'Amayar St, North Oakkala'));
INSERT INTO Users VALUES (PatientType(107, 'Lin Thike', 'linthike33@gmail.com', '09420217641', 'May yu St, North Oakkala'));


COMMIT;


-- Create AppointmentType (Composition)
CREATE TYPE AppointmentType AS OBJECT
(
    AppointmentID NUMBER(5),
    AppointmentDate DATE, -- Use DATE data type for storing date and time
    AppointmentTime interval day to second,
    Status VARCHAR2(20),   
    DoctorId REF UserType,
    PatientId REF UserType
);
/
COMMIT;

CREATE TABLE Appointments OF AppointmentType
(
  AppointmentId Primary Key
);
-- Commit after creating AppointmentType
COMMIT;


-- Insert data into Appointments table
INSERT INTO Appointments VALUES (1, 
'01-MAY-2023', 
INTERVAL '0 17:30:0' DAY TO SECOND, 
'Completed',
(SELECT REF(d) FROM Users d WHERE d.UserID = 1),
(SELECT REF(p) FROM Users p WHERE p.UserID = 101)
);   

INSERT INTO Appointments VALUES (2, 
'01-MAY-2023', 
INTERVAL '0 18:30:0' DAY TO SECOND, 
'Completed',
(SELECT REF(d) FROM Users d WHERE d.UserID = 1),
(SELECT REF(p) FROM Users p WHERE p.UserID = 102)
); 

INSERT INTO Appointments VALUES (3, 
'01-MAY-2023', 
INTERVAL '0 19:30:0' DAY TO SECOND, 
'Completed',
(SELECT REF(d) FROM Users d WHERE d.UserID = 2),
(SELECT REF(p) FROM Users p WHERE p.UserID = 103)
);   

INSERT INTO Appointments VALUES (4, 
'02-MAY-2023', 
INTERVAL '0 17:30:0' DAY TO SECOND, 
'Completed',
(SELECT REF(d) FROM Users d WHERE d.UserID = 2),
(SELECT REF(p) FROM Users p WHERE p.UserID = 104)
); 

INSERT INTO Appointments VALUES (5, 
'02-MAY-2023', 
INTERVAL '0 18:30:0' DAY TO SECOND, 
'Completed',
(SELECT REF(d) FROM Users d WHERE d.UserID = 3),
(SELECT REF(p) FROM Users p WHERE p.UserID = 105)
);   

INSERT INTO Appointments VALUES (6, 
'02-MAY-2023', 
INTERVAL '0 19:30:0' DAY TO SECOND, 
'Completed',
(SELECT REF(d) FROM Users d WHERE d.UserID = 3),
(SELECT REF(p) FROM Users p WHERE p.UserID = 106)
); 

INSERT INTO Appointments VALUES (7, 
'02-MAY-2023', 
INTERVAL '0 20:30:0' DAY TO SECOND, 
'Completed',
(SELECT REF(d) FROM Users d WHERE d.UserID = 4),
(SELECT REF(p) FROM Users p WHERE p.UserID = 107)
);                                 
COMMIT;


CREATE TYPE NotificationType AS OBJECT
(
    NotificationID NUMBER(5),
    Message VARCHAR2(50),
    NotificationDate DATE,
    Status VARCHAR2(20), 
    PatientId REF UserType
);
/
COMMIT;

CREATE TABLE Notifications OF NotificationType
(
  NotificationID Primary Key
);
-- Commit after creating NotificationType
COMMIT;


INSERT INTO Notifications VALUES (
    1,
    'The appointment has been confirmed.',
    '01-MAY-2023',
    'Read',
     (SELECT REF(p) FROM Users p WHERE p.UserID = 101)
);

INSERT INTO Notifications VALUES (
    2,
    'The appointment has been confirmed.',
     '01-MAY-2023',
    'Read',
    (SELECT REF(p) FROM Users p WHERE p.UserID = 102)
);

INSERT INTO Notifications VALUES (
    3,
    'The appointment has been confirmed.',
    '01-MAY-2023',
    'Read',
     (SELECT REF(p) FROM Users p WHERE p.UserID = 103)
);

INSERT INTO Notifications VALUES (
    4,
    'The appointment has been confirmed.',
     '02-MAY-2023',
    'Read',
    (SELECT REF(p) FROM Users p WHERE p.UserID = 104)
);

INSERT INTO Notifications VALUES (
    5,
    'The appointment has been confirmed.',
    '02-MAY-2023',
    'Read',
     (SELECT REF(p) FROM Users p WHERE p.UserID = 105)
);

INSERT INTO Notifications VALUES (
    6,
    'The appointment has been confirmed.',
     '02-MAY-2023',
    'Read',
    (SELECT REF(p) FROM Users p WHERE p.UserID = 106)
);

INSERT INTO Notifications VALUES (
    7,
    'The appointment has been confirmed.',
     '02-MAY-2023',
    'Read',
    (SELECT REF(p) FROM Users p WHERE p.UserID = 107)
);
COMMIT;


CREATE TYPE MedicalRecordType AS OBJECT
(
    RecordID NUMBER(5),
    RecordDate DATE,
    Diagnosis VARCHAR2(100),
    Prescription VARCHAR2(500),
    
    DoctorId REF UserType,
    PatientId REF UserType
);
/

COMMIT;


CREATE TABLE MedicalRecord OF MedicalRecordType
(
  RecordId Primary Key
);
-- Commit after creating MedicalRecordType
COMMIT;


INSERT INTO MedicalRecord VALUES (1, 
'01-MAY-2023', 
'Melanoma',  
'Treatment Plan: Surgical excision followed by immunotherapy. Medication: Nivolumab 240mg IV every 2 weeks. Radiation therapy planned for lymph node involvement. Follow-up in 4 weeks for assessment.',
(SELECT REF(d) FROM Users d WHERE d.UserID = 1),
(SELECT REF(p) FROM Users p WHERE p.UserID = 101)
);
INSERT INTO MedicalRecord VALUES (2, 
'01-MAY-2023', 
'Eczema (Atopic Dermatitis)', 
'Medications: Topical Corticosteroid Cream; Triamcinolone 0.1% cream, apply a thin layer to affected areas once daily.',
(SELECT REF(d) FROM Users d WHERE d.UserID = 1),
(SELECT REF(p) FROM Users p WHERE p.UserID = 102)
);
INSERT INTO MedicalRecord VALUES (3, 
'01-MAY-2023', 
'Malocclusion and Crowded Teeth',  
'Orthodontic Treatment: Braces.',
(SELECT REF(d) FROM Users d WHERE d.UserID = 2),
(SELECT REF(p) FROM Users p WHERE p.UserID = 103)
);
INSERT INTO MedicalRecord VALUES (4, 
'02-MAY-2023', 
'Overbite and Crossbite', 
'Orthodontic Treatment: Functional Appliances, bite correctors.',
(SELECT REF(d) FROM Users d WHERE d.UserID = 2),
(SELECT REF(p) FROM Users p WHERE p.UserID = 104)
);
INSERT INTO MedicalRecord VALUES (5, 
'02-MAY-2023', 
'Hypertension',  
'Antihypertensive Medication: Amlodipine 5mg once daily.',
(SELECT REF(d) FROM Users d WHERE d.UserID = 3),
(SELECT REF(p) FROM Users p WHERE p.UserID = 105)
);
INSERT INTO MedicalRecord VALUES (6, 
'02-MAY-2023', 
'Diabetes Mellitus', 
'Oral Antidiabetic Medications: Metformin 500mg twice daily.',
(SELECT REF(d) FROM Users d WHERE d.UserID = 3),
(SELECT REF(p) FROM Users p WHERE p.UserID = 106)
);
INSERT INTO MedicalRecord VALUES (7, 
'02-MAY-2023', 
'Major Depressive Disorder (MDD)', 
'Antidepressant Medications: Selective Serotonin Reuptake Inhibitor (SSRI),Sertraline 50mg once daily.',
(SELECT REF(d) FROM Users d WHERE d.UserID = 4),
(SELECT REF(p) FROM Users p WHERE p.UserID = 107)
);
COMMIT;




-- Create PaymentType (Composition)
CREATE TYPE PaymentType AS OBJECT
(
    PaymentID NUMBER(5),
    Amount NUMBER(6),
    PaymentDate DATE,
    Status VARCHAR2(20),   
    PatientId REF UserType
);
/
COMMIT;

CREATE TABLE Payment OF PaymentType
(
  PaymentId Primary Key
);
-- Commit after creating PaymentType
COMMIT;

-- Insert data into Payment table
INSERT INTO Payment VALUES (1, 45000, '01-MAY-2023', 'Processed', (SELECT REF(p) FROM Users p WHERE p.UserID = 101));
INSERT INTO Payment VALUES (2, 60000, '01-MAY-2023', 'Processed', (SELECT REF(p) FROM Users p WHERE p.UserID = 102));
INSERT INTO Payment VALUES (3, 70000, '01-MAY-2023', 'Processed', (SELECT REF(p) FROM Users p WHERE p.UserID = 103));
INSERT INTO Payment VALUES (4, 55000, '02-MAY-2023', 'Processed', (SELECT REF(p) FROM Users p WHERE p.UserID = 104));
INSERT INTO Payment VALUES (5, 85000, '02-MAY-2023', 'Processed', (SELECT REF(p) FROM Users p WHERE p.UserID = 105));
INSERT INTO Payment VALUES (6, 75000, '02-MAY-2023', 'Processed', (SELECT REF(p) FROM Users p WHERE p.UserID = 106));
INSERT INTO Payment VALUES (7, 99000, '02-MAY-2023', 'Processed', (SELECT REF(p) FROM Users p WHERE p.UserID = 107));
COMMIT;





    











    
    
    
    



  











    






