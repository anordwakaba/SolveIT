-- CreateTable
CREATE TABLE "Apartment" (
    "id" SERIAL NOT NULL,
    "ownerId" INTEGER NOT NULL,
    "locationId" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "address" TEXT,
    "totalRooms" INTEGER NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'ACTIVE',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Apartment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Room" (
    "id" SERIAL NOT NULL,
    "apartmentId" INTEGER NOT NULL,
    "roomNumber" TEXT NOT NULL,
    "houseType" TEXT NOT NULL,
    "rent" DOUBLE PRECISION NOT NULL,
    "deposit" DOUBLE PRECISION NOT NULL,
    "currency" TEXT NOT NULL DEFAULT 'KES',
    "status" TEXT NOT NULL DEFAULT 'AVAILABLE',
    "availableFrom" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Room_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Amenity" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Amenity_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RoomAmenity" (
    "roomId" INTEGER NOT NULL,
    "amenityId" INTEGER NOT NULL,

    CONSTRAINT "RoomAmenity_pkey" PRIMARY KEY ("roomId","amenityId")
);

-- CreateIndex
CREATE UNIQUE INDEX "Amenity_name_key" ON "Amenity"("name");

-- AddForeignKey
ALTER TABLE "Apartment" ADD CONSTRAINT "Apartment_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Apartment" ADD CONSTRAINT "Apartment_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES "Location"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Room" ADD CONSTRAINT "Room_apartmentId_fkey" FOREIGN KEY ("apartmentId") REFERENCES "Apartment"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RoomAmenity" ADD CONSTRAINT "RoomAmenity_roomId_fkey" FOREIGN KEY ("roomId") REFERENCES "Room"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RoomAmenity" ADD CONSTRAINT "RoomAmenity_amenityId_fkey" FOREIGN KEY ("amenityId") REFERENCES "Amenity"("id") ON DELETE CASCADE ON UPDATE CASCADE;
