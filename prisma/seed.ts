const { PrismaClient } =  require("@prisma/client");
const prisma = new PrismaClient();
const Bycript = require("bcrypt");

async function main() {
    console.log("Start Seeding!");

    // Hari Seeder
    const hariCount = await prisma.hari.count();
    if (hariCount === 0) {
        const hari = [
            { namaHari: "Senin", hariKerja: true, keterangan: "Hari senin" },
            { namaHari: "Selasa", hariKerja: true, keterangan: "Hari Selasa" },
            { namaHari: "Rabu", hariKerja: true, keterangan: "Hari Rabu" },
            { namaHari: "Kamis", hariKerja: true, keterangan: "Hari Kamis" },
            { namaHari: "Jumat", hariKerja: true, keterangan: "Hari Jumat" },
            { namaHari: "Sabtu", hariKerja: false, keterangan: "Hari Sabtu" },
            { namaHari: "Minggu", hariKerja: false, keterangan: "Hari Minggu" },
        ];

        await prisma.hari.createMany({ data: hari });
    }

    // JenisLoss Seeder
    const jenisLossCount = await prisma.jenisLosses.count();
    if (jenisLossCount === 0) {
        const jenisLoss = [
            {
                jenisLoss: "Good Issue Penerimaan",
                deskripsi: "Loss terjadi ketika Penerimaan BBM",
            },
            {
                jenisLoss: "Stok Taking",
                deskripsi: "Loss terjadi selama jam kerja berlangsung",
            },
            {
                jenisLoss: "Good Transfer",
                deskripsi: "Loss terjadi selama Pemindahan Stok",
            },
        ];

        await prisma.jenisLosses.createMany({ data: jenisLoss });
    }

    // SatuanUkur Seeder
    const satuanUkurTinggiCount = await prisma.satuanUkurTinggi.count();
    if (satuanUkurTinggiCount === 0) {
        const tinggi = [{ namaSatuan: "Centimeter", singkatan: "cm" }];

        await prisma.satuanUkurTinggi.createMany({ data: tinggi });
    }

    const satuanUkurVolumeCount = await prisma.satuanUkurVolume.count();
    if (satuanUkurVolumeCount === 0) {
        const volume = [
            { namaSatuan: "Ton", singkatan: "ton" },
            { namaSatuan: "Kiloliter", singkatan: "Kl" },
            { namaSatuan: "Liter", singkatan: "ltr" },
        ];

        await prisma.satuanUkurVolume.createMany({ data: volume });
    }

    // StatusPresensi Seeder
    const statusPresensiCount = await prisma.statusPresensi.count();
    if (statusPresensiCount === 0) {
        const statusPresensi = [
            {
                namaStatus: "On Time",
                keterangan: "Tepat Waktu",
                createdAt: new Date(),
                updatedAt: new Date(),
            },
            {
                namaStatus: "Terlambat",
                keterangan: "Masuk Melewati Batas Waktu",
                createdAt: new Date(),
                updatedAt: new Date(),
            },
            {
                namaStatus: "Sakit",
                keterangan: "Tidak Masuk Karena Sakit",
                createdAt: new Date(),
                updatedAt: new Date(),
            },
            {
                namaStatus: "Izin",
                keterangan: "Tidak Masuk Dengan Keterangan",
                createdAt: new Date(),
                updatedAt: new Date(),
            },
            {
                namaStatus: "Alpa",
                keterangan: "Tidak Masuk Tanpa Keterangan",
                createdAt: new Date(),
                updatedAt: new Date(),
            },
        ];

        await prisma.statusPresensi.createMany({ data: statusPresensi });

        // StatusKehadiran Seeder
        const statusKehadiranCount = await prisma.statusKehadiran.count();
        if (statusKehadiranCount === 0) {
            const statusKehadiran = [
                "Dijadwalkan",
                "Hadir",
                "Cuti",
                "Sakit",
                "Tanpa Keterangan",
            ];
            await prisma.statusKehadiran.createMany({
                data: statusKehadiran.map((nama) => ({ namaKehadiran: nama })),
            });
        }

        // StatusSetoran Seeder
        const statusSetoranCount = await prisma.statusSetoran.count();
        if (statusSetoranCount === 0) {
            const statusSetoran = [
                "Open Penjualan",
                "Penitipan Setoran",
                "Closing Penjualan",
                "Setoran Ke Bank",
                "Selesai",
            ];
            await prisma.statusSetoran.createMany({
                data: statusSetoran.map((nama) => ({ namaStatus: nama })),
            });
        }
        // StatusMember Seeder
        const statusMemberCount = await prisma.statusMember.count();
        if (statusMemberCount === 0) {
            const statusMembers = [
                {
                    namaStatus: "Aktif",
                    keterangan: "Member tersebut dapat Login ke sistem",
                },
                {
                    namaStatus: "Ditangguhkan",
                    keterangan: "Member tersebut tidak dapat Login ke sistem",
                },
                {
                    namaStatus: "Tidak Aktif",
                    keterangan: "Member tersebut tidak dapat Login ke sistem",
                },
            ];
            await prisma.statusMember.createMany({ data: statusMembers });
        }
        // Member Seeder
        const memberCount = await prisma.member.count();
        if (memberCount === 0) {
            const statusMember = await prisma.statusMember.findFirst({
                where: { namaStatus: "Aktif" },
            });
            if (!statusMember)
                throw new Error('Status member "Aktif" not found');

            const members = [
                {
                    nik: "3175098761234567",
                    nama: "Akbar",
                    jenisKelamin: "pria",
                    tempatLahir: "Jakarta",
                    tanggalLahir: new Date("2023-06-05"),
                    email: "akbar@email.com",
                    noHp: "081298337465",
                    noWa: "081298337465",
                    username: "Akbar287",
                    password: "Akbar287",
                },
                {
                    nik: "1234567890123450",
                    nama: "Reza Rahardian",
                    jenisKelamin: "pria",
                    tempatLahir: "Jakarta",
                    tanggalLahir: new Date("2023-06-25"),
                    email: "reza@email.com",
                    noHp: "081298337565",
                    noWa: "081298337565",
                    username: "Reza12345",
                    password: "Reza12345",
                },
                {
                    nik: "1234567890123456",
                    nama: "Rena Mizunashi",
                    jenisKelamin: "wanita",
                    tempatLahir: "Surabaya",
                    tanggalLahir: new Date("2023-07-05"),
                    email: "rena@email.com",
                    noHp: "081298327465",
                    noWa: "081298327465",
                    username: "Rena12345",
                    password: "Rena12345",
                },
            ];

            for (const member of members) {
                const ktp = await prisma.ktp.create({
                    data: {
                        nik: member.nik,
                        nama: member.nama,
                        jenisKelamin: member.jenisKelamin,
                        tempatLahir: member.tempatLahir,
                        tanggalLahir: member.tanggalLahir,
                        verified: true,
                        createdAt: new Date(),
                        updatedAt: new Date(),
                    },
                });

                const createdMember = await prisma.member.create({
                    data: {
                        ktpId: ktp.ktpId,
                        statusMemberId: statusMember.statusMemberId,
                        email: member.email,
                        noHp: member.noHp,
                        noWa: member.noWa,
                        avatar: "default.png",
                        bergabungSejak: new Date("2022-05-20"),
                        createdAt: new Date(),
                        updatedAt: new Date(),
                    },
                });

                const userlogin = await prisma.userlogin.create({
                    data: {
                        username: member.username,
                        password: await Bycript.hash(member.password, 10),
                        isAktif: true,
                        memberId: createdMember.memberId,
                        createdAt: new Date(),
                        updatedAt: new Date(),
                    },
                });
            }
        }

        // TypeDokumenStok Seeder
        const typeDokumenStokCount = await prisma.typeDokumenStok.count();
        if (typeDokumenStokCount === 0) {
            const typeDokumenStok = [
                {
                    typeMovement: "Good Receive Penerimaan",
                    deskripsi:
                        "Penerimaan Stok BBM memengaruhi Dokumen Stok secara positif",
                },
                {
                    typeMovement: "Good Issue Sales",
                    deskripsi:
                        "Pengeluaran Stok BBM memengaruhi Dokumen Stok secara negatif",
                },
                {
                    typeMovement: "Good Issue Tera",
                    deskripsi:
                        "Pengeluaran Stok BBM melalui Tera memengaruhi Dokumen Stok secara negatif",
                },
                {
                    typeMovement: "Good Return Tera",
                    deskripsi:
                        "Penerimaan Stok BBM melalui Tera memengaruhi Dokumen Stok secara positif",
                },
                {
                    typeMovement: "Stok Taking Good Receive Penerimaan",
                    deskripsi: "Perhitungan stok sebelum penerimaan BBM",
                },
                { typeMovement: "Stok Taking", deskripsi: "Perhitungan stok" },
                {
                    typeMovement: "Loss",
                    deskripsi:
                        "Perhitungan Kelebihan dan / atau Kekurangan Stok diluar perhitungan",
                },
                {
                    typeMovement: "Commit Change From User",
                    deskripsi: "Perubahan Stok dari User",
                },
                {
                    typeMovement: "Good Transfer Send",
                    deskripsi: "Pengiriman Stok dari Dombak",
                },
                {
                    typeMovement: "Good Transfer Receive",
                    deskripsi: "Penerimaan Stok dari Dombak",
                },
            ];
            await prisma.typeDokumenStok.createMany({ data: typeDokumenStok });
        }

        // StatusPurchase Seeder
        const statusPurchaseCount = await prisma.statusPurchase.count();
        if (statusPurchaseCount === 0) {
            const statusPurchase = [
                {
                    namaStatus: "Rencana",
                    deskripsi: "Purchase Requisition",
                    isAktif: true,
                    createdAt: new Date(),
                    updatedAt: new Date(),
                },
                {
                    namaStatus: "Pembelian",
                    deskripsi: "Purchase Order",
                    isAktif: true,
                    createdAt: new Date(),
                    updatedAt: new Date(),
                },
                {
                    namaStatus: "Pembayaran",
                    deskripsi: "Invoice",
                    isAktif: true,
                    createdAt: new Date(),
                    updatedAt: new Date(),
                },
                {
                    namaStatus: "MS2",
                    deskripsi: "Stok Pertamina",
                    isAktif: true,
                    createdAt: new Date(),
                    updatedAt: new Date(),
                },
                {
                    namaStatus: "Pengiriman",
                    deskripsi: "Delivery",
                    isAktif: true,
                    createdAt: new Date(),
                    updatedAt: new Date(),
                },
                {
                    namaStatus: "Penerimaan",
                    deskripsi: "Good Receive",
                    isAktif: true,
                    createdAt: new Date(),
                    updatedAt: new Date(),
                },
            ];
            await prisma.statusPurchase.createMany({ data: statusPurchase });
        }

        console.log("Seeding completed!");
    }
}

main()
    .catch((e) => {
        console.error(e);
        process.exit(1);
    })
    .finally(async () => {
        await prisma.$disconnect();
    });
