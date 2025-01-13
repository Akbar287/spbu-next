export interface ProfileProps {
    user: {
        email: string;
        sub: string;
        id: string;
        username: string;
        member: {
            memberId: string;
            ktpId: string;
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
            ktp: {
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
        iat: number;
        exp: number;
        jti: string;
    };
    auth: {
        isAuthenticated: boolean;
        username: string;
        accessToken: string;
        expiredAt: number;
    };
}

export const ProfileValue: ProfileProps = {
    user: {
        email: "",
        sub: "",
        id: "",
        username: "",
        member: {
            memberId: "",
            ktpId: "",
            statusMemberId: "",
            email: "",
            noHp: "",
            noWa: "",
            avatar: "",
            bergabungSejak: "",
            createdAt: "",
            updatedAt: "",
            deletedAt: null,
            Ktp: {
                ktpId: "",
                nik: "",
                nama: "",
                jenisKelamin: "",
                tempatLahir: "",
                tanggalLahir: "",
                verified: false,
                createdAt: "",
                updatedAt: "",
                deletedAt: null,
            },
            ktp: {
                ktpId: "",
                nik: "",
                nama: "",
                jenisKelamin: "",
                tempatLahir: "",
                tanggalLahir: "",
                verified: false,
                createdAt: "",
                updatedAt: "",
                deletedAt: null,
            },
        },
        iat: 0,
        exp: 0,
        jti: "",
    },
    auth: {
        isAuthenticated: false,
        username: "",
        accessToken: "",
        expiredAt: 0,
    },
};
