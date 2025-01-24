// Create Users Collection Table
db.Users.drop();
db.createCollection("Users");

db.Users.insert({
    UserID:  1,
    UserName: "Dr. Thu" ,
    Email: "thuta11@gmail.com",
    PhoneNo: "0943055941",  
    UserAddress: "Yadanarbon St, Kyi Myint Tine",
    DoctorDegree: "Doctor of Osteopathic Medicine (DO) degree" ,
    Speciality: "Dermatology",
    UserType: "Doctor"
});

db.Users.insert({
    UserID:  2,
    UserName: "Dr. Kaung" ,
    Email: "kaung97@gmail.com",
    PhoneNo: "09788100633",  
    UserAddress: "Thuzitar 6th St, Northoakkala",
    DoctorDegree: "Doctor of Dental Medicine (DMD) degree",
    Speciality: "Orthodontics",
    UserType: "Doctor"
});

db.Users.insert({
    UserID:  3,
    UserName: "Dr. Chit Thway" ,
    Email: "chitthway76@gmail.com",
    PhoneNo: "09457777554",  
    UserAddress: "Baho St, Sanchaung",
    DoctorDegree: "Doctor of Medicine (MD) degree",
    Speciality: "Gynecology",
    UserType: "Doctor"
});

db.Users.insert({
    UserID:  4,
    UserName: "Dr. Moe Htet" ,
    Email: "moehtet14@gmail.com",
    PhoneNo: "09799499049",  
    UserAddress: "Damathukha Kyaung st, Hlaing",
    DoctorDegree: "Doctor of Pharmacy (PharmD) degree",
    Speciality: "Psychiatric Pharmacy",
    UserType: "Doctor"
});


db.Users.insert({
    UserID:  101,
    UserName: "Soe Moe" ,
    Email: "soemoe13@gmail.com",
    PhoneNo: "09793470122",  
    UserAddress: "Thuta St, South Oakkalapa",
   UserType: "Patient"
});

db.Users.insert({
    UserID:  102,
    UserName: "Minkhant" ,
    Email: "minkhant65@gmail.com",
    PhoneNo: "09791770513",  
    UserAddress: "Bahan 3th St, Bahan",
   UserType: "Patient"
});

db.Users.insert({
    UserID:  103,
    UserName: "Phone Pyae" ,
    Email: "phonepyae43@gmail.com",
    PhoneNo: "09759032315",  
    UserAddress: "Phyar Pone St, Sanchaung",
   UserType: "Patient"
});

db.Users.insert({
    UserID:  104,
    UserName: "Kyaw Min" ,
    Email: "kyawmin23@gmail.com",
    PhoneNo: "09771000071",  
    UserAddress: "Min Dhama St, South Oakkala",
   UserType: "Patient"
});

db.Users.insert({
    UserID:  105,
    UserName: "Pyae Phyo" ,
    Email: "pyaephyo19@gmail.com",
    PhoneNo: "09967860651",  
    UserAddress: "Sabel St, Yankin",
   UserType: "Patient"
});

db.Users.insert({
    UserID:  106,
    UserName: "Kyaw Swar" ,
    Email: "kyawswar07@gmail.com",
    PhoneNo: "09259627475",  
    UserAddress: "Amayar St, North Oakkala",
   UserType: "Patient"
});

db.Users.insert({
    UserID:  107,
    UserName: "Lin Thike" ,
    Email: "linthike33@gmail.com",
    PhoneNo: "09420217641",  
    UserAddress: "May yu St, North Oakkala",
   UserType: "Patient"
});



// Create Appointment CollectionType 
db.Appointments.drop();
db.createCollection("Appointments");

db.Appointments.insert({

    AppointmentID: 1 ,
    AppointmentDate: ISODate("2023-05-01T00:00:00.000Z") ,
    AppointmentTime: ISODate("2023-05-01T00:17:30.000Z"),
    Status: "Completed",   
    DoctorId: 1 ,
    PatientId: 101
});

db.Appointments.insert({

    AppointmentID: 2 ,
    AppointmentDate: ISODate("2023-05-01T00:00:00.000Z") ,
    AppointmentTime: ISODate("2023-05-01T00:18:30.000Z"),
    Status: "Completed",   
    DoctorId: 1 ,
    PatientId: 102
});

db.Appointments.insert({

    AppointmentID: 3 ,
    AppointmentDate: ISODate("2023-05-01T00:00:00.000Z") ,
    AppointmentTime: ISODate("2023-05-01T00:19:30.000Z"),
    Status: "Completed",   
    DoctorId: 2 ,
    PatientId: 103
});

db.Appointments.insert({

    AppointmentID: 4 ,
    AppointmentDate: ISODate("2023-05-02T00:00:00.000Z") ,
    AppointmentTime: ISODate("2023-05-01T00:17:30.000Z"),
    Status: "Completed",   
    DoctorId: 2 ,
    PatientId: 104
});

db.Appointments.insert({

    AppointmentID: 5 ,
    AppointmentDate: ISODate("2023-05-02T00:00:00.000Z") ,
    AppointmentTime: ISODate("2023-05-01T00:18:30.000Z"),
    Status: "Completed",   
    DoctorId: 3 ,
    PatientId: 105
});

db.Appointments.insert({

    AppointmentID: 6 ,
    AppointmentDate: ISODate("2023-05-02T00:00:00.000Z") ,
    AppointmentTime: ISODate("2023-05-01T00:19:30.000Z"),
    Status: "Completed",   
    DoctorId: 3 ,
    PatientId: 106
});

db.Appointments.insert({

    AppointmentID: 7 ,
    AppointmentDate: ISODate("2023-05-02T00:00:00.000Z") ,
    AppointmentTime: ISODate("2023-05-01T00:20:30.000Z"),
    Status: "Completed",   
    DoctorId: 4 ,
    PatientId: 107
});



// Create Notifications CollectionType 
db.Notifications.drop();
db.createCollection("Notifications");

db.Notifications.insert({
    NotificationID: 1 ,
    Message: "The appointment has been confirmed." ,
    NotificationDate: ISODate("2023-05-01T00:00:00.000Z"),
    Status: "Read",   
    PatientId: 101
});

db.Notifications.insert({
    NotificationID: 2 ,
    Message: "The appointment has been confirmed." ,
    NotificationDate: ISODate("2023-05-01T00:00:00.000Z"),
    Status: "Read",   
    PatientId: 102
});

db.Notifications.insert({
    NotificationID: 3 ,
    Message: "The appointment has been confirmed." ,
    NotificationDate: ISODate("2023-05-01T00:00:00.000Z"),
    Status: "Read",   
    PatientId: 103
});

db.Notifications.insert({
    NotificationID: 4 ,
    Message: "The appointment has been confirmed." ,
    NotificationDate: ISODate("2023-05-02T00:00:00.000Z"),
    Status: "Read",   
    PatientId: 104
});

db.Notifications.insert({
    NotificationID: 5 ,
    Message: "The appointment has been confirmed." ,
    NotificationDate: ISODate("2023-05-02T00:00:00.000Z"),
    Status: "Read",   
    PatientId: 105
});

db.Notifications.insert({
    NotificationID: 6 ,
    Message: "The appointment has been confirmed." ,
    NotificationDate: ISODate("2023-05-02T00:00:00.000Z"),
    Status: "Read",   
    PatientId: 106
});

db.Notifications.insert({
    NotificationID: 7 ,
    Message: "The appointment has been confirmed." ,
    NotificationDate: ISODate("2023-05-02T00:00:00.000Z"),
    Status: "Read",   
    PatientId: 107
});



// Create MedicalRecord CollectionType 
db.MedicalRecord.drop();
db.createCollection("MedicalRecord");

db.MedicalRecord.insert({
    RecordID: 1 ,
    RecordDate: ISODate("2023-05-01T00:00:00.000Z"),
    Diagnosis: "Melanoma" ,
    Prescription: "Treatment Plan: Surgical excision followed by immunotherapy. Medication: Nivolumab 240mg IV every 2 weeks. Radiation therapy planned for lymph node involvement. Follow-up in 4 weeks for assessment.",   
    DoctorId:  1,
    PatientId: 101
});

db.MedicalRecord.insert({
    RecordID: 2 ,
    RecordDate: ISODate("2023-05-01T00:00:00.000Z"),
    Diagnosis: "Eczema (Atopic Dermatitis)" ,
    Prescription: "Medications: Topical Corticosteroid Cream; Triamcinolone 0.1% cream, apply a thin layer to affected areas once daily.",   
    DoctorId:  1,
    PatientId: 102
});

db.MedicalRecord.insert({
    RecordID: 3 ,
    RecordDate: ISODate("2023-05-01T00:00:00.000Z"),
    Diagnosis: "Malocclusion and Crowded Teeth" ,
    Prescription: "Orthodontic Treatment: Braces.",   
    DoctorId:  2,
    PatientId: 103
});

db.MedicalRecord.insert({
    RecordID: 4 ,
    RecordDate: ISODate("2023-05-02T00:00:00.000Z"),
    Diagnosis: "Overbite and Crossbite" ,
    Prescription: "Orthodontic Treatment: Functional Appliances, bite correctors.",   
    DoctorId:  2,
    PatientId: 104
});

db.MedicalRecord.insert({
    RecordID: 5 ,
    RecordDate: ISODate("2023-05-02T00:00:00.000Z"),
    Diagnosis: "Hypertension" ,
    Prescription: "Antihypertensive Medication: Amlodipine 5mg once daily.",   
    DoctorId:  3,
    PatientId: 105
});

db.MedicalRecord.insert({
    RecordID: 6 ,
    RecordDate: ISODate("2023-05-02T00:00:00.000Z"),
    Diagnosis: "Diabetes Mellitus" ,
    Prescription: "Oral Antidiabetic Medications: Metformin 500mg twice daily.",   
    DoctorId:  3,
    PatientId: 106
});

db.MedicalRecord.insert({
    RecordID: 7 ,
    RecordDate: ISODate("2023-05-02T00:00:00.000Z"),
    Diagnosis: "Major Depressive Disorder (MDD)" ,
    Prescription: "Antidepressant Medications: Selective Serotonin Reuptake Inhibitor (SSRI),Sertraline 50mg once daily.",   
    DoctorId:  4,
    PatientId: 107
});



// Create Payment CollectionType 
db.Payment.drop();
db.createCollection("Payment");

db.Payment.insert({
    PaymentID: 1 ,
    Amount: 45000,
    PaymentDate: ISODate("2023-05-01T00:00:00.000Z"),
    Status: "Processed",   
    PatientId: 101
});

db.Payment.insert({
    PaymentID: 2 ,
    Amount: 60000,
    PaymentDate: ISODate("2023-05-01T00:00:00.000Z"),
    Status: "Processed",   
    PatientId: 102
});

db.Payment.insert({
    PaymentID: 3 ,
    Amount: 70000,
    PaymentDate: ISODate("2023-05-01T00:00:00.000Z"),
    Status: "Processed",   
    PatientId: 103
});

db.Payment.insert({
    PaymentID: 4 ,
    Amount: 55000,
    PaymentDate: ISODate("2023-05-02T00:00:00.000Z"),
    Status: "Processed",   
    PatientId: 104
});

db.Payment.insert({
    PaymentID: 5 ,
    Amount: 85000,
    PaymentDate: ISODate("2023-05-02T00:00:00.000Z"),
    Status: "Processed",   
    PatientId: 105
});

db.Payment.insert({
    PaymentID: 6 ,
    Amount: 75000,
    PaymentDate: ISODate("2023-05-02T00:00:00.000Z"),
    Status: "Processed",   
    PatientId: 106
});

db.Payment.insert({
    PaymentID: 7 ,
    Amount: 99000,
    PaymentDate: ISODate("2023-05-02T00:00:00.000Z"),
    Status: "Processed",   
    PatientId: 107
});







