CREATE TABLE Squad
(
	squadID INTEGER PRIMARY KEY REFERENCES Student(studentID) ON DELETE CASCADE,
	Code INTEGER,
	Squad_name TEXT,
	University TEXT,
	CHECK (University = 'СурГУ' OR
					   University = 'ЮрГУ' OR
					   University = 'ТюмНГУ')
);

CREATE TABLE Student
(
	studentID INTEGER PRIMARY KEY,
	Surname TEXT,
	St_name TEXT,
	Lastname TEXT,
	Well INTEGER,
	Squad_number INTEGER
);

CREATE TABLE Work_Objects
(
	workObjID INTEGER PRIMARY KEY REFERENCES Squad (squadID) ON DELETE RESTRICT,
	Date_Work DATE,
	Name_Object TEXT,
	Squad_number INTEGER,
	Percentage_of_completion INTEGER,
	 CHECK (Percentage_of_completion >= 0 AND
		   			   Percentage_of_completion <= 100)
);


CREATE TABLE StudentSquad
(
	squadID INTEGER REFERENCES Squad (squadID),
	studentID INTEGER REFERENCES Student (studentID),
	workObjID INTEGER  REFERENCES Work_Objects (workObjID)
);
