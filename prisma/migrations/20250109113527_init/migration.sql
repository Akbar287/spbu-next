/*
  Warnings:

  - You are about to drop the column `penjadwalanPenjadwalanId` on the `random_string_barcode` table. All the data in the column will be lost.
  - You are about to drop the column `memberMemberId` on the `spbu` table. All the data in the column will be lost.
  - You are about to drop the column `dombakDombakId` on the `stand_meter` table. All the data in the column will be lost.
  - You are about to drop the column `dombakDombakId` on the `stok_inventory_dombak` table. All the data in the column will be lost.
  - You are about to drop the column `pengirimanPengirimanId` on the `supir` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "random_string_barcode" DROP CONSTRAINT "random_string_barcode_penjadwalanPenjadwalanId_fkey";

-- DropForeignKey
ALTER TABLE "spbu" DROP CONSTRAINT "spbu_memberMemberId_fkey";

-- DropForeignKey
ALTER TABLE "stand_meter" DROP CONSTRAINT "stand_meter_dombakDombakId_fkey";

-- DropForeignKey
ALTER TABLE "stok_inventory_dombak" DROP CONSTRAINT "stok_inventory_dombak_dombakDombakId_fkey";

-- DropForeignKey
ALTER TABLE "supir" DROP CONSTRAINT "supir_pengirimanPengirimanId_fkey";

-- AlterTable
ALTER TABLE "random_string_barcode" DROP COLUMN "penjadwalanPenjadwalanId";

-- AlterTable
ALTER TABLE "spbu" DROP COLUMN "memberMemberId";

-- AlterTable
ALTER TABLE "stand_meter" DROP COLUMN "dombakDombakId";

-- AlterTable
ALTER TABLE "stok_inventory_dombak" DROP COLUMN "dombakDombakId";

-- AlterTable
ALTER TABLE "supir" DROP COLUMN "pengirimanPengirimanId";

-- CreateTable
CREATE TABLE "spbu_member" (
    "spbu_id" TEXT NOT NULL,
    "member_id" TEXT NOT NULL,

    CONSTRAINT "spbu_member_pkey" PRIMARY KEY ("spbu_id","member_id")
);

-- AddForeignKey
ALTER TABLE "produk" ADD CONSTRAINT "produk_spbu_id_fkey" FOREIGN KEY ("spbu_id") REFERENCES "spbu"("spbu_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "random_string_barcode" ADD CONSTRAINT "random_string_barcode_penjadwalan_id_fkey" FOREIGN KEY ("penjadwalan_id") REFERENCES "penjadwalan"("penjadwalan_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "rencana_pembelian" ADD CONSTRAINT "rencana_pembelian_status_purchase_id_fkey" FOREIGN KEY ("status_purchase_id") REFERENCES "status_purchase"("status_purchase_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "rencana_pembelian" ADD CONSTRAINT "rencana_pembelian_spbu_id_fkey" FOREIGN KEY ("spbu_id") REFERENCES "spbu"("spbu_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "rencana_pembelian" ADD CONSTRAINT "rencana_pembelian_member_id_fkey" FOREIGN KEY ("member_id") REFERENCES "member"("member_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "segel" ADD CONSTRAINT "segel_file_lo_id_fkey" FOREIGN KEY ("file_lo_id") REFERENCES "file_lo"("file_lo_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stand_meter" ADD CONSTRAINT "stand_meter_nozzle_id_fkey" FOREIGN KEY ("nozzle_id") REFERENCES "nozzle"("nozzle_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stand_meter" ADD CONSTRAINT "stand_meter_jam_kerja_id_fkey" FOREIGN KEY ("jam_kerja_id") REFERENCES "jam_kerja"("jam_kerja_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stand_meter" ADD CONSTRAINT "stand_meter_dombak_id_fkey" FOREIGN KEY ("dombak_id") REFERENCES "dombak"("dombak_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stok_inventory" ADD CONSTRAINT "stok_inventory_produk_id_fkey" FOREIGN KEY ("produk_id") REFERENCES "produk"("produk_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stok_inventory_dombak" ADD CONSTRAINT "stok_inventory_dombak_stok_inventory_id_fkey" FOREIGN KEY ("stok_inventory_id") REFERENCES "stok_inventory"("stok_inventory_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stok_inventory_dombak" ADD CONSTRAINT "stok_inventory_dombak_dombak_id_fkey" FOREIGN KEY ("dombak_id") REFERENCES "dombak"("dombak_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "supir" ADD CONSTRAINT "supir_pengiriman_id_fkey" FOREIGN KEY ("pengiriman_id") REFERENCES "pengiriman"("pengiriman_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tera" ADD CONSTRAINT "tera_spbu_id_fkey" FOREIGN KEY ("spbu_id") REFERENCES "spbu"("spbu_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "userlogin" ADD CONSTRAINT "userlogin_member_id_fkey" FOREIGN KEY ("member_id") REFERENCES "member"("member_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "spbu_member" ADD CONSTRAINT "spbu_member_spbu_id_fkey" FOREIGN KEY ("spbu_id") REFERENCES "spbu"("spbu_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "spbu_member" ADD CONSTRAINT "spbu_member_member_id_fkey" FOREIGN KEY ("member_id") REFERENCES "member"("member_id") ON DELETE RESTRICT ON UPDATE CASCADE;
