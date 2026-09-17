-- CreateTable
CREATE TABLE "Location" (
    "id" SERIAL NOT NULL,
    "county" TEXT NOT NULL,
    "subCounty" TEXT,
    "town" TEXT,
    "area" TEXT,
    "estate" TEXT,
    "street" TEXT,
    "landmark" TEXT,
    "address" TEXT,
    "latitude" DOUBLE PRECISION,
    "longitude" DOUBLE PRECISION,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Location_pkey" PRIMARY KEY ("id")
);
