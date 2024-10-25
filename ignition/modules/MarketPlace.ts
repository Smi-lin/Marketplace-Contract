import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const MarketPlaceFactoryModule = buildModule("MarketPlaceFactoryModule", (c) => {
  const marketPlace = c.contract("MarketPlace");

  return { marketPlace };
});

export default MarketPlaceFactoryModule;


// MarketPlaceFactoryModule#MarketPlace - 0x50b80A93fAcB2Ed5A1932f283b6bE5f870c97637

// https://sepolia.basescan.org/address/0x7Bdf6c864e1EA1198f82a98BbF1670dFaB4F8ABC#code