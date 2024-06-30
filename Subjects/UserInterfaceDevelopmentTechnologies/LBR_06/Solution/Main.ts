//----------Task_1----------//

interface IArray_1 {
    id: number, 
    name: string,
    group: number
};

const array: Array<IArray_1> = [
    {id: 1, name: 'Vasya', group: 10}, 
    {id: 2, name: 'Ivan', group: 11},
    {id: 3, name: 'Masha', group: 12},
    {id: 4, name: 'Petya', group: 10},
    {id: 5, name: 'Kira', group: 11},
];

//----------Task_2----------//

type CarsType = {
    manufacturer?: string,
    model?:string
};

let car: CarsType = {}; //объект создан!
car.manufacturer = "manufacturer";
car.model = 'model';

console.log (car.manufacturer);
console.log (car.model);

//----------Task_3----------//

const car1: CarsType = {}; //объект создан!
car1.manufacturer = "manufacturer";
car1.model = 'model';

const car2: CarsType = {}; //объект создан!
car2.manufacturer = "manufacturer";
car2.model = 'model';

type ArrayCarsType = {
    cars: CarsType[]
};

const arrayCars: ArrayCarsType[] = [
    {cars: [car1, car2]}
];

console.log(arrayCars);

//----------Task_4----------//

type MarkFilterType = 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 ;

type GroupFilterType  =  MarkFilterType | 11 | 12 ;

type DoneType = boolean;

type MarkType = {
    subject: string,
    mark: MarkFilterType, // может принимать значения от 1 до 10
    done: DoneType,
}
type StudentType = {
    id: number,
    name: string,
    group: GroupFilterType, // может принимать значения от 1 до 12
    marks: Array<MarkType>,
}

type GroupType = {
    students: StudentType[],
    studentsFilter: (group: number) => Array<StudentType>, // фильтр по группе
    marksFilter: (mark: number) => Array<StudentType>, // фильтр по  оценке
    deleteStudent: (id: number) => void, // удалить студента по id из  исходного массива
    mark?: MarkFilterType,
    group?: GroupFilterType,
}


let student_1: StudentType = {
    id: 1111,
    name: "Max",
    group: 4,
    marks: [{subject: "Maths", mark: 10, done: true}, {subject: "English", mark: 10, done: true}]
};

let student_2: StudentType = {
    id: 2222,
    name: "Ivan",
    group: 1,
    marks: [{subject: "Maths", mark: 2, done: true}, {subject: "English", mark: 1, done: false}]
};

let student_3: StudentType = {
    id: 3333,
    name: "Aleksey",
    group: 2,
    marks: [{subject: "Maths", mark: 6, done: true}, {subject: "English", mark: 8, done: true}]
};

const studentsFromCours: GroupType = {

    students: [student_1, student_2, student_3],

    studentsFilter (group: number): Array<StudentType> {

        let filteredStudents: Array<StudentType> = [];
        const numbersOfStudents: number = this.students.length;

        for (let i: number = 0; i < numbersOfStudents - 1; i++) {
            if (this.students[i].group == group) { 
                filteredStudents.push(this.students[i]);
            }
            else {
                continue;
            }
        }

        for (let m: number = 0; m < filteredStudents.length; m++) {
        console.log("Отсортированные по группе студенты:" + filteredStudents[m]); 
        }

        return filteredStudents;

    },

    marksFilter (mark: number): Array<StudentType> {

        let filteredStudents: Array<StudentType> = [];
        const numbersOfStudents: number = this.students.length;

        for (let i: number = 0; i < numbersOfStudents - 1; i++) {
            for (let j: number = 0; j < this.students[i].marks.length; j ++) {
                if (this.students[i].marks[j].mark == mark) {
                    filteredStudents.push(this.students[i]);
                }
                else {
                    continue;
                }
            }
        }

        for (let m: number = 0; m < filteredStudents.length; m++) {
            console.log("Отсортированные по группе студенты:" + filteredStudents[m]); 
            }

        return filteredStudents;
    },

    deleteStudent (id: number): void {

        const numbersOfStudents: number = this.students.length;

        for (let i: number = 0; i < numbersOfStudents - 1; i++) {
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

