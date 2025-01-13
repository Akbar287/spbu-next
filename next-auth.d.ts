import "next-auth";

declare module "next-auth" {
    interface Session {
        user: {
            id: string;
            email: string;
            username: string;
            Member: {
                memberId: string;
                statusMemberId: string;
                email: string;
                noHp: string;
                noWa: string;
                avatar: string;
                bergabungSejak: string;
                createdAt: string;
                updatedAt: string;
                deletedAt: string | null;
                Ktp: {
                    ktpId: string;
                    nik: string;
                    nama: string;
                    jenisKelamin: string;
                    tempatLahir: string;
                    tanggalLahir: string;
                    verified: boolean;
                    createdAt: string;
                    updatedAt: string;
                    deletedAt: string | null;
                };
            };
        };
        expires: string;
    }
}
