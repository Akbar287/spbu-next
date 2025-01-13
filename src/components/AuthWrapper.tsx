"use client";
import { useEffect } from "react";
import { useSession } from "next-auth/react";
import { useRouter } from "next/router";
import { ProfileProps, ProfileValue } from "@/model/Profile";
import { setZustandValue } from "nes-zustand";
import { authStore } from "@/store/AuthStore";

const AuthWrapper: React.FC<{ children: React.ReactNode }> = ({ children }) => {
    const { data: session, status } = useSession();
    const router = useRouter();

    useEffect(() => {
        if (status === "authenticated") {
            setZustandValue<ProfileProps>(authStore, {
                user: ProfileValue.user,
                auth: {
                    isAuthenticated: true,
                    username: "Akbar123",
                    accessToken: "1234567890",
                    expiredAt: 1234567890,
                },
            });
        } else if (status === "unauthenticated") {
            setZustandValue<ProfileProps>(authStore, ProfileValue);

            if (router.pathname !== "/login") {
                router.push("/login");
            }
        }
    }, [status, session, router]);

    if (status === "loading") {
        return <div>Loading...</div>;
    }
    return <>{children}</>;
};

export default AuthWrapper;
