import { PrismaClient } from "@prisma/client/extension";

let initPrisma: PrismaClient;

function getPrisma() {
  if (!initPrisma) initPrisma = new PrismaClient();
  return initPrisma;
}

export const prisma = getPrisma();
