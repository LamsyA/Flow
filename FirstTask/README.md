# Student Contract

This contract defines a `Student` data structure and functionalities related to managing student information and courses.

## Student Structure

### `StudentId`

A `StudentId` structure holds information about a student's department and score.

- `department`: A string representing the department the student belongs to.
- `score`: An integer representing the student's score.

## State Variables

- `courses`: An array of strings representing the courses available.
- `student`: A mapping where the key is the student's name (string) and the value is a `StudentId` struct containing the student's department and score.

## Functions

### `addCourse`

Adds a course to the list of available courses.

- Parameters:
  - `name`: Name of the course to be added (string).

### `addStudent`

Adds a new student to the contract.

- Parameters:
  - `name`: Name of the student (string).
  - `department`: Department the student belongs to (string).
  - `score`: Score of the student (integer).

### Modifiers

#### `pre`

Checks if the provided course exists before adding a student.

## Initialization

Initializes the contract with empty arrays for courses and an empty mapping for students.

## Usage

1. **Adding Courses**: Use the `addCourse` function to add courses to the contract.

```cadence
Student.addCourse("Math")
```

2. **Adding Students**: Use the `addStudent` function to add students to the contract.

```cadence
Student.addStudent("Alice", "Mathematics", 85)
```

3. **Accessing Student Information**: Access student information via the `student` mapping.

```cadence
let studentInfo = Student.student["Alice"]
```

## Note

- Ensure courses are added before attempting to add students.
- Departments and scores are passed as parameters when adding a student.
- Existing courses are checked before adding a student to ensure data integrity.
