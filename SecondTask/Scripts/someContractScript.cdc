import SomeContract from 0x05

pub fun main() {
  /**************/
  /*** AREA 4 ***/
  /**************/

  SomeContract.testStruct.a = "changed to a" //. write to a
  log(SomeContract.testStruct.a) // read value of a 
  //READ ONLY FOR VARIABLE 
  log(SomeContract.testStruct.b) // only read value of b

  //Calling Function
  log(SomeContract.testStruct.publicFunc()) // only read value of publicFunc

}
