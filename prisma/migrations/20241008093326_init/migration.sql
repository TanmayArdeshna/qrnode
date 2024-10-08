-- CreateTable
CREATE TABLE `audiotbl` (
    `Id` BIGINT NOT NULL AUTO_INCREMENT,
    `UserId` BIGINT NULL,
    `CreatedDate` DATETIME(0) NOT NULL,
    `CreatedIP` VARCHAR(400) NULL,
    `CreatedSource` VARCHAR(200) NULL,
    `CreatedBy` VARCHAR(200) NULL,
    `LastModifiedIP` VARCHAR(400) NULL,
    `LastModifiedBy` VARCHAR(200) NULL,
    `LastModifiedDate` DATETIME(0) NULL,
    `LastModifiedSource` VARCHAR(200) NULL,
    `Name` VARCHAR(400) NULL,
    `OrgFileName` VARCHAR(400) NULL,
    `SystemFileName` VARCHAR(400) NULL,
    `FileSize` VARCHAR(400) NULL,
    `DownloadPath` TEXT NULL,
    `Active` BOOLEAN NULL,

    PRIMARY KEY (`Id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `callbacktbl` (
    `Id` BIGINT NOT NULL AUTO_INCREMENT,
    `CreatedDate` DATETIME(0) NULL,
    `Data` TEXT NULL,
    `Ip` VARCHAR(400) NULL,
    `Method` VARCHAR(100) NULL,
    `Url` TEXT NULL,

    PRIMARY KEY (`Id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `campaigninfotbl` (
    `Id` BIGINT NOT NULL AUTO_INCREMENT,
    `CampaignId` BIGINT NULL,
    `FileName` VARCHAR(200) NULL,
    `FilePath` TEXT NULL,
    `Active` BOOLEAN NULL,
    `Position` INTEGER NULL,
    `Name` VARCHAR(200) NULL,
    `Remark` VARCHAR(800) NULL,
    `UserId` BIGINT NULL,
    `CreatedDate` DATETIME(0) NOT NULL,
    `CreatedIP` VARCHAR(400) NULL,
    `CreatedSource` VARCHAR(200) NULL,
    `CreatedBy` VARCHAR(200) NULL,
    `LastModifiedIP` VARCHAR(400) NULL,
    `LastModifiedBy` VARCHAR(200) NULL,
    `LastModifiedDate` DATETIME(0) NULL,
    `LastModifiedSource` VARCHAR(200) NULL,

    PRIMARY KEY (`Id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `campaigntbl` (
    `Id` BIGINT NOT NULL AUTO_INCREMENT,
    `UserId` BIGINT NOT NULL,
    `Active` BOOLEAN NOT NULL,
    `Remark` VARCHAR(800) NULL,
    `CreatedDate` DATETIME(0) NOT NULL,
    `CreatedIP` VARCHAR(400) NULL,
    `CreatedSource` VARCHAR(200) NULL,
    `CreatedBy` VARCHAR(200) NULL,
    `LastModifiedIP` VARCHAR(400) NULL,
    `LastModifiedBy` VARCHAR(200) NULL,
    `LastModifiedDate` DATETIME(0) NULL,
    `LastModifiedSource` VARCHAR(200) NULL,
    `CampaignName` VARCHAR(200) NULL,

    PRIMARY KEY (`Id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `postbl` (
    `Id` BIGINT NOT NULL AUTO_INCREMENT,
    `UserId` BIGINT NOT NULL,
    `PosName` VARCHAR(600) NOT NULL,
    `Active` BOOLEAN NOT NULL,
    `Remark` VARCHAR(800) NULL,
    `CreatedDate` DATETIME(0) NOT NULL,
    `CreatedIP` VARCHAR(400) NULL,
    `CreatedSource` VARCHAR(200) NULL,
    `CreatedBy` VARCHAR(200) NULL,
    `LastModifiedIP` VARCHAR(400) NULL,
    `LastModifiedBy` VARCHAR(200) NULL,
    `LastModifiedDate` DATETIME(0) NULL,
    `LastModifiedSource` VARCHAR(200) NULL,
    `MerchantId` VARCHAR(200) NULL,
    `ApiKey` VARCHAR(200) NULL,

    PRIMARY KEY (`Id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `User` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `User_username_key`(`username`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
