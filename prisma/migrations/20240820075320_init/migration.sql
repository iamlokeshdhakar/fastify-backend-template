-- CreateEnum
CREATE TYPE "ClockType" AS ENUM ('HOUR_24', 'HOUR_12');

-- CreateEnum
CREATE TYPE "TemperatureUnit" AS ENUM ('CELSIUS', 'FARENHEIT');

-- CreateEnum
CREATE TYPE "WorkspaceRole" AS ENUM ('MANAGER', 'MEMBER', 'OWNER');

-- CreateEnum
CREATE TYPE "ConnectionType" AS ENUM ('WIFI', 'BLUETOOTH');

-- CreateEnum
CREATE TYPE "Measurements" AS ENUM ('HUMIDITY', 'TEMPERATURE');

-- CreateEnum
CREATE TYPE "Features" AS ENUM ('LOGGING', 'COOKING_ASSISTANT', 'TEMPERATURE_STEAMING');

-- CreateEnum
CREATE TYPE "NotificationType" AS ENUM ('CRITICAL_LOW', 'WARNING_LOW', 'CRITICAL_HIGH', 'WARNING_HIGH', 'BATTERY_LOW', 'DISCONNECT', 'NEW_DEVICE');

-- CreateEnum
CREATE TYPE "SubscriptionType" AS ENUM ('TRIAL', 'PREMIUM');

-- CreateTable
CREATE TABLE "Customer" (
    "id" TEXT NOT NULL,
    "firebaseAuthId" TEXT NOT NULL,
    "displayName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "isDemo" BOOLEAN,
    "avatarURL" TEXT,
    "phoneNumber" TEXT NOT NULL,
    "notificationEmails" TEXT[],
    "webNotification" BOOLEAN NOT NULL DEFAULT true,
    "mobNotification" BOOLEAN NOT NULL DEFAULT true,
    "timeFormat" "ClockType" NOT NULL DEFAULT 'HOUR_24',
    "tempFormat" "TemperatureUnit" NOT NULL DEFAULT 'CELSIUS',
    "tenantId" TEXT,
    "lastLogin" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Customer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkspaceManager" (
    "id" TEXT NOT NULL,
    "role" "WorkspaceRole" NOT NULL DEFAULT 'MEMBER',
    "customerId" TEXT NOT NULL,
    "workspaceId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "WorkspaceManager_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Workspace" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "mapImage" TEXT,
    "logo" TEXT NOT NULL DEFAULT '',
    "default" BOOLEAN NOT NULL DEFAULT false,
    "tenantId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Workspace_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Employee" (
    "id" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "defaultEmail" BOOLEAN NOT NULL,
    "password" TEXT NOT NULL,
    "passwordResetToken" TEXT,
    "roleID" TEXT,
    "tenantId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Employee_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Role" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "default" BOOLEAN NOT NULL DEFAULT false,
    "tenantId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Role_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Permission" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,

    CONSTRAINT "Permission_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Invitation" (
    "id" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "defaultEmail" BOOLEAN NOT NULL,
    "token" TEXT NOT NULL,
    "verificationToken" TEXT,
    "SignedUp" BOOLEAN NOT NULL DEFAULT false,
    "roleId" TEXT NOT NULL,
    "tenantId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Invitation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Device" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "serialNo" TEXT NOT NULL,
    "deviceCode" TEXT NOT NULL,
    "userGivenName" TEXT NOT NULL,
    "connectionKey" TEXT NOT NULL,
    "isArchived" BOOLEAN NOT NULL DEFAULT false,
    "xCord" DOUBLE PRECISION,
    "yCord" DOUBLE PRECISION,
    "upperLimit" DOUBLE PRECISION,
    "lowerLimit" DOUBLE PRECISION,
    "connected" BOOLEAN NOT NULL DEFAULT true,
    "batteryLevel" INTEGER NOT NULL DEFAULT 100,
    "deviceTypeId" TEXT,
    "workspaceId" TEXT NOT NULL,
    "tenantId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Device_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DeviceType" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "icon" TEXT NOT NULL,
    "status" BOOLEAN NOT NULL DEFAULT true,
    "tutorialLink" TEXT,
    "tutorialDescription" TEXT,
    "temperatureSensor" INTEGER NOT NULL DEFAULT 1,
    "humiditySensor" INTEGER NOT NULL DEFAULT 0,
    "feature" "Features" NOT NULL,
    "tenantId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DeviceType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DeviceChannel" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "alias" TEXT NOT NULL,
    "type" "Measurements" NOT NULL,
    "deviceId" TEXT NOT NULL,
    "currentReading" DOUBLE PRECISION NOT NULL,
    "criticalLow" DOUBLE PRECISION NOT NULL,
    "warningLow" DOUBLE PRECISION NOT NULL,
    "criticalHigh" DOUBLE PRECISION NOT NULL,
    "warningHigh" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "DeviceChannel_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NotificationToken" (
    "id" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "client" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "lastUpdated" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "NotificationToken_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Notification" (
    "id" TEXT NOT NULL,
    "title_en" TEXT NOT NULL,
    "title_fr" TEXT NOT NULL,
    "title_de" TEXT NOT NULL,
    "title_es" TEXT NOT NULL,
    "desc_en" TEXT NOT NULL,
    "desc_fr" TEXT NOT NULL,
    "desc_de" TEXT NOT NULL,
    "desc_es" TEXT NOT NULL,
    "read" BOOLEAN NOT NULL DEFAULT false,
    "type" "NotificationType" NOT NULL,
    "workspaceId" TEXT NOT NULL,
    "customerId" TEXT NOT NULL,
    "deviceId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Notification_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Tenant" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "subDomain" TEXT,
    "defaultTenant" BOOLEAN NOT NULL DEFAULT false,
    "active" BOOLEAN NOT NULL,
    "tenantIdIP" TEXT,
    "logo" TEXT,
    "mapImageUrl" TEXT,
    "primaryColor" TEXT,
    "secondaryColor" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Tenant_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Subscription" (
    "id" TEXT NOT NULL,
    "amount" INTEGER NOT NULL,
    "purchaseDate" TIMESTAMP(3) NOT NULL,
    "expiryDate" TIMESTAMP(3) NOT NULL,
    "invoiceUrl" TEXT NOT NULL,
    "autoRenew" BOOLEAN NOT NULL DEFAULT true,
    "type" "SubscriptionType" NOT NULL DEFAULT 'TRIAL',
    "stripeCustomerId" TEXT NOT NULL,
    "stripeSubscriptionId" TEXT NOT NULL,
    "customerId" TEXT NOT NULL,
    "tenantId" TEXT,
    "planId" TEXT NOT NULL,

    CONSTRAINT "Subscription_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Plan" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "default" BOOLEAN NOT NULL DEFAULT true,
    "maxDevices" INTEGER NOT NULL,
    "maxMembers" INTEGER NOT NULL,
    "maxWorkspaces" INTEGER NOT NULL,
    "maxPersonalWorkspace" INTEGER NOT NULL,
    "retentionPeriod" INTEGER NOT NULL,
    "bufferPeriod" INTEGER NOT NULL,
    "noOfMinutes" INTEGER NOT NULL,
    "tenantId" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Plan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StripeSecret" (
    "id" TEXT NOT NULL,
    "stripePriceId" TEXT NOT NULL,
    "stripeSecretKey" TEXT NOT NULL,
    "stripeWebhookSecret" TEXT NOT NULL,
    "stripePublishableKey" TEXT NOT NULL,
    "tenantId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "StripeSecret_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_RolePermissions" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Customer_firebaseAuthId_key" ON "Customer"("firebaseAuthId");

-- CreateIndex
CREATE UNIQUE INDEX "Customer_email_key" ON "Customer"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Permission_title_key" ON "Permission"("title");

-- CreateIndex
CREATE UNIQUE INDEX "Invitation_token_key" ON "Invitation"("token");

-- CreateIndex
CREATE UNIQUE INDEX "NotificationToken_token_key" ON "NotificationToken"("token");

-- CreateIndex
CREATE UNIQUE INDEX "Tenant_subDomain_key" ON "Tenant"("subDomain");

-- CreateIndex
CREATE UNIQUE INDEX "Subscription_stripeSubscriptionId_key" ON "Subscription"("stripeSubscriptionId");

-- CreateIndex
CREATE UNIQUE INDEX "StripeSecret_stripePriceId_key" ON "StripeSecret"("stripePriceId");

-- CreateIndex
CREATE UNIQUE INDEX "StripeSecret_stripeSecretKey_key" ON "StripeSecret"("stripeSecretKey");

-- CreateIndex
CREATE UNIQUE INDEX "StripeSecret_stripeWebhookSecret_key" ON "StripeSecret"("stripeWebhookSecret");

-- CreateIndex
CREATE UNIQUE INDEX "StripeSecret_stripePublishableKey_key" ON "StripeSecret"("stripePublishableKey");

-- CreateIndex
CREATE UNIQUE INDEX "StripeSecret_tenantId_key" ON "StripeSecret"("tenantId");

-- CreateIndex
CREATE UNIQUE INDEX "_RolePermissions_AB_unique" ON "_RolePermissions"("A", "B");

-- CreateIndex
CREATE INDEX "_RolePermissions_B_index" ON "_RolePermissions"("B");

-- AddForeignKey
ALTER TABLE "Customer" ADD CONSTRAINT "Customer_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WorkspaceManager" ADD CONSTRAINT "WorkspaceManager_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WorkspaceManager" ADD CONSTRAINT "WorkspaceManager_workspaceId_fkey" FOREIGN KEY ("workspaceId") REFERENCES "Workspace"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Workspace" ADD CONSTRAINT "Workspace_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Employee" ADD CONSTRAINT "Employee_roleID_fkey" FOREIGN KEY ("roleID") REFERENCES "Role"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Employee" ADD CONSTRAINT "Employee_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Role" ADD CONSTRAINT "Role_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Invitation" ADD CONSTRAINT "Invitation_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "Role"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Invitation" ADD CONSTRAINT "Invitation_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Device" ADD CONSTRAINT "Device_deviceTypeId_fkey" FOREIGN KEY ("deviceTypeId") REFERENCES "DeviceType"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Device" ADD CONSTRAINT "Device_workspaceId_fkey" FOREIGN KEY ("workspaceId") REFERENCES "Workspace"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Device" ADD CONSTRAINT "Device_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DeviceType" ADD CONSTRAINT "DeviceType_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DeviceChannel" ADD CONSTRAINT "DeviceChannel_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES "Device"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NotificationToken" ADD CONSTRAINT "NotificationToken_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notification" ADD CONSTRAINT "Notification_workspaceId_fkey" FOREIGN KEY ("workspaceId") REFERENCES "Workspace"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notification" ADD CONSTRAINT "Notification_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Notification" ADD CONSTRAINT "Notification_deviceId_fkey" FOREIGN KEY ("deviceId") REFERENCES "Device"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Subscription" ADD CONSTRAINT "Subscription_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES "Customer"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Subscription" ADD CONSTRAINT "Subscription_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Subscription" ADD CONSTRAINT "Subscription_planId_fkey" FOREIGN KEY ("planId") REFERENCES "Plan"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Plan" ADD CONSTRAINT "Plan_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StripeSecret" ADD CONSTRAINT "StripeSecret_tenantId_fkey" FOREIGN KEY ("tenantId") REFERENCES "Tenant"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_RolePermissions" ADD CONSTRAINT "_RolePermissions_A_fkey" FOREIGN KEY ("A") REFERENCES "Permission"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_RolePermissions" ADD CONSTRAINT "_RolePermissions_B_fkey" FOREIGN KEY ("B") REFERENCES "Role"("id") ON DELETE CASCADE ON UPDATE CASCADE;
