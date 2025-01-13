import Layout from "@/components/Layout";
import React from "react";
import Link from "next/link";

const NotFound = () => {
    return (
        <Layout title="404" isReady>
            <div className="flex min-h-svh flex-col items-center justify-center gap-6 bg-background p-6 md:p-10">
                <div className="w-full max-w-sm">
                    <h1 className="scroll-m-20 text-4xl text-center mb-6 font-extrabold tracking-tight lg:text-5xl">
                        404
                    </h1>
                    <h2 className="scroll-m-20 mb-8 border-b pb-2 text-3xl font-semibold tracking-tight first:mt-0">
                        Halaman Tidak Ditemukan
                    </h2>
                    <p className="text-center">
                        Kembali ke{" "}
                        <Link href="/" className="font-bold text-primary">
                            Halaman Utama
                        </Link>
                    </p>
                </div>
            </div>
        </Layout>
    );
};

export default NotFound;
