access(all) contract SomeContract {
    pub var testStruct: SomeStruct

    pub struct SomeStruct {

        //
        // 4 Variables
        //

        pub(set) var a: String

        pub var b: String

        access(contract) var c: String

        access(self) var d: String

        //
        // 3 Functions
        //

        pub fun publicFunc() {}

        access(contract) fun contractFunc() {}

        access(self) fun privateFunc() {}


        pub fun structFunc() {

        SomeContract.testStruct.contractFunc()
        SomeContract.testStruct.a = " a in Area 1"
        SomeContract.testStruct.b = "b in Area 1"
        SomeContract.testStruct.c = "c in Area 1"
        SomeContract.testStruct.d = "d in Area 1"
        SomeContract.testStruct.privateFunc()
        SomeContract.testStruct.contractFunc()
        SomeContract.testStruct.publicFunc()

            /**************/
            /*** AREA 1 ***/
            /**************/
        }

        init() {
            self.a = "a"
            self.b = "b"
            self.c = "c"
            self.d = "d"
        }

        
    }
    
    pub resource SomeResource {

        pub var e: Int

        pub fun resourceFunc() {
            /**************/
            /*** AREA 2 ***/
            /**************/

            // Variables  that are accessible from SomeStruct
                SomeContract.testStruct.a = "New Value Area 2" // 'a' can be writeable and readable
            log(SomeContract.testStruct.a)
            log(SomeContract.testStruct.b)
            log(SomeContract.testStruct.c)

        // Calling Functions in AREA 2
            log(SomeContract.testStruct.contractFunc()) 
            log(SomeContract.testStruct.publicFunc()) 
            log(self.e)
            
        }

        init() {
            self.e = 17
        }
    }

    pub fun createSomeResource(): @SomeResource {
        return <- create SomeResource()
    }

    pub fun questsAreFun() {
  log(SomeContract.testStruct.c)
    
        /**************/
        /*** AREA 3 ****/
        /**************/

        // Variables  that are accessible from SomeStruct
            SomeContract.testStruct.a = "New Value Area 3" // 'a' can be writeable and readable
            log(SomeContract.testStruct.a )

            // readable values
            log(SomeContract.testStruct.b )
            log(SomeContract.testStruct.c)

         // Calling Functions in AREA 2
            log(SomeContract.testStruct.contractFunc()) 
            log(SomeContract.testStruct.publicFunc()) 
    }

    init() {
        self.testStruct = SomeStruct()
    }
}
