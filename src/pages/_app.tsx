import type { AppProps } from "next/app";
import { ThemeProvider } from "next-themes";
import { SessionProvider } from "next-auth/react";
import AuthWrapper from "@/components/AuthWrapper";
import "../styles/globals.css";
import React from "react";
import { useRouter } from "next/router";
import Loading from "@/components/Loading";

export default function App({
    Component,
    pageProps: { session, ...pageProps },
}: AppProps) {
    const [loading, setLoading] = React.useState(false);
    const router = useRouter();

    React.useEffect(() => {
        const handleStart = () => setLoading(true);
        const handleStop = () => setLoading(false);

        router.events.on("routeChangeStart", handleStart);
        router.events.on("routeChangeComplete", handleStop);
        router.events.on("routeChangeError", handleStop);

        return () => {
            router.events.off("routeChangeStart", handleStart);
            router.events.off("routeChangeComplete", handleStop);
            router.events.off("routeChangeError", handleStop);
        };
    }, [router]);

    return (
        <SessionProvider session={session}>
            <ThemeProvider
                attribute={"class"}
                defaultTheme="system"
                enableSystem={true}
                disableTransitionOnChange
            >
                <AuthWrapper>
                    <Loading visible={loading} />
                    <Component {...pageProps} />
                </AuthWrapper>
            </ThemeProvider>
        </SessionProvider>
    );
}
