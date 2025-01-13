import { LoginForm } from "@/components/login-form";
import Head from "next/head";
import React from "react";

const Login = () => {
    return (
        <React.Fragment>
            <Head>
                <title>Masuk ke Akun Anda</title>
            </Head>
            <div className="flex flex-col items-center justify-center p-6 min-h-svh bg-muted md:p-10">
                <div className="w-full max-w-sm md:max-w-3xl">
                    <LoginForm />
                </div>
            </div>
        </React.Fragment>
    );
};

export default Login;
