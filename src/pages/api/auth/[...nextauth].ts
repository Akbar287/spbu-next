import NextAuth from "next-auth";
import CredentialsProvider from "next-auth/providers/credentials";
import Bycript from "bcrypt";
import prisma from "@/lib/prisma"; 
import { Session } from "next-auth";
import { JWT } from "next-auth/jwt";

export const authOptions = {
    providers: [
        CredentialsProvider({
            name: "credentials",
            credentials: {
                username: { label: "username", type: "text" },
                password: { label: "password", type: "password" },
            },
            async authorize(credentials, req) {
                try {
                    if (!credentials) {
                        throw new Error("No credentials provided");
                    }
                    const userLogin = await prisma.userlogin.findFirst({
                        where: { username: credentials.username },
                        include: {
                            Member: {
                                include: { Ktp: true },
                            },
                        },
                    });
        
                    if (!userLogin || !userLogin.isAktif) {
                        throw new Error("User tidak ditemukan");
                    }
        
                    const isPasswordValid = await Bycript.compare(credentials.password, userLogin.password);
                    if (!isPasswordValid) {
                        throw new Error("Password salah");
                    }
        
                    return {
                        id: userLogin.userLoginId || "",
                        username: userLogin.username,
                        email: userLogin.Member.email,
                        Member: {
                            memberId: userLogin.Member.memberId,
                            statusMemberId: userLogin.Member.statusMemberId,
                            email: userLogin.Member.email,
                            noHp: userLogin.Member.noHp,
                            noWa: userLogin.Member.noWa,
                            avatar:userLogin.Member.avatar,
                            bergabungSejak: userLogin.Member.bergabungSejak,
                            createdAt: userLogin.Member.createdAt,
                            updatedAt: userLogin.Member.updatedAt,
                            deletedAt: userLogin.Member.deletedAt,
                            Ktp: {
                                ktpId: userLogin.Member.Ktp.ktpId,
                                nik: userLogin.Member.Ktp.nik,
                                nama: userLogin.Member.Ktp.nama,
                                jenisKelamin: userLogin.Member.Ktp.jenisKelamin,
                                tempatLahir: userLogin.Member.Ktp.tempatLahir,
                                tanggalLahir: userLogin.Member.Ktp.tanggalLahir,
                                verified: userLogin.Member.Ktp.verified,
                                createdAt: userLogin.Member.Ktp.createdAt,
                                updatedAt: userLogin.Member.Ktp.updatedAt,
                                deletedAt: userLogin.Member.Ktp.deletedAt,
                            }
                        }
                    };
                } catch (error) {
                    if (error instanceof Error) {
                        return Promise.reject(error);
                    }
                    return Promise.reject("An unknown error occurred");
                }
            },
        }),
        
    ],
    callbacks: {
        async jwt({ token, user }: { token: any, user?: any }) {
            if (user) {
                token.id = user.id;
                token.username = user.username;
                token.Member = user.Member;
            }
            return token;
        },
        async session({ session, token }: { session: Session, token: JWT }) {
            session.user = {
                id: token.id as string,
                email: token.email as string,
                username: token.username as string,
                Member: token.Member as any,
            };
        
            return session;
        },
    },
    pages: {
        signIn: "/login",
        error: "/login",
    },
    secret: process.env.NEXTAUTH_SECRET, // Required for NextAuth
};

export default NextAuth(authOptions);
