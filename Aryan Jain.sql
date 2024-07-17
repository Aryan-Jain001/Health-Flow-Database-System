CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE NOT NULL,
    ContactNumber VARCHAR(20) UNIQUE NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Gender VARCHAR(10) NOT NULL,
    Address TEXT,
    InsuranceID INT);
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Specialty VARCHAR(50) NOT NULL,
    ContactNumber VARCHAR(20) UNIQUE NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Gender VARCHAR(10) NOT NULL,
    LicenseNumber VARCHAR(20) UNIQUE);
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentDate DATE NOT NULL,
    AppointmentTime TIME NOT NULL,
    Status VARCHAR(20) NOT NULL,
    Notes TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);
CREATE TABLE Treatments (
    TreatmentID INT PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    TreatmentDate DATE NOT NULL,
    Diagnosis VARCHAR(255) NOT NULL,
    Medication VARCHAR(255) NOT NULL,
    Notes TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL,
    HeadDoctorID INT,
    Location VARCHAR(255),
    Description TEXT,
    FOREIGN KEY (HeadDoctorID) REFERENCES Doctors(DoctorID)
);
CREATE TABLE MedicalTests (
    TestID INT PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    TestDate DATE NOT NULL,
    TestType VARCHAR(100) NOT NULL,
    Results TEXT,
    Comments TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);
CREATE TABLE Prescriptions (
    PrescriptionID INT PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    PrescriptionDate DATE NOT NULL,
    Medication VARCHAR(255) NOT NULL,
    Dosage VARCHAR(50) NOT NULL,
    Instructions TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);
CREATE TABLE InsuranceInformation (
    InsuranceID INT PRIMARY KEY,
    PatientID INT NOT NULL,
    InsuranceProvider VARCHAR(100) NOT NULL,
    PolicyNumber VARCHAR(50) NOT NULL,
    CoverageType VARCHAR(50) NOT NULL,
    ExpiryDate DATE NOT NULL,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

INSERT INTO Patients (PatientID, FirstName, LastName, DateOfBirth, ContactNumber, Email, Gender, Address, InsuranceID)
VALUES
    (1, 'Ramesh', 'Kumar', '1990-01-15', '123-456-7890', 'rameshkumar@gmail.com', 'Male', '123 Main St, Cityville', 101),
    (2, 'Sunita', 'Rai', '1985-05-22', '987-654-3210', 'sunitarai12@gmail.com', 'Female', '456 Oak St, Townburg', 102),
    (3, 'Rahul', 'Verma', '1978-09-10', '555-123-4567', 'rahulv322@yahoo.in', 'Male', '789 Elm St, Villagetown', 103),
    (4, 'Priyanka', 'Mehra', '1995-03-18', '333-999-8888', 'priyankamehra@rediffmail.com', 'Female', '101 Pine St, Suburbia', 104),
    (5, 'Seema', 'Sharma', '1980-12-05', '111-777-2222', 'seemasharma001@mail.com', 'Female', '222 Cedar St, Outskirts', 105),
    (6, 'Ajay', 'Singh', '1992-06-30', '666-444-5555', 'ajaysingh456@gmail.com', 'Male', '303 Oak St, Countryside', 106),
    (7, 'David', 'Wilson', '1987-11-28', '777-888-9999', 'david.wilson@email.com', 'Male', '404 Maple St, Farmland', 107);
    
INSERT INTO Doctors (DoctorID, FirstName, LastName, Specialty, ContactNumber, Email, Gender, LicenseNumber)
VALUES
    (1, 'Dr. Amit', 'Sharma', 'Cardiology', '111-222-3333', 'amitsharma@gmail.com', 'Male', 'MD12345'),
    (2, 'Dr. Priya', 'Verma', 'Orthopedics', '444-555-6666', 'priyaverma@yahoo.com', 'Female', 'MD67890'),
    (3, 'Dr. Rajesh', 'Patel', 'Dermatology', '777-888-5555', 'rajpatel@gmail.com', 'Male', 'MD11223'),
    (4, 'Dr. Anjali', 'Desai', 'Neurology', '333-666-9999', 'desaianjali@gmail.com', 'Female', 'MD44556'),
    (5, 'Dr. Neha', 'Gupta', 'Pediatrics', '888-777-4444', 'nehagupta@iclud.com', 'Female', 'MD77889'),
    (6, 'Dr. Olivia', 'Jones', 'Oncology', '222-555-1111', 'olivia.jones@email.com', 'Female', 'MD33445'),
    (7, 'Dr. Matthew', 'Evans', 'Gastroenterology', '555-999-3333', 'matthew.evans@email.com', 'Male', 'MD55667');
    
INSERT INTO Appointments (AppointmentID, PatientID, DoctorID, AppointmentDate, AppointmentTime, Status, Notes)
VALUES
    (1, 1, 1, '2023-01-20', '10:00:00', 'Confirmed', 'Follow-up for cardiac checkup'),
    (2, 2, 2, '2023-02-15', '14:30:00', 'Pending', 'Orthopedic consultation'),
    (3, 3, 3, '2023-03-10', '09:45:00', 'Confirmed', 'Dermatology appointment'),
    (4, 4, 4, '2023-04-05', '11:15:00', 'Pending', 'Neurology consultation'),
    (5, 5, 5, '2023-05-22', '15:30:00', 'Confirmed', 'Pediatrics follow-up'),
    (6, 6, 6, '2023-06-18', '13:00:00', 'Pending', 'Oncology checkup'),
    (7, 7, 7, '2023-07-12', '08:30:00', 'Confirmed', 'Gastroenterology appointment');
    
INSERT INTO Treatments (TreatmentID, PatientID, DoctorID, TreatmentDate, Diagnosis, Medication, Notes)
VALUES
    (1, 1, 1, '2023-01-22', 'Hypertension', 'MedA', 'Prescribed medication for hypertension'),
    (2, 2, 2, '2023-02-18', 'Fractured Arm', 'MedB', 'Orthopedic treatment for fractured arm'),
    (3, 3, 3, '2023-03-12', 'Skin Condition', 'MedC', 'Dermatology treatment for skin issue'),
    (4, 4, 4, '2023-04-08', 'Neurological Disorder', 'MedD', 'Neurology treatment for neurological disorder'),
    (5, 5, 5, '2023-05-25', 'Pediatric Checkup', 'MedE', 'Pediatrics routine checkup'),
    (6, 6, 6, '2023-06-20', 'Oncology Treatment', 'MedF', 'Oncology treatment plan'),
    (7, 7, 7, '2023-07-15', 'Digestive Issues', 'MedG', 'Gastroenterology treatment for digestive issues');
    
INSERT INTO Departments (DepartmentID, DepartmentName, HeadDoctorID, Location, Description)
VALUES
    (1, 'Cardiology', 1, 'East Wing', 'Specialized in heart-related issues'),
    (2, 'Orthopedics', 2, 'West Wing', 'Deals with musculoskeletal issues'),
    (3, 'Dermatology', 3, 'North Wing', 'Focuses on skin-related conditions'),
    (4, 'Neurology', 4, 'South Wing', 'Specialized in neurological disorders'),
    (5, 'Pediatrics', 5, 'Children Wing', 'Dedicated to pediatric care'),
    (6, 'Oncology', 6, 'Cancer Center', 'Specialized in cancer treatment'),
    (7, 'Gastroenterology', 7, 'Digestive Health Wing', 'Deals with digestive system issues');
    
INSERT INTO MedicalTests (TestID, PatientID, DoctorID, TestDate, TestType, Results, Comments)
VALUES
    (1, 1, 1, '2023-01-25', 'ECG', 'Normal', 'Routine cardiac test'),
    (2, 2, 2, '2023-02-20', 'X-Ray', 'Fracture detected', 'Orthopedic imaging'),
    (3, 3, 3, '2023-03-15', 'Skin Biopsy', 'Inconclusive', 'Dermatology skin biopsy'),
    (4, 4, 4, '2023-04-10', 'MRI', 'Neurological disorder detected', 'Neurology MRI scan'),
    (5, 5, 5, '2023-05-28', 'Blood Test', 'Normal', 'Pediatrics routine blood test'),
    (6, 6, 6, '2023-06-25', 'CT Scan', 'Staging of cancer', 'Oncology CT scan'),
    (7, 7, 7, '2023-07-20', 'Endoscopy', 'Digestive issues identified', 'Gastroenterology endoscopy');
    
INSERT INTO Prescriptions (PrescriptionID, PatientID, DoctorID, PrescriptionDate, Medication, Dosage, Instructions)
VALUES
    (1, 1, 1, '2023-01-22', 'MedA', '1 pill daily', 'Take with meals'),
    (2, 2, 2, '2023-02-18', 'MedB', 'As directed', 'Follow orthopedic instructions'),
    (3, 3, 3, '2023-03-15', 'MedC', 'As prescribed', 'Follow dermatology instructions'),
    (4, 4, 4, '2023-04-10', 'MedD', 'As prescribed', 'Follow neurology instructions'),
    (5, 5, 5, '2023-05-28', 'MedE', 'As prescribed', 'Follow pediatric instructions'),
    (6, 6, 6, '2023-06-25', 'MedF', 'As prescribed', 'Follow oncology instructions'),
    (7, 7, 7, '2023-07-20', 'MedG', 'As prescribed', 'Follow gastroenterology instructions');
    
INSERT INTO InsuranceInformation (InsuranceID, PatientID, InsuranceProvider, PolicyNumber, CoverageType, ExpiryDate)
VALUES
    (101, 1, 'United Care', 'ABC123', 'Health', '2024-12-31'),
    (102, 2, 'Health First', 'XYZ456', 'Health', '2023-10-15'),
    (103, 3, 'Wellness Plus', 'PQR789', 'Health', '2023-12-01'),
    (104, 4, 'CuraCare', 'LMN101', 'Health', '2024-05-20'),
    (105, 5, 'Secure Health', 'EFG202', 'Health', '2023-08-18'),
    (106, 6, 'Quality Care', 'HIJ303', 'Health', '2024-02-28'),
    (107, 7, 'PrimeHealth', 'UVW404', 'Health', '2023-11-10');
    
-- Purpose: Retrieve a patient's medical history, including treatments, tests, and prescriptions.
SELECT Patients.FirstName, Patients.LastName, Treatments.TreatmentDate, MedicalTests.TestDate, Prescriptions.PrescriptionDate
FROM Patients
LEFT JOIN Treatments ON Patients.PatientID = Treatments.PatientID
LEFT JOIN MedicalTests ON Patients.PatientID = MedicalTests.PatientID
LEFT JOIN Prescriptions ON Patients.PatientID = Prescriptions.PatientID;

-- Purpose: Get detailed information about patients along with their upcoming appointments.
SELECT Patients.FirstName, Patients.LastName, Patients.DateOfBirth, Appointments.AppointmentDate, Appointments.AppointmentTime
FROM Patients
LEFT JOIN Appointments ON Patients.PatientID = Appointments.PatientID;


-- Purpose: Identify patients with expired insurance policies.
SELECT Patients.FirstName, Patients.LastName, InsuranceInformation.ExpiryDate
FROM Patients
INNER JOIN InsuranceInformation ON Patients.PatientID = InsuranceInformation.PatientID
WHERE InsuranceInformation.ExpiryDate < CURDATE();

-- Purpose: Identify patients awaiting medical test results.
SELECT Patients.FirstName, Patients.LastName, MedicalTests.TestDate, MedicalTests.Results
FROM Patients
LEFT JOIN MedicalTests ON Patients.PatientID = MedicalTests.PatientID
WHERE MedicalTests.Results IS NULL AND MedicalTests.TestDate <= CURDATE();

-- Purpose: Identify patients eligible for upcoming medical tests based on their medical history.
SELECT Patients.FirstName, Patients.LastName, MedicalTests.TestDate, MedicalTests.TestType
FROM Patients
LEFT JOIN MedicalTests ON Patients.PatientID = MedicalTests.PatientID
WHERE MedicalTests.TestDate IS NULL OR MedicalTests.TestDate > CURDATE();

-- Purpose: Display a list of doctors along with their respective departments.
SELECT Doctors.FirstName, Doctors.LastName, Doctors.Specialty, Departments.DepartmentName
FROM Doctors
LEFT JOIN Departments ON Doctors.DoctorID = Departments.HeadDoctorID;

-- Purpose: Categorize patients into age groups for demographic analysis.
SELECT
    Patients.FirstName,
    Patients.LastName,
    CASE
        WHEN TIMESTAMPDIFF(YEAR, Patients.DateOfBirth, CURDATE()) BETWEEN 0 AND 18 THEN 'Child'
        WHEN TIMESTAMPDIFF(YEAR, Patients.DateOfBirth, CURDATE()) BETWEEN 19 AND 40 THEN 'Adult'
        WHEN TIMESTAMPDIFF(YEAR, Patients.DateOfBirth, CURDATE()) BETWEEN 41 AND 65 THEN 'Middle-aged'
        ELSE 'Senior'
    END AS AgeGroup
FROM Patients;

-- Purpose: Display each doctor's specialty along with the count of patients they are treating.
SELECT Doctors.FirstName, Doctors.LastName, Doctors.Specialty, COUNT(Appointments.AppointmentID) AS PatientCount
FROM Doctors
LEFT JOIN Appointments ON Doctors.DoctorID = Appointments.DoctorID
GROUP BY Doctors.FirstName, Doctors.LastName, Doctors.Specialty;































