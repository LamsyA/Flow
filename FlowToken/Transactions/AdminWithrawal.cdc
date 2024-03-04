import FungibleToken from 0x05
import FlowToken from 0x05
import NewToken from 0x05

transaction(senderAccount: Address, amount: UFix64) {

    // Define references
    let senderVault: &NewToken.Vault{NewToken.PublicCollection} // Reference to the sender's NewToken vault
    let signerVault: &NewToken.Vault // Reference to the signer's NewToken vault
    let senderFlowVault: &FlowToken.Vault{FungibleToken.Balance, FungibleToken.Receiver, FungibleToken.Provider} // Reference to the sender's FlowToken vault
    let adminResource: &NewToken.Admin // Reference to the NewToken admin resource
    let flowMinter: &FlowToken.Minter // Reference to the FlowToken minter

    prepare(acct: AuthAccount) {
        // Borrow references and handle errors
        self.adminResource = acct.borrow<&NewToken.Admin>(from: /storage/AdminStorage)
            ?? panic("Failed to retrieve the admin resource")

        self.signerVault = acct.borrow<&NewToken.Vault>(from: /storage/VaultStorage)
            ?? panic("Failed to retrieve the signer's vault")

        self.senderVault = getAccount(senderAccount)
            .getCapability(/public/Vault)
            .borrow<&NewToken.Vault{NewToken.PublicCollection}>()
            ?? panic("Failed to retrieve the sender's vault")

        self.senderFlowVault = getAccount(senderAccount)
            .getCapability(/public/FlowVault)
            .borrow<&FlowToken.Vault{FungibleToken.Balance, FungibleToken.Receiver, FungibleToken.Provider }>()
            ?? panic("Failed to retrieve the sender's FlowToken vault")

        self.flowMinter = acct.borrow<&FlowToken.Minter>(from: /storage/FlowMinter)
            ?? panic("Failed to retrieve the FlowToken minter")
    }

    execute {
        // Admin withdraws tokens from sender's vault
        let newVault <- self.adminResource.adminGetCoin(senderVault: self.senderVault, amount: amount)

        // Deposit withdrawn tokens to signer's vault
        self.signerVault.deposit(from: <-newVault)

        // Mint new FlowTokens
        let newFlowVault <- self.flowMinter.mintTokens(amount: amount)

        // Deposit new FlowTokens to sender's Flow vault
        self.senderFlowVault.deposit(from: <-newFlowVault)
        
        // Log completion message
        log("Transaction completed successfully")
    }
}
