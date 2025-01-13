-- CreateTable
CREATE TABLE "activity_log" (
    "activity_log_id" TEXT NOT NULL,
    "member_id" TEXT NOT NULL,
    "nama_aktivitas" TEXT NOT NULL,
    "class" TEXT NOT NULL,
    "function" TEXT NOT NULL,
    "input" TEXT NOT NULL,
    "output" TEXT NOT NULL,
    "created_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "activity_log_pkey" PRIMARY KEY ("activity_log_id")
);

-- CreateTable
CREATE TABLE "area_member" (
    "area_member_id" TEXT NOT NULL,
    "member_id" TEXT NOT NULL,
    "provinsi" TEXT NOT NULL,
    "kabupaten" TEXT NOT NULL,
    "kecamatan" TEXT NOT NULL,
    "desa" TEXT NOT NULL,
    "rw" TEXT NOT NULL,
    "rt" TEXT NOT NULL,
    "no" TEXT NOT NULL,
    "alamat" TEXT NOT NULL,
    "is_primary" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "area_member_pkey" PRIMARY KEY ("area_member_id")
);

-- CreateTable
CREATE TABLE "aset" (
    "aset_id" TEXT NOT NULL,
    "spbu_id" TEXT NOT NULL,
    "nama_aset" TEXT NOT NULL,
    "jumlah" INTEGER NOT NULL,
    "tanggal_digunakan" TIMESTAMP(3) NOT NULL,
    "harga" DECIMAL(16,6) NOT NULL,
    "penyusutan_per_hari" DECIMAL(16,2) NOT NULL,
    "is_digunakan" BOOLEAN NOT NULL,
    "keterangan" TEXT NOT NULL,
    "created_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "aset_pkey" PRIMARY KEY ("aset_id")
);

-- CreateTable
CREATE TABLE "bonus" (
    "bonus_id" TEXT NOT NULL,
    "member_id" TEXT NOT NULL,
    "persentase" INTEGER NOT NULL,
    "total_bonus" DECIMAL(16,2) NOT NULL,
    "tanggal" TIMESTAMP(3) NOT NULL,
    "deksripsi" TEXT,

    CONSTRAINT "bonus_pkey" PRIMARY KEY ("bonus_id")
);

-- CreateTable
CREATE TABLE "detail_gaji" (
    "detail_gaji_id" TEXT NOT NULL,
    "gaji_member_id" TEXT NOT NULL,
    "nama_gaji" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "total" DECIMAL(16,6) NOT NULL,

    CONSTRAINT "detail_gaji_pkey" PRIMARY KEY ("detail_gaji_id")
);

-- CreateTable
CREATE TABLE "detail_penjualan" (
    "detail_penjualan_id" TEXT NOT NULL,
    "penjualan_id" TEXT NOT NULL,
    "stand_meter_id" TEXT NOT NULL,
    "harga_id" TEXT NOT NULL,
    "liter" DECIMAL(16,6) NOT NULL,
    "total_detail_jual" DECIMAL(16,6) NOT NULL,
    "created_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3),
    "is_confirmed" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "detail_penjualan_pkey" PRIMARY KEY ("detail_penjualan_id")
);

-- CreateTable
CREATE TABLE "detail_produk" (
    "detail_produk_id" TEXT NOT NULL,
    "produk_id" TEXT NOT NULL,
    "nama_jenis" TEXT NOT NULL,
    "oktan" INTEGER NOT NULL,

    CONSTRAINT "detail_produk_pkey" PRIMARY KEY ("detail_produk_id")
);

-- CreateTable
CREATE TABLE "detail_rencana_pembelian" (
    "detail_rencana_pembelian_id" TEXT NOT NULL,
    "rencana_pembelian_id" TEXT NOT NULL,
    "produk_id" TEXT NOT NULL,
    "jumlah" DECIMAL(16,6) NOT NULL,
    "satuan_jumlah" TEXT NOT NULL,
    "rit" DECIMAL(6,2) NOT NULL,
    "harga" DECIMAL(16,6) NOT NULL,
    "total_harga" DECIMAL(16,6) NOT NULL,
    "is_confirmation" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3),
    "ms2" BOOLEAN NOT NULL,
    "delivery" BOOLEAN NOT NULL,
    "kode_detail" TEXT NOT NULL,

    CONSTRAINT "detail_rencana_pembelian_pkey" PRIMARY KEY ("detail_rencana_pembelian_id")
);

-- CreateTable
CREATE TABLE "detail_rencana_pembelian_ms2" (
    "detail_rencana_pembelian_ms2_id" TEXT NOT NULL,
    "ms2_id" TEXT NOT NULL,
    "detail_rencana_pembelian_id" TEXT NOT NULL,
    "is_delivery" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3),
    "jam_kerja_id" TEXT,

    CONSTRAINT "detail_rencana_pembelian_ms2_pkey" PRIMARY KEY ("detail_rencana_pembelian_ms2_id")
);

-- CreateTable
CREATE TABLE "detail_tera" (
    "detail_tera_id" TEXT NOT NULL,
    "dokumen_stok_id" TEXT NOT NULL,
    "tera_id" TEXT NOT NULL,
    "quantity" DECIMAL(16,6) NOT NULL,
    "harga" DECIMAL(16,6) NOT NULL,
    "keterangan" TEXT NOT NULL,
    "created_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "detail_tera_pkey" PRIMARY KEY ("detail_tera_id")
);

-- CreateTable
CREATE TABLE "devices" (
    "devices_id" TEXT NOT NULL,
    "penjadwalan_id" TEXT NOT NULL,
    "ipv4" TEXT NOT NULL,
    "type_devices" TEXT NOT NULL,
    "model_devices" TEXT NOT NULL,
    "os" TEXT NOT NULL,
    "versi_os" TEXT NOT NULL,
    "browser" TEXT NOT NULL,
    "versi_browser" TEXT NOT NULL,
    "created_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "devices_pkey" PRIMARY KEY ("devices_id")
);

-- CreateTable
CREATE TABLE "dispenser" (
    "dispenser_id" TEXT NOT NULL,
    "payung_id" TEXT NOT NULL,
    "nama_dispenser" TEXT NOT NULL,
    "keterangan" TEXT,
    "is_aktif" BOOLEAN NOT NULL,

    CONSTRAINT "dispenser_pkey" PRIMARY KEY ("dispenser_id")
);

-- CreateTable
CREATE TABLE "divisi" (
    "divisi_id" TEXT NOT NULL,
    "spbu_id" TEXT NOT NULL,
    "nama_divisi" TEXT NOT NULL,
    "keterangan" TEXT,
    "is_aktif" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3),
    "deleted_at" TIMESTAMP(3),

    CONSTRAINT "divisi_pkey" PRIMARY KEY ("divisi_id")
);

-- CreateTable
CREATE TABLE "dokumen_stok" (
    "dokumen_stok_id" TEXT NOT NULL,
    "stok_inventory_id" TEXT NOT NULL,
    "member_id" TEXT NOT NULL,
    "dombak_id" TEXT NOT NULL,
    "jam_kerja_id" TEXT NOT NULL,
    "type_dokumen_stok_id" TEXT NOT NULL,
    "tanggal" TIMESTAMP(3) NOT NULL,
    "stok_awal" DECIMAL(16,6) NOT NULL,
    "stok_akhir" DECIMAL(16,6) NOT NULL,
    "is_confirmation" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "dokumen_stok_pkey" PRIMARY KEY ("dokumen_stok_id")
);

-- CreateTable
CREATE TABLE "dombak" (
    "dombak_id" TEXT NOT NULL,
    "spbu_id" TEXT NOT NULL,
    "nama_dombak" TEXT NOT NULL,
    "keterangan" TEXT,
    "is_aktif" BOOLEAN NOT NULL,

    CONSTRAINT "dombak_pkey" PRIMARY KEY ("dombak_id")
);

-- CreateTable
CREATE TABLE "dombak_transfer" (
    "dombak_transfer_id" TEXT NOT NULL,
    "produk_id" TEXT NOT NULL,
    "jam_kerja_id" TEXT NOT NULL,
    "tanggal" TIMESTAMP(3) NOT NULL,
    "is_confirmation" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "dombak_transfer_pkey" PRIMARY KEY ("dombak_transfer_id")
);

-- CreateTable
CREATE TABLE "fasilitas" (
    "fasilitas_id" TEXT NOT NULL,
    "spbu_id" TEXT NOT NULL,
    "nama_fasilitas" TEXT NOT NULL,
    "jumlah" INTEGER NOT NULL,
    "tanggal_digunakan" TIMESTAMP(3) NOT NULL,
    "keterangan" TEXT NOT NULL,
    "created_at" TIMESTAMP(3),
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "fasilitas_pkey" PRIMARY KEY ("fasilitas_id")
);

-- CreateTable
CREATE TABLE "file_aset" (
    "file_aset_id" TEXT NOT NULL,
    "aset_id" TEXT NOT NULL,
    "nama_file" TEXT NOT NULL,
    "nama_dokumen" TEXT NOT NULL,
    "tanggal_upload" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "file_aset_pkey" PRIMARY KEY ("file_aset_id")
);

-- CreateTable
CREATE TABLE "file_dokumen_stok" (
    "file_dokumen_stok_id" TEXT NOT NULL,
    "dokumen_stok_id" TEXT NOT NULL,
    "nama_file" TEXT NOT NULL,
    "nama_dokumen" TEXT NOT NULL,
    "tanggal_upload" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "file_dokumen_stok_pkey" PRIMARY KEY ("file_dokumen_stok_id")
);

-- CreateTable
CREATE TABLE "file_fasilitas" (
    "file_fasilitas_id" TEXT NOT NULL,
    "fasilitas_id" TEXT NOT NULL,
    "nama_file" TEXT NOT NULL,
    "nama_dokumen" TEXT NOT NULL,
    "tanggal_upload" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "file_fasilitas_pkey" PRIMARY KEY ("file_fasilitas_id")
);

-- CreateTable
CREATE TABLE "file_lampiran_lo" (
    "file_lampiran_lo_id" TEXT NOT NULL,
    "file_lo_id" TEXT NOT NULL,
    "nama_file" TEXT NOT NULL,
    "nama_dokumen" TEXT NOT NULL,
    "tanggal_upload" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "file_lampiran_lo_pkey" PRIMARY KEY ("file_lampiran_lo_id")
);

-- CreateTable
CREATE TABLE "file_lo" (
    "file_lo_id" TEXT NOT NULL,
    "pengiriman_id" TEXT NOT NULL,
    "produk_id" TEXT NOT NULL,
    "jumlah" DECIMAL(16,6) NOT NULL,
    "satuan_jumlah" TEXT NOT NULL,
    "no_faktur" TEXT NOT NULL,
    "no_lo" TEXT NOT NULL,
    "nama_dokumen" TEXT NOT NULL,
    "nama_file" TEXT NOT NULL,
    "tanggal_upload" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "file_lo_pkey" PRIMARY KEY ("file_lo_id")
);

-- CreateTable
CREATE TABLE "file_pembayaran" (
    "file_pembayaran_id" TEXT NOT NULL,
    "pembayaran_id" TEXT NOT NULL,
    "nama_file" TEXT NOT NULL,
    "nama_dokumen" TEXT NOT NULL,
    "tanggal_upload" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "file_pembayaran_pkey" PRIMARY KEY ("file_pembayaran_id")
);

-- CreateTable
CREATE TABLE "file_penarikan" (
    "file_penarikan_id" TEXT NOT NULL,
    "penarikan_id" TEXT NOT NULL,
    "tanggal" TIMESTAMP(3) NOT NULL,
    "nama_file" TEXT NOT NULL,
    "nama_dokumen" TEXT NOT NULL,
    "keterangan" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "file_penarikan_pkey" PRIMARY KEY ("file_penarikan_id")
);

-- CreateTable
CREATE TABLE "file_penerimaan" (
    "file_penerimaan_id" TEXT NOT NULL,
    "penerimaan_id" TEXT NOT NULL,
    "nama_file" TEXT NOT NULL,
    "nama_dokumen" TEXT NOT NULL,
    "tanggal_upload" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "file_penerimaan_pkey" PRIMARY KEY ("file_penerimaan_id")
);

-- CreateTable
CREATE TABLE "file_petty_cash" (
    "file_petty_cash_id" TEXT NOT NULL,
    "petty_cash_id" TEXT NOT NULL,
    "nama_file" TEXT NOT NULL,
    "nama_dokumen" TEXT NOT NULL,
    "tanggal_upload" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "file_petty_cash_pkey" PRIMARY KEY ("file_petty_cash_id")
);

-- CreateTable
CREATE TABLE "file_post" (
    "file_post_id" TEXT NOT NULL,
    "post_id" TEXT NOT NULL,
    "nama_file" TEXT NOT NULL,
    "nama_dokumen" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "file_post_pkey" PRIMARY KEY ("file_post_id")
);

-- CreateTable
CREATE TABLE "file_stand_meter" (
    "file_stand_meter_id" TEXT NOT NULL,
    "stand_meter_id" TEXT NOT NULL,
    "nama_file" TEXT NOT NULL,
    "nama_dokumen" TEXT NOT NULL,
    "tanggal_upload" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "file_stand_meter_pkey" PRIMARY KEY ("file_stand_meter_id")
);

-- CreateTable
CREATE TABLE "gaji" (
    "gaji_id" TEXT NOT NULL,
    "jabatan_id" TEXT NOT NULL,
    "tanggal_berlaku" TIMESTAMP(3) NOT NULL,
    "total_gaji" DECIMAL(16,6) NOT NULL,
    "potongan_pajak" DECIMAL(16,6) NOT NULL,
    "keterangan" TEXT,
    "is_aktif" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "gaji_pkey" PRIMARY KEY ("gaji_id")
);

-- CreateTable
CREATE TABLE "gaji_member" (
    "gaji_member_id" TEXT NOT NULL,
    "gaji_id" TEXT NOT NULL,
    "member_id" TEXT NOT NULL,
    "tanggal" TIMESTAMP(3) NOT NULL,
    "total_gaji_bersih" DECIMAL(16,6) NOT NULL,

    CONSTRAINT "gaji_member_pkey" PRIMARY KEY ("gaji_member_id")
);

-- CreateTable
CREATE TABLE "harga" (
    "harga_id" TEXT NOT NULL,
    "produk_id" TEXT NOT NULL,
    "jam_kerja_id" TEXT NOT NULL,
    "tanggal" TIMESTAMP(3) NOT NULL,
    "harga_jual" DECIMAL(16,6) NOT NULL,
    "harga_beli" DECIMAL(16,6) NOT NULL,
    "is_default" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "harga_pkey" PRIMARY KEY ("harga_id")
);

-- CreateTable
CREATE TABLE "hari" (
    "hari_id" TEXT NOT NULL,
    "nama_hari" TEXT NOT NULL,
    "hari_kerja" BOOLEAN NOT NULL,
    "keterangan" TEXT,

    CONSTRAINT "hari_pkey" PRIMARY KEY ("hari_id")
);

-- CreateTable
CREATE TABLE "image_selfie" (
    "image_selfie_id" TEXT NOT NULL,
    "penjadwalan_id" TEXT NOT NULL,
    "nama_file" TEXT NOT NULL,

    CONSTRAINT "image_selfie_pkey" PRIMARY KEY ("image_selfie_id")
);

-- CreateTable
CREATE TABLE "jabatan" (
    "jabatan_id" TEXT NOT NULL,
    "level_id" TEXT NOT NULL,
    "nama_jabatan" TEXT NOT NULL,
    "keterangan" TEXT,
    "is_aktif" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),

    CONSTRAINT "jabatan_pkey" PRIMARY KEY ("jabatan_id")
);

-- CreateTable
CREATE TABLE "jam_kerja" (
    "jam_kerja_id" TEXT NOT NULL,
    "spbu_id" TEXT NOT NULL,
    "nama_jam_kerja" TEXT NOT NULL,
    "batas_awal_in" TIMESTAMP(3) NOT NULL,
    "batas_akhir_in" TIMESTAMP(3) NOT NULL,
    "jam_datang_in" TIMESTAMP(3) NOT NULL,
    "jam_pulang_out" TIMESTAMP(3) NOT NULL,
    "akhir_out" TIMESTAMP(3) NOT NULL,
    "jam_istirahat" TIMESTAMP(3) NOT NULL,
    "masuk_istirahat" TIMESTAMP(3) NOT NULL,
    "batas_telat" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "urutan" INTEGER NOT NULL,

    CONSTRAINT "jam_kerja_pkey" PRIMARY KEY ("jam_kerja_id")
);

-- CreateTable
CREATE TABLE "jenis_losses" (
    "jenis_losses_id" TEXT NOT NULL,
    "jenis_loss" TEXT NOT NULL,
    "deskripsi" TEXT NOT NULL,

    CONSTRAINT "jenis_losses_pkey" PRIMARY KEY ("jenis_losses_id")
);

-- CreateTable
CREATE TABLE "kategori" (
    "kategori_id" TEXT NOT NULL,
    "nama_kategori" TEXT NOT NULL,
    "detail" TEXT NOT NULL,

    CONSTRAINT "kategori_pkey" PRIMARY KEY ("kategori_id")
);

-- CreateTable
CREATE TABLE "konversi" (
    "konversi_id" TEXT NOT NULL,
    "satuan_ukur_tinggi_id" TEXT NOT NULL,
    "satuan_ukur_volume_id" TEXT NOT NULL,
    "dombak_id" TEXT NOT NULL,
    "tinggi" DECIMAL(16,6) NOT NULL,
    "volume" DECIMAL(16,6) NOT NULL,

    CONSTRAINT "konversi_pkey" PRIMARY KEY ("konversi_id")
);

-- CreateTable
CREATE TABLE "ktp" (
    "ktp_id" TEXT NOT NULL,
    "nik" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "jenis_kelamin" TEXT NOT NULL,
    "tempat_lahir" TEXT NOT NULL,
    "tanggal_lahir" TIMESTAMP(3) NOT NULL,
    "verified" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),

    CONSTRAINT "ktp_pkey" PRIMARY KEY ("ktp_id")
);

-- CreateTable
CREATE TABLE "level" (
    "level_id" TEXT NOT NULL,
    "divisi_id" TEXT NOT NULL,
    "nama_level" TEXT NOT NULL,
    "keterangan" TEXT,
    "is_aktif" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),

    CONSTRAINT "level_pkey" PRIMARY KEY ("level_id")
);

-- CreateTable
CREATE TABLE "location" (
    "location_id" TEXT NOT NULL,
    "penjadwalan_id" TEXT NOT NULL,
    "lattitude" DECIMAL(8,6) NOT NULL,
    "longitude" DECIMAL(9,6) NOT NULL,
    "gmt" SMALLINT NOT NULL,
    "deskripsi" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "location_pkey" PRIMARY KEY ("location_id")
);

-- CreateTable
CREATE TABLE "losses" (
    "losses_id" TEXT NOT NULL,
    "jenis_losses_id" TEXT NOT NULL,
    "dokumen_stok_id" TEXT NOT NULL,
    "tanggal" TIMESTAMP(3) NOT NULL,
    "simbol" TEXT NOT NULL,
    "jumlah" DECIMAL(16,6) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "losses_pkey" PRIMARY KEY ("losses_id")
);

-- CreateTable
CREATE TABLE "member" (
    "member_id" TEXT NOT NULL,
    "ktp_id" TEXT NOT NULL,
    "status_member_id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "no_hp" TEXT,
    "no_wa" TEXT,
    "avatar" TEXT NOT NULL,
    "bergabung_sejak" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),

    CONSTRAINT "member_pkey" PRIMARY KEY ("member_id")
);

-- CreateTable
CREATE TABLE "mesin_presensi" (
    "mesin_presensi_id" TEXT NOT NULL,
    "nama_mesin" TEXT NOT NULL,
    "tipe_koneksi" TEXT,
    "ip_address" TEXT,
    "com_port" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "mesin_presensi_pkey" PRIMARY KEY ("mesin_presensi_id")
);

-- CreateTable
CREATE TABLE "ms2" (
    "ms2_id" TEXT NOT NULL,
    "member_id" TEXT NOT NULL,
    "tanggal" TIMESTAMP(3) NOT NULL,
    "kode_sms" TEXT,
    "is_done" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ms2_pkey" PRIMARY KEY ("ms2_id")
);

-- CreateTable
CREATE TABLE "notifikasi" (
    "notifikasi_id" TEXT NOT NULL,
    "member_id" TEXT NOT NULL,
    "judul" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "is_read" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "notifikasi_pkey" PRIMARY KEY ("notifikasi_id")
);

-- CreateTable
CREATE TABLE "nozzle" (
    "nozzle_id" TEXT NOT NULL,
    "dispenser_id" TEXT NOT NULL,
    "produk_id" TEXT NOT NULL,
    "nama_nozzle" TEXT NOT NULL,
    "keterangan" TEXT,
    "is_aktif" BOOLEAN NOT NULL,

    CONSTRAINT "nozzle_pkey" PRIMARY KEY ("nozzle_id")
);

-- CreateTable
CREATE TABLE "pajak_pembelian" (
    "pajak_pembelian_id" TEXT NOT NULL,
    "rencana_pembelian_id" TEXT NOT NULL,
    "net_price" DECIMAL(16,6) NOT NULL,
    "ppn" DECIMAL(16,6) NOT NULL,
    "ppbkb" DECIMAL(16,6),
    "pph" DECIMAL(16,6),
    "total_amount" DECIMAL(16,6),
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "pajak_pembelian_lib_id" TEXT NOT NULL,

    CONSTRAINT "pajak_pembelian_pkey" PRIMARY KEY ("pajak_pembelian_id")
);

-- CreateTable
CREATE TABLE "pajak_pembelian_lib" (
    "pajak_pembelian_lib_id" TEXT NOT NULL,
    "ppn" DOUBLE PRECISION NOT NULL,
    "ppbkb" DOUBLE PRECISION NOT NULL,
    "pph" DOUBLE PRECISION NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "is_aktif" BOOLEAN NOT NULL,

    CONSTRAINT "pajak_pembelian_lib_pkey" PRIMARY KEY ("pajak_pembelian_lib_id")
);

-- CreateTable
CREATE TABLE "password_reset_tokens" (
    "password_reset_token_id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "password_reset_tokens_pkey" PRIMARY KEY ("password_reset_token_id")
);

-- CreateTable
CREATE TABLE "payung" (
    "payung_id" TEXT NOT NULL,
    "spbu_id" TEXT NOT NULL,
    "nama_payung" TEXT NOT NULL,
    "keterangan" TEXT,
    "is_aktif" BOOLEAN NOT NULL,

    CONSTRAINT "payung_pkey" PRIMARY KEY ("payung_id")
);

-- CreateTable
CREATE TABLE "pembayaran" (
    "pembayaran_id" TEXT NOT NULL,
    "rencana_pembelian_id" TEXT NOT NULL,
    "member_id" TEXT NOT NULL,
    "tanggal" TIMESTAMP(3) NOT NULL,
    "no_cek_bg" TEXT NOT NULL,
    "no_rekening" TEXT NOT NULL,
    "nama_rekening" TEXT NOT NULL,
    "total_setoran" DECIMAL(18,6) NOT NULL,
    "is_confirmation_admin" BOOLEAN NOT NULL,
    "is_confirmation_top" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "pembayaran_pkey" PRIMARY KEY ("pembayaran_id")
);

-- CreateTable
CREATE TABLE "penarikan" (
    "penarikan_id" TEXT NOT NULL,
    "penjualan_id" TEXT NOT NULL,
    "tanggal" TIMESTAMP(3) NOT NULL,
    "nama_bank" TEXT NOT NULL,
    "no_referensi" TEXT NOT NULL,
    "metode_transfer" TEXT NOT NULL,
    "is_accepted" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "member_id" TEXT NOT NULL,
    "total_uang" DECIMAL(16,6) NOT NULL,

    CONSTRAINT "penarikan_pkey" PRIMARY KEY ("penarikan_id")
);

-- CreateTable
CREATE TABLE "penerimaan" (
    "penerimaan_id" TEXT NOT NULL,
    "file_lo_id" TEXT NOT NULL,
    "dokumen_stok_id" TEXT NOT NULL,
    "tanggal" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "penerimaan_pkey" PRIMARY KEY ("penerimaan_id")
);

-- CreateTable
CREATE TABLE "penerimaan_stok_taking" (
    "penerimaan_stok_taking_id" TEXT NOT NULL,
    "penerimaan_id" TEXT NOT NULL,
    "dokumen_stok_id" TEXT NOT NULL,

    CONSTRAINT "penerimaan_stok_taking_pkey" PRIMARY KEY ("penerimaan_stok_taking_id")
);

-- CreateTable
CREATE TABLE "pengiriman" (
    "pengiriman_id" TEXT NOT NULL,
    "member_id" TEXT NOT NULL,
    "tanggal" TIMESTAMP(3) NOT NULL,
    "no_do" TEXT,
    "no_pol" TEXT NOT NULL,
    "is_confirmation_admin" BOOLEAN NOT NULL,
    "is_done" BOOLEAN NOT NULL,
    "is_confirmation_top" BOOLEAN NOT NULL,
    "catatan" TEXT,

    CONSTRAINT "pengiriman_pkey" PRIMARY KEY ("pengiriman_id")
);

-- CreateTable
CREATE TABLE "penjadwalan" (
    "penjadwalan_id" TEXT NOT NULL,
    "status_kehadiran_id" TEXT NOT NULL,
    "jabatan_id" TEXT NOT NULL,
    "member_id" TEXT NOT NULL,
    "jam_kerja_id" TEXT NOT NULL,
    "tanggal" TIMESTAMP(3) NOT NULL,
    "deskripsi" TEXT,
    "attended" TIMESTAMP(3),
    "is_attended" BOOLEAN NOT NULL DEFAULT false,
    "is_confirm" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "start_time" TIMESTAMP(3),
    "finish_time" TIMESTAMP(3),
    "kode_penjadwalan" TEXT NOT NULL,

    CONSTRAINT "penjadwalan_pkey" PRIMARY KEY ("penjadwalan_id")
);

-- CreateTable
CREATE TABLE "penjualan" (
    "penjualan_id" TEXT NOT NULL,
    "spbu_id" TEXT NOT NULL,
    "jam_kerja_id" TEXT NOT NULL,
    "tanggal" TIMESTAMP(3) NOT NULL,
    "total_penjualan" DECIMAL(16,6) NOT NULL,
    "total_uang_kotak" DECIMAL(16,6) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "status_setoran_id" TEXT NOT NULL,
    "is_accepted_admin" BOOLEAN NOT NULL,
    "is_accepted_top" BOOLEAN NOT NULL,

    CONSTRAINT "penjualan_pkey" PRIMARY KEY ("penjualan_id")
);

-- CreateTable
CREATE TABLE "penjualan_penarikan" (
    "pejualan_penarikan_id" TEXT NOT NULL,
    "penjualan_id" TEXT NOT NULL,
    "member_id" TEXT NOT NULL,
    "total_tarikan" DECIMAL(16,2) NOT NULL,

    CONSTRAINT "penjualan_penarikan_pkey" PRIMARY KEY ("pejualan_penarikan_id")
);

-- CreateTable
CREATE TABLE "petty_cash" (
    "petty_cash_id" TEXT NOT NULL,
    "spbu_id" TEXT NOT NULL,
    "no_kode" TEXT NOT NULL,
    "no_bukti" TEXT NOT NULL,
    "keterangan" TEXT NOT NULL,
    "jumlah" DECIMAL(16,6) NOT NULL,
    "jenis" TEXT NOT NULL,
    "tanggal" TIMESTAMP(3) NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),

    CONSTRAINT "petty_cash_pkey" PRIMARY KEY ("petty_cash_id")
);

-- CreateTable
CREATE TABLE "pj_operasional_setoran" (
    "pj_operasional_setoran_id" TEXT NOT NULL,
    "penjualan_id" TEXT NOT NULL,
    "jabatan_id" TEXT NOT NULL,
    "member_id" TEXT NOT NULL,

    CONSTRAINT "pj_operasional_setoran_pkey" PRIMARY KEY ("pj_operasional_setoran_id")
);

-- CreateTable
CREATE TABLE "post" (
    "post_id" TEXT NOT NULL,
    "member_id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "active" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "deleted_at" TIMESTAMP(3),

    CONSTRAINT "post_pkey" PRIMARY KEY ("post_id")
);

-- CreateTable
CREATE TABLE "presensi" (
    "presensi_id" TEXT NOT NULL,
    "status_presensi_id" TEXT NOT NULL,
    "mesin_presensi_id" TEXT NOT NULL,
    "jam_kerja_id" TEXT NOT NULL,
    "member_id" TEXT NOT NULL,
    "tanggal" TIMESTAMP(3) NOT NULL,
    "waktu_datang" TIMESTAMP(3) NOT NULL,
    "waktu_selesai" TIMESTAMP(3),
    "is_verified" BOOLEAN NOT NULL,
    "is_aktif" BOOLEAN NOT NULL,
    "terlambat" TIMESTAMP(3),
    "keterangan" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "presensi_pkey" PRIMARY KEY ("presensi_id")
);

-- CreateTable
CREATE TABLE "produk" (
    "produk_id" TEXT NOT NULL,
    "spbu_id" TEXT NOT NULL,
    "nama_produk" VARCHAR(64) NOT NULL,
    "is_aktif" BOOLEAN NOT NULL,
    "singkatan" VARCHAR(4),

    CONSTRAINT "produk_pkey" PRIMARY KEY ("produk_id")
);

-- CreateTable
CREATE TABLE "random_string_barcode" (
    "random_string_barcode_id" TEXT NOT NULL,
    "penjadwalan_id" TEXT NOT NULL,
    "barcode" VARCHAR(255) NOT NULL,
    "start" TIMESTAMP(0) NOT NULL,
    "finish" TIMESTAMP(0) NOT NULL,
    "is_done" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(0) NOT NULL,
    "updated_at" TIMESTAMP(0) NOT NULL,
    "validate_barcode_id" TEXT NOT NULL,
    "is_active" BOOLEAN NOT NULL DEFAULT true,
    "penjadwalanPenjadwalanId" TEXT,

    CONSTRAINT "random_string_barcode_pkey" PRIMARY KEY ("random_string_barcode_id")
);

-- CreateTable
CREATE TABLE "rencana_pembelian" (
    "rencana_pembelian_id" TEXT NOT NULL,
    "status_purchase_id" TEXT NOT NULL,
    "spbu_id" TEXT NOT NULL,
    "member_id" TEXT NOT NULL,
    "pembelian_id" TEXT,
    "tanggal_pembelian" DATE,
    "grand_total" DECIMAL(16,6),
    "keterangan" TEXT,
    "is_confirmation" BOOLEAN NOT NULL,
    "is_denied" BOOLEAN NOT NULL,
    "keterangan_denied" TEXT,
    "created_at" TIMESTAMP(0) NOT NULL,
    "updated_at" TIMESTAMP(0) NOT NULL,
    "kode_pembelian" VARCHAR(32) NOT NULL,

    CONSTRAINT "rencana_pembelian_pkey" PRIMARY KEY ("rencana_pembelian_id")
);

-- CreateTable
CREATE TABLE "satuan_ukur_tinggi" (
    "satuan_ukur_tinggi_id" TEXT NOT NULL,
    "nama_satuan" VARCHAR(64) NOT NULL,
    "singkatan" VARCHAR(8),

    CONSTRAINT "satuan_ukur_tinggi_pkey" PRIMARY KEY ("satuan_ukur_tinggi_id")
);

-- CreateTable
CREATE TABLE "satuan_ukur_volume" (
    "satuan_ukur_volume_id" TEXT NOT NULL,
    "nama_satuan" VARCHAR(64) NOT NULL,
    "singkatan" VARCHAR(8),

    CONSTRAINT "satuan_ukur_volume_pkey" PRIMARY KEY ("satuan_ukur_volume_id")
);

-- CreateTable
CREATE TABLE "segel" (
    "segel_id" TEXT NOT NULL,
    "file_lo_id" TEXT NOT NULL,
    "no_segel" VARCHAR(255) NOT NULL,

    CONSTRAINT "segel_pkey" PRIMARY KEY ("segel_id")
);

-- CreateTable
CREATE TABLE "spbu" (
    "spbu_id" TEXT NOT NULL,
    "nama_spbu" VARCHAR(255) NOT NULL,
    "nomor_spbu" VARCHAR(32) NOT NULL,
    "tanggal_pendirian" DATE NOT NULL,
    "luas_lahan" DOUBLE PRECISION NOT NULL,
    "satuan_luas" VARCHAR(8) NOT NULL,
    "alamat" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(0) NOT NULL,
    "updated_at" TIMESTAMP(0) NOT NULL,
    "deleted_at" TIMESTAMP(0),
    "memberMemberId" TEXT,

    CONSTRAINT "spbu_pkey" PRIMARY KEY ("spbu_id")
);

-- CreateTable
CREATE TABLE "stand_meter" (
    "stand_meter_id" TEXT NOT NULL,
    "nozzle_id" TEXT NOT NULL,
    "jam_kerja_id" TEXT NOT NULL,
    "dombak_id" TEXT NOT NULL,
    "tanggal" DATE NOT NULL,
    "stand_meter_awal" DECIMAL(16,6) NOT NULL,
    "stand_meter_akhir" DECIMAL(16,6),
    "is_confirmation" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(0) NOT NULL,
    "updated_at" TIMESTAMP(0) NOT NULL,
    "urutan" INTEGER NOT NULL,
    "dombakDombakId" TEXT,

    CONSTRAINT "stand_meter_pkey" PRIMARY KEY ("stand_meter_id")
);

-- CreateTable
CREATE TABLE "status_kehadiran" (
    "status_kehadiran_id" TEXT NOT NULL,
    "nama_kehadiran" VARCHAR(64) NOT NULL,

    CONSTRAINT "status_kehadiran_pkey" PRIMARY KEY ("status_kehadiran_id")
);

-- CreateTable
CREATE TABLE "status_member" (
    "status_member_id" TEXT NOT NULL,
    "nama_status" VARCHAR(32) NOT NULL,
    "keterangan" TEXT,

    CONSTRAINT "status_member_pkey" PRIMARY KEY ("status_member_id")
);

-- CreateTable
CREATE TABLE "status_presensi" (
    "status_presensi_id" TEXT NOT NULL,
    "nama_status" VARCHAR(255) NOT NULL,
    "keterangan" TEXT,
    "created_at" TIMESTAMP(0) NOT NULL,
    "updated_at" TIMESTAMP(0) NOT NULL,

    CONSTRAINT "status_presensi_pkey" PRIMARY KEY ("status_presensi_id")
);

-- CreateTable
CREATE TABLE "status_purchase" (
    "status_purchase_id" TEXT NOT NULL,
    "nama_status" VARCHAR(64) NOT NULL,
    "deskripsi" TEXT NOT NULL,
    "is_aktif" BOOLEAN NOT NULL,
    "created_at" TIMESTAMP(0) NOT NULL,
    "updated_at" TIMESTAMP(0) NOT NULL,

    CONSTRAINT "status_purchase_pkey" PRIMARY KEY ("status_purchase_id")
);

-- CreateTable
CREATE TABLE "status_setoran" (
    "status_setoran_id" TEXT NOT NULL,
    "nama_status" VARCHAR(64) NOT NULL,

    CONSTRAINT "status_setoran_pkey" PRIMARY KEY ("status_setoran_id")
);

-- CreateTable
CREATE TABLE "stok_inventory" (
    "stok_inventory_id" TEXT NOT NULL,
    "produk_id" TEXT NOT NULL,
    "stok" DECIMAL(16,6) NOT NULL,
    "created_at" TIMESTAMP(0) NOT NULL,
    "updated_at" TIMESTAMP(0) NOT NULL,

    CONSTRAINT "stok_inventory_pkey" PRIMARY KEY ("stok_inventory_id")
);

-- CreateTable
CREATE TABLE "stok_inventory_dombak" (
    "stok_inventory_dombak_id" TEXT NOT NULL,
    "stok_inventory_id" TEXT NOT NULL,
    "dombak_id" TEXT NOT NULL,
    "stok" DECIMAL(16,6) NOT NULL,
    "dombakDombakId" TEXT,

    CONSTRAINT "stok_inventory_dombak_pkey" PRIMARY KEY ("stok_inventory_dombak_id")
);

-- CreateTable
CREATE TABLE "supir" (
    "supir_id" TEXT NOT NULL,
    "pengiriman_id" TEXT NOT NULL,
    "nama_supir" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(0) NOT NULL,
    "updated_at" TIMESTAMP(0) NOT NULL,
    "pengirimanPengirimanId" TEXT,

    CONSTRAINT "supir_pkey" PRIMARY KEY ("supir_id")
);

-- CreateTable
CREATE TABLE "tag" (
    "tag_id" TEXT NOT NULL,
    "nama_tag" VARCHAR(64) NOT NULL,

    CONSTRAINT "tag_pkey" PRIMARY KEY ("tag_id")
);

-- CreateTable
CREATE TABLE "tera" (
    "tera_id" TEXT NOT NULL,
    "spbu_id" TEXT NOT NULL,
    "tanggal" DATE NOT NULL,
    "grand_total" DECIMAL(16,6) NOT NULL,
    "keterangan" TEXT NOT NULL,
    "created_at" TIMESTAMP(0) NOT NULL,
    "updated_at" TIMESTAMP(0) NOT NULL,

    CONSTRAINT "tera_pkey" PRIMARY KEY ("tera_id")
);

-- CreateTable
CREATE TABLE "tera_return" (
    "tera_return_id" TEXT NOT NULL,
    "tera_from_id" TEXT NOT NULL,
    "tera_to_id" TEXT NOT NULL,

    CONSTRAINT "tera_return_pkey" PRIMARY KEY ("tera_return_id")
);

-- CreateTable
CREATE TABLE "type_dokumen_stok" (
    "type_dokumen_stok_id" TEXT NOT NULL,
    "type_movement" VARCHAR(64) NOT NULL,
    "deskripsi" TEXT NOT NULL,

    CONSTRAINT "type_dokumen_stok_pkey" PRIMARY KEY ("type_dokumen_stok_id")
);

-- CreateTable
CREATE TABLE "userlogin" (
    "user_login_id" TEXT NOT NULL,
    "member_id" TEXT NOT NULL,
    "username" VARCHAR(32) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "is_aktif" BOOLEAN NOT NULL,
    "access_token" VARCHAR(255),
    "access" VARCHAR(255),
    "last_login" TIMESTAMP(0),
    "created_at" TIMESTAMP(0) NOT NULL,
    "updated_at" TIMESTAMP(0) NOT NULL,
    "deleted_at" TIMESTAMP(0),

    CONSTRAINT "userlogin_pkey" PRIMARY KEY ("user_login_id")
);

-- CreateTable
CREATE TABLE "validate_barcode" (
    "validate_barcode_id" TEXT NOT NULL,
    "is_expired" INTEGER NOT NULL DEFAULT 15,
    "is_active" BOOLEAN NOT NULL DEFAULT false,
    "created_at" TIMESTAMP(0) NOT NULL,
    "updated_at" TIMESTAMP(0) NOT NULL,

    CONSTRAINT "validate_barcode_pkey" PRIMARY KEY ("validate_barcode_id")
);

-- CreateTable
CREATE TABLE "failed_jobs" (
    "id" TEXT NOT NULL,
    "uuid" TEXT NOT NULL,
    "connection" TEXT NOT NULL,
    "queue" TEXT NOT NULL,
    "payload" TEXT NOT NULL,
    "exception" TEXT NOT NULL,
    "failed_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "failed_jobs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "migrations" (
    "id" SERIAL NOT NULL,
    "migration" TEXT NOT NULL,
    "batch" INTEGER NOT NULL,

    CONSTRAINT "migrations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "personal_access_tokens" (
    "id" TEXT NOT NULL,
    "tokenable_type" TEXT NOT NULL,
    "tokenable_id" BIGINT NOT NULL,
    "name" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "abilities" TEXT,
    "last_used_at" TIMESTAMP(3),
    "expires_at" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "personal_access_tokens_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "jabatan_member" (
    "jabatan_id" TEXT NOT NULL,
    "member_id" TEXT NOT NULL,

    CONSTRAINT "jabatan_member_pkey" PRIMARY KEY ("member_id","jabatan_id")
);

-- CreateTable
CREATE TABLE "dombak_payung" (
    "dombak_id" TEXT NOT NULL,
    "payung_id" TEXT NOT NULL,

    CONSTRAINT "dombak_payung_pkey" PRIMARY KEY ("dombak_id","payung_id")
);

-- CreateTable
CREATE TABLE "dombak_transfer_dokumen_stok" (
    "dombak_transfer_id" TEXT NOT NULL,
    "dokumen_stok_id" TEXT NOT NULL,

    CONSTRAINT "dombak_transfer_dokumen_stok_pkey" PRIMARY KEY ("dombak_transfer_id","dokumen_stok_id")
);

-- CreateTable
CREATE TABLE "hari_jam_kerja" (
    "hari_id" TEXT NOT NULL,
    "jam_kerja_id" TEXT NOT NULL,

    CONSTRAINT "hari_jam_kerja_pkey" PRIMARY KEY ("hari_id","jam_kerja_id")
);

-- CreateTable
CREATE TABLE "kategori_post" (
    "kategori_id" TEXT NOT NULL,
    "post_id" TEXT NOT NULL,

    CONSTRAINT "kategori_post_pkey" PRIMARY KEY ("kategori_id","post_id")
);

-- CreateTable
CREATE TABLE "konversi_dokumen_stok" (
    "konversi_id" TEXT NOT NULL,
    "dokumen_stok_id" TEXT NOT NULL,

    CONSTRAINT "konversi_dokumen_stok_pkey" PRIMARY KEY ("konversi_id","dokumen_stok_id")
);

-- CreateTable
CREATE TABLE "penerimaan_petty_cash" (
    "penerimaan_id" TEXT NOT NULL,
    "petty_cash_id" TEXT NOT NULL,

    CONSTRAINT "penerimaan_petty_cash_pkey" PRIMARY KEY ("penerimaan_id","petty_cash_id")
);

-- CreateTable
CREATE TABLE "pengiriman_ms2" (
    "pengiriman_id" TEXT NOT NULL,
    "ms2_id" TEXT NOT NULL,

    CONSTRAINT "pengiriman_ms2_pkey" PRIMARY KEY ("pengiriman_id","ms2_id")
);

-- CreateTable
CREATE TABLE "penjadwalan_nozzle" (
    "penjadwalan_id" TEXT NOT NULL,
    "nozzle_id" TEXT NOT NULL,

    CONSTRAINT "penjadwalan_nozzle_pkey" PRIMARY KEY ("penjadwalan_id","nozzle_id")
);

-- CreateTable
CREATE TABLE "stand_meter_dokumen_stok" (
    "stand_meter_id" TEXT NOT NULL,
    "dokumen_stok_id" TEXT NOT NULL,

    CONSTRAINT "stand_meter_dokumen_stok_pkey" PRIMARY KEY ("stand_meter_id","dokumen_stok_id")
);

-- CreateTable
CREATE TABLE "tag_post" (
    "tag_id" TEXT NOT NULL,
    "post_id" TEXT NOT NULL,

    CONSTRAINT "tag_post_pkey" PRIMARY KEY ("tag_id","post_id")
);

-- CreateTable
CREATE TABLE "tera_petty_cash" (
    "tera_id" TEXT NOT NULL,
    "petty_cash_id" TEXT NOT NULL,

    CONSTRAINT "tera_petty_cash_pkey" PRIMARY KEY ("tera_id","petty_cash_id")
);

-- CreateTable
CREATE TABLE "detail_rencana_file" (
    "detail_rencana_pembelian_id" TEXT NOT NULL,
    "file_lo_id" TEXT NOT NULL,

    CONSTRAINT "detail_rencana_file_pkey" PRIMARY KEY ("detail_rencana_pembelian_id","file_lo_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "detail_rencana_pembelian_kode_detail_key" ON "detail_rencana_pembelian"("kode_detail");

-- CreateIndex
CREATE UNIQUE INDEX "member_ktp_id_key" ON "member"("ktp_id");

-- CreateIndex
CREATE UNIQUE INDEX "member_email_key" ON "member"("email");

-- CreateIndex
CREATE UNIQUE INDEX "penjadwalan_kode_penjadwalan_key" ON "penjadwalan"("kode_penjadwalan");

-- CreateIndex
CREATE UNIQUE INDEX "rencana_pembelian_kode_pembelian_key" ON "rencana_pembelian"("kode_pembelian");

-- CreateIndex
CREATE UNIQUE INDEX "failed_jobs_uuid_key" ON "failed_jobs"("uuid");

-- CreateIndex
CREATE UNIQUE INDEX "personal_access_tokens_token_key" ON "personal_access_tokens"("token");

-- AddForeignKey
ALTER TABLE "activity_log" ADD CONSTRAINT "activity_log_member_id_fkey" FOREIGN KEY ("member_id") REFERENCES "member"("member_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "area_member" ADD CONSTRAINT "area_member_member_id_fkey" FOREIGN KEY ("member_id") REFERENCES "member"("member_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "aset" ADD CONSTRAINT "aset_spbu_id_fkey" FOREIGN KEY ("spbu_id") REFERENCES "spbu"("spbu_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "bonus" ADD CONSTRAINT "bonus_member_id_fkey" FOREIGN KEY ("member_id") REFERENCES "member"("member_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "detail_gaji" ADD CONSTRAINT "detail_gaji_gaji_member_id_fkey" FOREIGN KEY ("gaji_member_id") REFERENCES "gaji_member"("gaji_member_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "detail_penjualan" ADD CONSTRAINT "detail_penjualan_penjualan_id_fkey" FOREIGN KEY ("penjualan_id") REFERENCES "penjualan"("penjualan_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "detail_penjualan" ADD CONSTRAINT "detail_penjualan_stand_meter_id_fkey" FOREIGN KEY ("stand_meter_id") REFERENCES "stand_meter"("stand_meter_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "detail_penjualan" ADD CONSTRAINT "detail_penjualan_harga_id_fkey" FOREIGN KEY ("harga_id") REFERENCES "harga"("harga_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "detail_produk" ADD CONSTRAINT "detail_produk_produk_id_fkey" FOREIGN KEY ("produk_id") REFERENCES "produk"("produk_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "detail_rencana_pembelian" ADD CONSTRAINT "detail_rencana_pembelian_rencana_pembelian_id_fkey" FOREIGN KEY ("rencana_pembelian_id") REFERENCES "rencana_pembelian"("rencana_pembelian_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "detail_rencana_pembelian" ADD CONSTRAINT "detail_rencana_pembelian_produk_id_fkey" FOREIGN KEY ("produk_id") REFERENCES "produk"("produk_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "detail_rencana_pembelian_ms2" ADD CONSTRAINT "detail_rencana_pembelian_ms2_ms2_id_fkey" FOREIGN KEY ("ms2_id") REFERENCES "ms2"("ms2_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "detail_rencana_pembelian_ms2" ADD CONSTRAINT "detail_rencana_pembelian_ms2_detail_rencana_pembelian_id_fkey" FOREIGN KEY ("detail_rencana_pembelian_id") REFERENCES "detail_rencana_pembelian"("detail_rencana_pembelian_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "detail_rencana_pembelian_ms2" ADD CONSTRAINT "detail_rencana_pembelian_ms2_jam_kerja_id_fkey" FOREIGN KEY ("jam_kerja_id") REFERENCES "jam_kerja"("jam_kerja_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "detail_tera" ADD CONSTRAINT "detail_tera_dokumen_stok_id_fkey" FOREIGN KEY ("dokumen_stok_id") REFERENCES "dokumen_stok"("dokumen_stok_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "detail_tera" ADD CONSTRAINT "detail_tera_tera_id_fkey" FOREIGN KEY ("tera_id") REFERENCES "tera"("tera_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "devices" ADD CONSTRAINT "devices_penjadwalan_id_fkey" FOREIGN KEY ("penjadwalan_id") REFERENCES "penjadwalan"("penjadwalan_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dispenser" ADD CONSTRAINT "dispenser_payung_id_fkey" FOREIGN KEY ("payung_id") REFERENCES "payung"("payung_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "divisi" ADD CONSTRAINT "divisi_spbu_id_fkey" FOREIGN KEY ("spbu_id") REFERENCES "spbu"("spbu_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dokumen_stok" ADD CONSTRAINT "dokumen_stok_stok_inventory_id_fkey" FOREIGN KEY ("stok_inventory_id") REFERENCES "stok_inventory"("stok_inventory_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dokumen_stok" ADD CONSTRAINT "dokumen_stok_member_id_fkey" FOREIGN KEY ("member_id") REFERENCES "member"("member_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dokumen_stok" ADD CONSTRAINT "dokumen_stok_dombak_id_fkey" FOREIGN KEY ("dombak_id") REFERENCES "dombak"("dombak_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dokumen_stok" ADD CONSTRAINT "dokumen_stok_jam_kerja_id_fkey" FOREIGN KEY ("jam_kerja_id") REFERENCES "jam_kerja"("jam_kerja_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dokumen_stok" ADD CONSTRAINT "dokumen_stok_type_dokumen_stok_id_fkey" FOREIGN KEY ("type_dokumen_stok_id") REFERENCES "type_dokumen_stok"("type_dokumen_stok_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dombak" ADD CONSTRAINT "dombak_spbu_id_fkey" FOREIGN KEY ("spbu_id") REFERENCES "spbu"("spbu_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dombak_transfer" ADD CONSTRAINT "dombak_transfer_produk_id_fkey" FOREIGN KEY ("produk_id") REFERENCES "produk"("produk_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dombak_transfer" ADD CONSTRAINT "dombak_transfer_jam_kerja_id_fkey" FOREIGN KEY ("jam_kerja_id") REFERENCES "jam_kerja"("jam_kerja_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "fasilitas" ADD CONSTRAINT "fasilitas_spbu_id_fkey" FOREIGN KEY ("spbu_id") REFERENCES "spbu"("spbu_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "file_aset" ADD CONSTRAINT "file_aset_aset_id_fkey" FOREIGN KEY ("aset_id") REFERENCES "aset"("aset_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "file_dokumen_stok" ADD CONSTRAINT "file_dokumen_stok_dokumen_stok_id_fkey" FOREIGN KEY ("dokumen_stok_id") REFERENCES "dokumen_stok"("dokumen_stok_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "file_fasilitas" ADD CONSTRAINT "file_fasilitas_fasilitas_id_fkey" FOREIGN KEY ("fasilitas_id") REFERENCES "fasilitas"("fasilitas_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "file_lampiran_lo" ADD CONSTRAINT "file_lampiran_lo_file_lo_id_fkey" FOREIGN KEY ("file_lo_id") REFERENCES "file_lo"("file_lo_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "file_lo" ADD CONSTRAINT "file_lo_pengiriman_id_fkey" FOREIGN KEY ("pengiriman_id") REFERENCES "pengiriman"("pengiriman_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "file_lo" ADD CONSTRAINT "file_lo_produk_id_fkey" FOREIGN KEY ("produk_id") REFERENCES "produk"("produk_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "file_pembayaran" ADD CONSTRAINT "file_pembayaran_pembayaran_id_fkey" FOREIGN KEY ("pembayaran_id") REFERENCES "pembayaran"("pembayaran_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "file_penarikan" ADD CONSTRAINT "file_penarikan_penarikan_id_fkey" FOREIGN KEY ("penarikan_id") REFERENCES "penarikan"("penarikan_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "file_penerimaan" ADD CONSTRAINT "file_penerimaan_penerimaan_id_fkey" FOREIGN KEY ("penerimaan_id") REFERENCES "penerimaan"("penerimaan_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "file_petty_cash" ADD CONSTRAINT "file_petty_cash_petty_cash_id_fkey" FOREIGN KEY ("petty_cash_id") REFERENCES "petty_cash"("petty_cash_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "file_post" ADD CONSTRAINT "file_post_post_id_fkey" FOREIGN KEY ("post_id") REFERENCES "post"("post_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "file_stand_meter" ADD CONSTRAINT "file_stand_meter_stand_meter_id_fkey" FOREIGN KEY ("stand_meter_id") REFERENCES "stand_meter"("stand_meter_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "gaji" ADD CONSTRAINT "gaji_jabatan_id_fkey" FOREIGN KEY ("jabatan_id") REFERENCES "jabatan"("jabatan_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "gaji_member" ADD CONSTRAINT "gaji_member_gaji_id_fkey" FOREIGN KEY ("gaji_id") REFERENCES "gaji"("gaji_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "gaji_member" ADD CONSTRAINT "gaji_member_member_id_fkey" FOREIGN KEY ("member_id") REFERENCES "member"("member_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "harga" ADD CONSTRAINT "harga_produk_id_fkey" FOREIGN KEY ("produk_id") REFERENCES "produk"("produk_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "harga" ADD CONSTRAINT "harga_jam_kerja_id_fkey" FOREIGN KEY ("jam_kerja_id") REFERENCES "jam_kerja"("jam_kerja_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "image_selfie" ADD CONSTRAINT "image_selfie_penjadwalan_id_fkey" FOREIGN KEY ("penjadwalan_id") REFERENCES "penjadwalan"("penjadwalan_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "jabatan" ADD CONSTRAINT "jabatan_level_id_fkey" FOREIGN KEY ("level_id") REFERENCES "level"("level_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "jam_kerja" ADD CONSTRAINT "jam_kerja_spbu_id_fkey" FOREIGN KEY ("spbu_id") REFERENCES "spbu"("spbu_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "konversi" ADD CONSTRAINT "konversi_satuan_ukur_tinggi_id_fkey" FOREIGN KEY ("satuan_ukur_tinggi_id") REFERENCES "satuan_ukur_tinggi"("satuan_ukur_tinggi_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "konversi" ADD CONSTRAINT "konversi_satuan_ukur_volume_id_fkey" FOREIGN KEY ("satuan_ukur_volume_id") REFERENCES "satuan_ukur_volume"("satuan_ukur_volume_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "konversi" ADD CONSTRAINT "konversi_dombak_id_fkey" FOREIGN KEY ("dombak_id") REFERENCES "dombak"("dombak_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "level" ADD CONSTRAINT "level_divisi_id_fkey" FOREIGN KEY ("divisi_id") REFERENCES "divisi"("divisi_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "location" ADD CONSTRAINT "location_penjadwalan_id_fkey" FOREIGN KEY ("penjadwalan_id") REFERENCES "penjadwalan"("penjadwalan_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "losses" ADD CONSTRAINT "losses_jenis_losses_id_fkey" FOREIGN KEY ("jenis_losses_id") REFERENCES "jenis_losses"("jenis_losses_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "losses" ADD CONSTRAINT "losses_dokumen_stok_id_fkey" FOREIGN KEY ("dokumen_stok_id") REFERENCES "dokumen_stok"("dokumen_stok_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "member" ADD CONSTRAINT "member_ktp_id_fkey" FOREIGN KEY ("ktp_id") REFERENCES "ktp"("ktp_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "member" ADD CONSTRAINT "member_status_member_id_fkey" FOREIGN KEY ("status_member_id") REFERENCES "status_member"("status_member_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ms2" ADD CONSTRAINT "ms2_member_id_fkey" FOREIGN KEY ("member_id") REFERENCES "member"("member_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "notifikasi" ADD CONSTRAINT "notifikasi_member_id_fkey" FOREIGN KEY ("member_id") REFERENCES "member"("member_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "nozzle" ADD CONSTRAINT "nozzle_dispenser_id_fkey" FOREIGN KEY ("dispenser_id") REFERENCES "dispenser"("dispenser_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "nozzle" ADD CONSTRAINT "nozzle_produk_id_fkey" FOREIGN KEY ("produk_id") REFERENCES "produk"("produk_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pajak_pembelian" ADD CONSTRAINT "pajak_pembelian_rencana_pembelian_id_fkey" FOREIGN KEY ("rencana_pembelian_id") REFERENCES "rencana_pembelian"("rencana_pembelian_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pajak_pembelian" ADD CONSTRAINT "pajak_pembelian_pajak_pembelian_lib_id_fkey" FOREIGN KEY ("pajak_pembelian_lib_id") REFERENCES "pajak_pembelian_lib"("pajak_pembelian_lib_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "payung" ADD CONSTRAINT "payung_spbu_id_fkey" FOREIGN KEY ("spbu_id") REFERENCES "spbu"("spbu_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pembayaran" ADD CONSTRAINT "pembayaran_rencana_pembelian_id_fkey" FOREIGN KEY ("rencana_pembelian_id") REFERENCES "rencana_pembelian"("rencana_pembelian_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pembayaran" ADD CONSTRAINT "pembayaran_member_id_fkey" FOREIGN KEY ("member_id") REFERENCES "member"("member_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "penarikan" ADD CONSTRAINT "penarikan_penjualan_id_fkey" FOREIGN KEY ("penjualan_id") REFERENCES "penjualan"("penjualan_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "penarikan" ADD CONSTRAINT "penarikan_member_id_fkey" FOREIGN KEY ("member_id") REFERENCES "member"("member_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "penerimaan" ADD CONSTRAINT "penerimaan_file_lo_id_fkey" FOREIGN KEY ("file_lo_id") REFERENCES "file_lo"("file_lo_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "penerimaan" ADD CONSTRAINT "penerimaan_dokumen_stok_id_fkey" FOREIGN KEY ("dokumen_stok_id") REFERENCES "dokumen_stok"("dokumen_stok_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "penerimaan_stok_taking" ADD CONSTRAINT "penerimaan_stok_taking_penerimaan_id_fkey" FOREIGN KEY ("penerimaan_id") REFERENCES "penerimaan"("penerimaan_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "penerimaan_stok_taking" ADD CONSTRAINT "penerimaan_stok_taking_dokumen_stok_id_fkey" FOREIGN KEY ("dokumen_stok_id") REFERENCES "dokumen_stok"("dokumen_stok_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pengiriman" ADD CONSTRAINT "pengiriman_member_id_fkey" FOREIGN KEY ("member_id") REFERENCES "member"("member_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "penjadwalan" ADD CONSTRAINT "penjadwalan_status_kehadiran_id_fkey" FOREIGN KEY ("status_kehadiran_id") REFERENCES "status_kehadiran"("status_kehadiran_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "penjadwalan" ADD CONSTRAINT "penjadwalan_jabatan_id_fkey" FOREIGN KEY ("jabatan_id") REFERENCES "jabatan"("jabatan_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "penjadwalan" ADD CONSTRAINT "penjadwalan_member_id_fkey" FOREIGN KEY ("member_id") REFERENCES "member"("member_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "penjadwalan" ADD CONSTRAINT "penjadwalan_jam_kerja_id_fkey" FOREIGN KEY ("jam_kerja_id") REFERENCES "jam_kerja"("jam_kerja_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "penjualan" ADD CONSTRAINT "penjualan_spbu_id_fkey" FOREIGN KEY ("spbu_id") REFERENCES "spbu"("spbu_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "penjualan" ADD CONSTRAINT "penjualan_jam_kerja_id_fkey" FOREIGN KEY ("jam_kerja_id") REFERENCES "jam_kerja"("jam_kerja_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "penjualan" ADD CONSTRAINT "penjualan_status_setoran_id_fkey" FOREIGN KEY ("status_setoran_id") REFERENCES "status_setoran"("status_setoran_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "penjualan_penarikan" ADD CONSTRAINT "penjualan_penarikan_penjualan_id_fkey" FOREIGN KEY ("penjualan_id") REFERENCES "penjualan"("penjualan_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "penjualan_penarikan" ADD CONSTRAINT "penjualan_penarikan_member_id_fkey" FOREIGN KEY ("member_id") REFERENCES "member"("member_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "petty_cash" ADD CONSTRAINT "petty_cash_spbu_id_fkey" FOREIGN KEY ("spbu_id") REFERENCES "spbu"("spbu_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pj_operasional_setoran" ADD CONSTRAINT "pj_operasional_setoran_penjualan_id_fkey" FOREIGN KEY ("penjualan_id") REFERENCES "penjualan"("penjualan_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pj_operasional_setoran" ADD CONSTRAINT "pj_operasional_setoran_jabatan_id_fkey" FOREIGN KEY ("jabatan_id") REFERENCES "jabatan"("jabatan_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pj_operasional_setoran" ADD CONSTRAINT "pj_operasional_setoran_member_id_fkey" FOREIGN KEY ("member_id") REFERENCES "member"("member_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "post" ADD CONSTRAINT "post_member_id_fkey" FOREIGN KEY ("member_id") REFERENCES "member"("member_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "presensi" ADD CONSTRAINT "presensi_status_presensi_id_fkey" FOREIGN KEY ("status_presensi_id") REFERENCES "status_presensi"("status_presensi_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "presensi" ADD CONSTRAINT "presensi_mesin_presensi_id_fkey" FOREIGN KEY ("mesin_presensi_id") REFERENCES "mesin_presensi"("mesin_presensi_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "presensi" ADD CONSTRAINT "presensi_jam_kerja_id_fkey" FOREIGN KEY ("jam_kerja_id") REFERENCES "jam_kerja"("jam_kerja_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "presensi" ADD CONSTRAINT "presensi_member_id_fkey" FOREIGN KEY ("member_id") REFERENCES "member"("member_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "random_string_barcode" ADD CONSTRAINT "random_string_barcode_penjadwalanPenjadwalanId_fkey" FOREIGN KEY ("penjadwalanPenjadwalanId") REFERENCES "penjadwalan"("penjadwalan_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "spbu" ADD CONSTRAINT "spbu_memberMemberId_fkey" FOREIGN KEY ("memberMemberId") REFERENCES "member"("member_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stand_meter" ADD CONSTRAINT "stand_meter_dombakDombakId_fkey" FOREIGN KEY ("dombakDombakId") REFERENCES "dombak"("dombak_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stok_inventory_dombak" ADD CONSTRAINT "stok_inventory_dombak_dombakDombakId_fkey" FOREIGN KEY ("dombakDombakId") REFERENCES "dombak"("dombak_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "supir" ADD CONSTRAINT "supir_pengirimanPengirimanId_fkey" FOREIGN KEY ("pengirimanPengirimanId") REFERENCES "pengiriman"("pengiriman_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tera_return" ADD CONSTRAINT "tera_return_tera_from_id_fkey" FOREIGN KEY ("tera_from_id") REFERENCES "tera"("tera_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tera_return" ADD CONSTRAINT "tera_return_tera_to_id_fkey" FOREIGN KEY ("tera_to_id") REFERENCES "tera"("tera_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "jabatan_member" ADD CONSTRAINT "jabatan_member_jabatan_id_fkey" FOREIGN KEY ("jabatan_id") REFERENCES "jabatan"("jabatan_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "jabatan_member" ADD CONSTRAINT "jabatan_member_member_id_fkey" FOREIGN KEY ("member_id") REFERENCES "member"("member_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dombak_payung" ADD CONSTRAINT "dombak_payung_dombak_id_fkey" FOREIGN KEY ("dombak_id") REFERENCES "dombak"("dombak_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dombak_payung" ADD CONSTRAINT "dombak_payung_payung_id_fkey" FOREIGN KEY ("payung_id") REFERENCES "payung"("payung_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dombak_transfer_dokumen_stok" ADD CONSTRAINT "dombak_transfer_dokumen_stok_dombak_transfer_id_fkey" FOREIGN KEY ("dombak_transfer_id") REFERENCES "dombak_transfer"("dombak_transfer_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dombak_transfer_dokumen_stok" ADD CONSTRAINT "dombak_transfer_dokumen_stok_dokumen_stok_id_fkey" FOREIGN KEY ("dokumen_stok_id") REFERENCES "dokumen_stok"("dokumen_stok_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "hari_jam_kerja" ADD CONSTRAINT "hari_jam_kerja_hari_id_fkey" FOREIGN KEY ("hari_id") REFERENCES "hari"("hari_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "hari_jam_kerja" ADD CONSTRAINT "hari_jam_kerja_jam_kerja_id_fkey" FOREIGN KEY ("jam_kerja_id") REFERENCES "jam_kerja"("jam_kerja_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "kategori_post" ADD CONSTRAINT "kategori_post_kategori_id_fkey" FOREIGN KEY ("kategori_id") REFERENCES "kategori"("kategori_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "kategori_post" ADD CONSTRAINT "kategori_post_post_id_fkey" FOREIGN KEY ("post_id") REFERENCES "post"("post_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "konversi_dokumen_stok" ADD CONSTRAINT "konversi_dokumen_stok_konversi_id_fkey" FOREIGN KEY ("konversi_id") REFERENCES "konversi"("konversi_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "konversi_dokumen_stok" ADD CONSTRAINT "konversi_dokumen_stok_dokumen_stok_id_fkey" FOREIGN KEY ("dokumen_stok_id") REFERENCES "dokumen_stok"("dokumen_stok_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "penerimaan_petty_cash" ADD CONSTRAINT "penerimaan_petty_cash_penerimaan_id_fkey" FOREIGN KEY ("penerimaan_id") REFERENCES "penerimaan"("penerimaan_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "penerimaan_petty_cash" ADD CONSTRAINT "penerimaan_petty_cash_petty_cash_id_fkey" FOREIGN KEY ("petty_cash_id") REFERENCES "petty_cash"("petty_cash_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pengiriman_ms2" ADD CONSTRAINT "pengiriman_ms2_pengiriman_id_fkey" FOREIGN KEY ("pengiriman_id") REFERENCES "pengiriman"("pengiriman_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pengiriman_ms2" ADD CONSTRAINT "pengiriman_ms2_ms2_id_fkey" FOREIGN KEY ("ms2_id") REFERENCES "ms2"("ms2_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "penjadwalan_nozzle" ADD CONSTRAINT "penjadwalan_nozzle_penjadwalan_id_fkey" FOREIGN KEY ("penjadwalan_id") REFERENCES "penjadwalan"("penjadwalan_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "penjadwalan_nozzle" ADD CONSTRAINT "penjadwalan_nozzle_nozzle_id_fkey" FOREIGN KEY ("nozzle_id") REFERENCES "nozzle"("nozzle_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stand_meter_dokumen_stok" ADD CONSTRAINT "stand_meter_dokumen_stok_stand_meter_id_fkey" FOREIGN KEY ("stand_meter_id") REFERENCES "stand_meter"("stand_meter_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "stand_meter_dokumen_stok" ADD CONSTRAINT "stand_meter_dokumen_stok_dokumen_stok_id_fkey" FOREIGN KEY ("dokumen_stok_id") REFERENCES "dokumen_stok"("dokumen_stok_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tag_post" ADD CONSTRAINT "tag_post_tag_id_fkey" FOREIGN KEY ("tag_id") REFERENCES "tag"("tag_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tag_post" ADD CONSTRAINT "tag_post_post_id_fkey" FOREIGN KEY ("post_id") REFERENCES "post"("post_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tera_petty_cash" ADD CONSTRAINT "tera_petty_cash_tera_id_fkey" FOREIGN KEY ("tera_id") REFERENCES "tera"("tera_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "tera_petty_cash" ADD CONSTRAINT "tera_petty_cash_petty_cash_id_fkey" FOREIGN KEY ("petty_cash_id") REFERENCES "petty_cash"("petty_cash_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "detail_rencana_file" ADD CONSTRAINT "detail_rencana_file_detail_rencana_pembelian_id_fkey" FOREIGN KEY ("detail_rencana_pembelian_id") REFERENCES "detail_rencana_pembelian"("detail_rencana_pembelian_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "detail_rencana_file" ADD CONSTRAINT "detail_rencana_file_file_lo_id_fkey" FOREIGN KEY ("file_lo_id") REFERENCES "file_lo"("file_lo_id") ON DELETE RESTRICT ON UPDATE CASCADE;
