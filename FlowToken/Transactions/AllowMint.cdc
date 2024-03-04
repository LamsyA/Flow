import FungibleToken from 0x05
import FlowToken from 0x05

// Transaction to create a new FlowToken minter
transaction (allowedAmount: UFix64) {
    // Reference to the FlowToken Administrator resource
    let administratorRef: &FlowToken.Administrator
    
    // Reference to the signer's authentication account
    let signer: AuthAccount

    // Prepare phase: Borrow the Administrator resource from the signer's storage
    prepare(signerAccount: AuthAccount) {
        // Assign the signer's reference to the variable
        self.signer = signerAccount
        // Attempt to borrow the Administrator resource from storage
        self.administratorRef = self.signer.borrow<&FlowToken.Administrator>(from: /storage/newFlowTokenAdmin)
            ?? panic("You are not authorized to create a new minter")
    }

    // Execute phase: Create a new minter and save it to storage
    execute {
        // Create a new minter using the createNewMinter function
        let newMinter <- self.administratorRef.createNewMinter(allowedAmount: allowedAmount)

        // Save the new minter resource to the correct storage path
        self.signer.save(<-newMinter, to: /storage/FlowMinter)

        // Log a success message
        log("New FlowToken minter successfully created")
    }
}
