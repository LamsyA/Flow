
pub contract Student {

  pub var courses: [String]
  pub var student: {String: StudentId}

   pub struct StudentId {
    pub let department: String
    pub let score: Int

    init(_department: String, _score: Int){
    self.department = _department
    self.score = _score
    }
  }

  pub fun addCourse(name: String){
    self.courses.append(name)
  }

  pub fun addStudent(name: String, department: String, score: Int){

  pre {
    self.courses.contains(name): "Course do no exist"
    }
    self.student[name] = StudentId(_department: department, _score: score)
  }
  init() {
  self.courses = []

  self.student = {}
  }
}
