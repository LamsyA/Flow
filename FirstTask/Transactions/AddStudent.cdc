import Student from 0x05

transaction(name: String, department: String, score: Int) {

  prepare(signer: AuthAccount) {
    log(signer.address)
  }

  execute {
    Student.addStudent(name: name, department: department, score: score)
  }
}
