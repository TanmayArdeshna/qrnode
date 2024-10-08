const { PrismaClient } = require("@prisma/client");

const prismaClientSingleton = () => {
  return new PrismaClient();
};

// Check if the global object already has a prisma instance
const prisma = globalThis.prismaGlobal || prismaClientSingleton();

// Export the prisma instance
module.exports = prisma;

// In development, assign the prisma instance to globalThis to avoid multiple instances
if (process.env.NODE_ENV !== "production") {
  globalThis.prismaGlobal = prisma;
}
