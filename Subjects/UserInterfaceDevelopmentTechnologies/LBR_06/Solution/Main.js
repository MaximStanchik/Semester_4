"use strict";
//----------Task_1----------//
;
const array = [
    { id: 1, name: 'Vasya', group: 10 },
    { id: 2, name: 'Ivan', group: 11 },
    { id: 3, name: 'Masha', group: 12 },
    { id: 4, name: 'Petya', group: 10 },
    { id: 5, name: 'Kira', group: 11 },
];
let car = {}; //объект создан!
car.manufacturer = "manufacturer";
car.model = 'model';
console.log(car.manufacturer);
console.log(car.model);
//----------Task_3----------//
const car1 = {}; //объект создан!
car1.manufacturer = "manufacturer";
car1.model = 'model';
const car2 = {}; //объект создан!
car2.manufacturer = "manufacturer";
car2.model = 'model';
const arrayCars = [
    { cars: [car1, car2] }
];
console.log(arrayCars);
let student_1 = {
    id: 1111,
    name: "Max",
    group: 4,
    marks: [{ subject: "Maths", mark: 10, done: true }, { subject: "English", mark: 10, done: true }]
};
let student_2 = {
    id: 2222,
    name: "Ivan",
    group: 1,
    marks: [{ subject: "Maths", mark: 2, done: true }, { subject: "English", mark: 1, done: false }]
};
let student_3 = {
    id: 3333,
    name: "Aleksey",
    group: 2,
    marks: [{ subject: "Maths", mark: 6, done: true }, { subject: "English", mark: 8, done: true }]
};
const studentsFromCours = {
    students: [student_1, student_2, student_3],
    studentsFilter(group) {
        let filteredStudents = [];
        const numbersOfStudents = this.students.length;
        for (let i = 0; i < numbersOfStudents - 1; i++) {
            if (this.students[i].group == group) {
                filteredStudents.push(this.students[i]);
            }
            else {
                continue;
            }
        }
        for (let m = 0; m < filteredStudents.length; m++) {
            console.log("Отсортированные по группе студенты:" + filteredStudents[m]);
        }
        return filteredStudents;
    },
    marksFilter(mark) {
        let filteredStudents = [];
        const numbersOfStudents = this.students.length;
        for (let i = 0; i < numbersOfStudents - 1; i++) {
            for (let j = 0; j < this.students[i].marks.length; j++) {
                if (this.students[i].marks[j].mark == mark) {
                    filteredStudents.push(this.students[i]);
                }
                else {
                    continue;
                }
            }
        }
        for (let m = 0; m < filteredStudents.length; m++) {
            console.log("Отсортированные по группе студенты:" + filteredStudents[m]);
        }
        return filteredStudents;
    },
    deleteStudent(id) {
        const numbersOfStudents = this.students.length;
        for (let i = 0; i < numbersOfStudents - 1; i++) {
            if (this.students[i].id == id) {
                this.students.splice(i, 1);
                console.log("Student with id " + id + " successfully deleted");
                break;
            }
            else {
                continue;
            }
        }
    }
};
console.log(studentsFromCours.studentsFilter(4));
console.log(studentsFromCours.marksFilter(10));
studentsFromCours.deleteStudent(2222);
