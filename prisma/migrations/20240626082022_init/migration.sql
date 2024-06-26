-- CreateEnum
CREATE TYPE "PaymentMode" AS ENUM ('APP', 'OTHER');

-- CreateEnum
CREATE TYPE "Duration" AS ENUM ('LESS_THAN_A_WEEK', 'LESS_THAN_2_WEEKS', 'ABOUT_A_MONTH', 'MORE_THAN_A_MONTH', 'NOT_SURE_STILL_PLANNING_AND_BUDGETING');

-- CreateEnum
CREATE TYPE "ProfileType" AS ENUM ('PROVIDER', 'CONSUMER');

-- CreateTable
CREATE TABLE "ServiceConsumer" (
    "id" TEXT NOT NULL,
    "serviceConsumerId" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phoneNumber" TEXT NOT NULL,
    "imageUrl" TEXT NOT NULL,
    "auditId" TEXT NOT NULL,

    CONSTRAINT "ServiceConsumer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkProfile" (
    "id" TEXT NOT NULL,
    "workProfileId" TEXT NOT NULL,
    "description" TEXT,
    "personnel" INTEGER NOT NULL DEFAULT 1,
    "location" TEXT NOT NULL,
    "paymentMode" "PaymentMode" NOT NULL DEFAULT 'APP',
    "duration" "Duration" NOT NULL,
    "startDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3) NOT NULL,
    "serviceConsumerId" TEXT NOT NULL,
    "auditId" TEXT NOT NULL,

    CONSTRAINT "WorkProfile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Rate" (
    "id" TEXT NOT NULL,
    "rateId" TEXT NOT NULL,
    "amount" INTEGER NOT NULL,
    "currency" TEXT NOT NULL,
    "frequency" TEXT NOT NULL,
    "serviceProviderId" TEXT NOT NULL,
    "workProfileId" TEXT NOT NULL,

    CONSTRAINT "Rate_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Favourite" (
    "id" TEXT NOT NULL,
    "favouriteId" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "profileType" "ProfileType" NOT NULL,
    "serviceProviderId" TEXT,
    "serviceConsumerId" TEXT,

    CONSTRAINT "Favourite_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ServiceProvider" (
    "id" TEXT NOT NULL,
    "serviceProviderId" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "professionType" TEXT NOT NULL,
    "profileName" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "phoneNumber" TEXT NOT NULL,
    "imageUrl" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "paymentMode" "PaymentMode" NOT NULL DEFAULT 'APP',
    "auditId" TEXT NOT NULL,

    CONSTRAINT "ServiceProvider_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkSample" (
    "id" TEXT NOT NULL,
    "workSampleId" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "imageUrls" TEXT NOT NULL,
    "serviceProviderId" TEXT NOT NULL,
    "auditId" TEXT NOT NULL,

    CONSTRAINT "WorkSample_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Contract" (
    "id" TEXT NOT NULL,
    "contractId" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "paymentMode" "PaymentMode" NOT NULL DEFAULT 'APP',
    "duration" "Duration" NOT NULL,
    "startDate" TIMESTAMP(3) NOT NULL,
    "endDate" TIMESTAMP(3) NOT NULL,
    "serviceProviderSignDate" TIMESTAMP(3) NOT NULL,
    "serviceConsumerSignDate" TIMESTAMP(3) NOT NULL,
    "serviceProviderId" TEXT NOT NULL,
    "serviceConsumerId" TEXT NOT NULL,
    "workProfileId" TEXT NOT NULL,
    "auditId" TEXT NOT NULL,

    CONSTRAINT "Contract_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Rating" (
    "id" TEXT NOT NULL,
    "ratingId" TEXT NOT NULL,
    "serviceProviderId" TEXT,
    "serviceConsumerId" TEXT,
    "email" TEXT NOT NULL,
    "score" INTEGER NOT NULL,
    "comments" TEXT NOT NULL,
    "imageUrls" TEXT NOT NULL,
    "profileType" "ProfileType" NOT NULL,
    "contractId" TEXT NOT NULL,
    "auditId" TEXT NOT NULL,

    CONSTRAINT "Rating_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Audit" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdByEmail" TEXT NOT NULL,
    "createdByIp" TEXT NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedBy" TEXT NOT NULL,
    "updatedByIp" TEXT NOT NULL,
    "deletedAt" TIMESTAMP(3),
    "deletedByEmail" TEXT,
    "deletedByIp" TEXT,

    CONSTRAINT "Audit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Payment" (
    "id" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "transactionId" TEXT NOT NULL,
    "mode" "PaymentMode" NOT NULL DEFAULT 'APP',
    "email" TEXT NOT NULL,
    "contractId" TEXT NOT NULL,
    "auditId" TEXT NOT NULL,

    CONSTRAINT "Payment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Schedule" (
    "id" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "scheduleId" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "serviceProviderId" TEXT NOT NULL,
    "auditId" TEXT NOT NULL,

    CONSTRAINT "Schedule_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "ServiceConsumer_serviceConsumerId_key" ON "ServiceConsumer"("serviceConsumerId");

-- CreateIndex
CREATE UNIQUE INDEX "ServiceConsumer_email_key" ON "ServiceConsumer"("email");

-- CreateIndex
CREATE UNIQUE INDEX "ServiceConsumer_phoneNumber_key" ON "ServiceConsumer"("phoneNumber");

-- CreateIndex
CREATE UNIQUE INDEX "ServiceConsumer_auditId_key" ON "ServiceConsumer"("auditId");

-- CreateIndex
CREATE UNIQUE INDEX "WorkProfile_workProfileId_key" ON "WorkProfile"("workProfileId");

-- CreateIndex
CREATE UNIQUE INDEX "WorkProfile_auditId_key" ON "WorkProfile"("auditId");

-- CreateIndex
CREATE UNIQUE INDEX "Rate_rateId_key" ON "Rate"("rateId");

-- CreateIndex
CREATE UNIQUE INDEX "Rate_serviceProviderId_key" ON "Rate"("serviceProviderId");

-- CreateIndex
CREATE UNIQUE INDEX "Rate_workProfileId_key" ON "Rate"("workProfileId");

-- CreateIndex
CREATE UNIQUE INDEX "Favourite_favouriteId_key" ON "Favourite"("favouriteId");

-- CreateIndex
CREATE UNIQUE INDEX "ServiceProvider_serviceProviderId_key" ON "ServiceProvider"("serviceProviderId");

-- CreateIndex
CREATE UNIQUE INDEX "ServiceProvider_email_key" ON "ServiceProvider"("email");

-- CreateIndex
CREATE UNIQUE INDEX "ServiceProvider_phoneNumber_key" ON "ServiceProvider"("phoneNumber");

-- CreateIndex
CREATE UNIQUE INDEX "ServiceProvider_auditId_key" ON "ServiceProvider"("auditId");

-- CreateIndex
CREATE UNIQUE INDEX "WorkSample_workSampleId_key" ON "WorkSample"("workSampleId");

-- CreateIndex
CREATE UNIQUE INDEX "WorkSample_auditId_key" ON "WorkSample"("auditId");

-- CreateIndex
CREATE UNIQUE INDEX "Contract_contractId_key" ON "Contract"("contractId");

-- CreateIndex
CREATE UNIQUE INDEX "Contract_workProfileId_key" ON "Contract"("workProfileId");

-- CreateIndex
CREATE UNIQUE INDEX "Contract_auditId_key" ON "Contract"("auditId");

-- CreateIndex
CREATE UNIQUE INDEX "Rating_ratingId_key" ON "Rating"("ratingId");

-- CreateIndex
CREATE UNIQUE INDEX "Rating_auditId_key" ON "Rating"("auditId");

-- CreateIndex
CREATE UNIQUE INDEX "Payment_transactionId_key" ON "Payment"("transactionId");

-- CreateIndex
CREATE UNIQUE INDEX "Payment_contractId_key" ON "Payment"("contractId");

-- CreateIndex
CREATE UNIQUE INDEX "Payment_auditId_key" ON "Payment"("auditId");

-- CreateIndex
CREATE UNIQUE INDEX "Schedule_scheduleId_key" ON "Schedule"("scheduleId");

-- CreateIndex
CREATE UNIQUE INDEX "Schedule_auditId_key" ON "Schedule"("auditId");

-- AddForeignKey
ALTER TABLE "ServiceConsumer" ADD CONSTRAINT "ServiceConsumer_auditId_fkey" FOREIGN KEY ("auditId") REFERENCES "Audit"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WorkProfile" ADD CONSTRAINT "WorkProfile_serviceConsumerId_fkey" FOREIGN KEY ("serviceConsumerId") REFERENCES "ServiceConsumer"("serviceConsumerId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WorkProfile" ADD CONSTRAINT "WorkProfile_auditId_fkey" FOREIGN KEY ("auditId") REFERENCES "Audit"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Rate" ADD CONSTRAINT "Rate_serviceProviderId_fkey" FOREIGN KEY ("serviceProviderId") REFERENCES "ServiceProvider"("serviceProviderId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Rate" ADD CONSTRAINT "Rate_workProfileId_fkey" FOREIGN KEY ("workProfileId") REFERENCES "WorkProfile"("workProfileId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Favourite" ADD CONSTRAINT "Favourite_serviceProviderId_fkey" FOREIGN KEY ("serviceProviderId") REFERENCES "ServiceProvider"("serviceProviderId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Favourite" ADD CONSTRAINT "Favourite_serviceConsumerId_fkey" FOREIGN KEY ("serviceConsumerId") REFERENCES "ServiceConsumer"("serviceConsumerId") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ServiceProvider" ADD CONSTRAINT "ServiceProvider_auditId_fkey" FOREIGN KEY ("auditId") REFERENCES "Audit"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WorkSample" ADD CONSTRAINT "WorkSample_serviceProviderId_fkey" FOREIGN KEY ("serviceProviderId") REFERENCES "ServiceProvider"("serviceProviderId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WorkSample" ADD CONSTRAINT "WorkSample_auditId_fkey" FOREIGN KEY ("auditId") REFERENCES "Audit"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Contract" ADD CONSTRAINT "Contract_serviceProviderId_fkey" FOREIGN KEY ("serviceProviderId") REFERENCES "ServiceProvider"("serviceProviderId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Contract" ADD CONSTRAINT "Contract_serviceConsumerId_fkey" FOREIGN KEY ("serviceConsumerId") REFERENCES "ServiceConsumer"("serviceConsumerId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Contract" ADD CONSTRAINT "Contract_workProfileId_fkey" FOREIGN KEY ("workProfileId") REFERENCES "WorkProfile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Contract" ADD CONSTRAINT "Contract_auditId_fkey" FOREIGN KEY ("auditId") REFERENCES "Audit"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Rating" ADD CONSTRAINT "Rating_contractId_fkey" FOREIGN KEY ("contractId") REFERENCES "Contract"("contractId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Rating" ADD CONSTRAINT "Rating_auditId_fkey" FOREIGN KEY ("auditId") REFERENCES "Audit"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Payment" ADD CONSTRAINT "Payment_contractId_fkey" FOREIGN KEY ("contractId") REFERENCES "Contract"("contractId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Payment" ADD CONSTRAINT "Payment_auditId_fkey" FOREIGN KEY ("auditId") REFERENCES "Audit"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Schedule" ADD CONSTRAINT "Schedule_serviceProviderId_fkey" FOREIGN KEY ("serviceProviderId") REFERENCES "ServiceProvider"("serviceProviderId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Schedule" ADD CONSTRAINT "Schedule_auditId_fkey" FOREIGN KEY ("auditId") REFERENCES "Audit"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
