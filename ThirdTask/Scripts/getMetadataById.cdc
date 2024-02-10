import NonFungibleToken from 0x05
import CryptoPoops from 0x06


pub fun main(acct: Address): [UInt64] {
    
    // Borrow a reference to an account's public Collection
    let pubRef = getAccount(acct).getCapability(/public/Collection)
                    .borrow<&CryptoPoops.Collection{NonFungibleToken.CollectionPublic}>()
                    ?? panic("This address has no Collection")

    // Call the getIDs function to retrieve NFT IDs from the public collection
    return pubRef.getIDs()
}