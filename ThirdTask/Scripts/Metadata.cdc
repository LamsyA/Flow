import NonFungibleToken from 0x05
import CryptoPoops from 0x06

//  script to retrieve NFT metadata using the ID
pub fun main(acct: Address, id: UInt64): &NonFungibleToken.NFT {
// Borrow a reference to the public collection using the provided address
    let pubRef = getAccount(acct).getCapability(/public/Collection)
      .borrow<&CryptoPoops.Collection{CryptoPoops.MyAuthCollection}>() 
              ?? panic("Yo do noyt have NFT")
    
  let metadata = pubRef.borrowAuthNFT(id: id) 
  
  // Log NFT metadata
  log(metadata)
  
  return metadata
}