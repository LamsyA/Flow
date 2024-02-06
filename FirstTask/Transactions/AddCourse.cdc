import Student from 0x05

transaction(name: String) {

  prepare(signer: AuthAccount) {
    log(signer.address)
  }

  execute {
    Student.addCourse(name: name)
  }
}
