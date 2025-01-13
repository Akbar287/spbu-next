"use client";
import React, { ReactNode } from "react";
import Head from "next/head";
import {
    SidebarInset,
    SidebarProvider,
    SidebarTrigger,
} from "@/components/ui/sidebar";
import { AppSidebar } from "@/components/app-sidebar";
import BreadcrumbResponsive from "./Breadcrumbs";
import { Separator } from "./ui/separator";
import { useRouter } from "next/router";
import { RoleMenuProps, RoleMenuValue } from "@/model/RoleMenu";
import { getZustandValue, setZustandValue } from "nes-zustand";
import { activeMenuStore } from "@/store/ActiveMenuStore";
import { useSession } from "next-auth/react";
import { Toaster } from "@/components/ui/toaster";

type LayoutProps = {
    title: string;
    children: ReactNode;
    isReady: boolean;
};

const data = {
    teams: [
        {
            name: "SPBU",
            logo: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" width="24" height="24" stroke-width="1.5"><path d="M5.931 6.936l1.275 4.249m5.607 5.609l4.251 1.275"></path><path d="M11.683 12.317l5.759 -5.759"></path><path d="M5.5 5.5m-1.5 0a1.5 1.5 0 1 0 3 0a1.5 1.5 0 1 0 -3 0"></path><path d="M18.5 5.5m-1.5 0a1.5 1.5 0 1 0 3 0a1.5 1.5 0 1 0 -3 0"></path><path d="M18.5 18.5m-1.5 0a1.5 1.5 0 1 0 3 0a1.5 1.5 0 1 0 -3 0"></path><path d="M8.5 15.5m-4.5 0a4.5 4.5 0 1 0 9 0a4.5 4.5 0 1 0 -9 0"></path></svg>`,
            plan: "Admin",
            menu: [
                {
                    title: "Halaman Utama",
                    url: "/",
                    icon: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" width="24" height="24" stroke-width="1.5"><path d="M5 12l-2 0l9 -9l9 9l-2 0"></path><path d="M5 12v7a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-7"></path><path d="M10 12h4v4h-4z"></path></svg>`,
                },
                {
                    title: "Data Utama",
                    url: "/data-utama",
                    icon: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" width="24" height="24"><path d="M9 3a2 2 0 0 1 2 2v6a2 2 0 0 1 -2 2h-4a2 2 0 0 1 -2 -2v-6a2 2 0 0 1 2 -2zm0 12a2 2 0 0 1 2 2v2a2 2 0 0 1 -2 2h-4a2 2 0 0 1 -2 -2v-2a2 2 0 0 1 2 -2zm10 -4a2 2 0 0 1 2 2v6a2 2 0 0 1 -2 2h-4a2 2 0 0 1 -2 -2v-6a2 2 0 0 1 2 -2zm0 -8a2 2 0 0 1 2 2v2a2 2 0 0 1 -2 2h-4a2 2 0 0 1 -2 -2v-2a2 2 0 0 1 2 -2z"></path></svg>`,
                    items: [
                        {
                            title: "Aset",
                            url: "/data-utama/aset",
                        },
                        {
                            title: "Fasilitas",
                            url: "/data-utama/fasilitas",
                        },
                        {
                            title: "Produk",
                            url: "/data-utama/produk",
                        },
                        {
                            title: "Pegawai",
                            url: "/data-utama/pegawai",
                        },
                        {
                            title: "Harga",
                            url: "/data-utama/harga",
                        },
                        {
                            title: "Dombak",
                            url: "/data-utama/dombak",
                        },
                        {
                            title: "Payung",
                            url: "/data-utama/payung",
                        },
                        {
                            title: "Dispenser",
                            url: "/data-utama/dispenser",
                        },
                        {
                            title: "Nozzle",
                            url: "/data-utama/nozzle",
                        },
                    ],
                },
                {
                    title: "Pengadaan Barang",
                    url: "/pengadaan-barang",
                    icon: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" width="24" height="24" stroke-width="1.5"><path d="M7 17m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0"></path><path d="M17 17m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0"></path><path d="M5 17h-2v-11a1 1 0 0 1 1 -1h9v12m-4 0h6m4 0h2v-6h-8m0 -5h5l3 5"></path></svg>`,
                    items: [
                        {
                            title: "Perencanaan",
                            url: "/pengadaan-barang/perencanaan",
                        },
                        {
                            title: "Pembelian",
                            url: "/pengadaan-barang/pembelian",
                        },
                        {
                            title: "Pembayaran",
                            url: "/pengadaan-barang/pembayaran",
                        },
                        {
                            title: "MS2",
                            url: "/pengadaan-barang/ms2",
                        },
                        {
                            title: "Pengiriman",
                            url: "/pengadaan-barang/pengiriman",
                        },
                    ],
                },
                {
                    title: "Pengelolaan Stok",
                    url: "/pengelolaan-stok",
                    icon: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" width="24" height="24" stroke-width="1.5"> <path d="M7.502 19.423c2.602 2.105 6.395 2.105 8.996 0c2.602 -2.105 3.262 -5.708 1.566 -8.546l-4.89 -7.26c-.42 -.625 -1.287 -.803 -1.936 -.397a1.376 1.376 0 0 0 -.41 .397l-4.893 7.26c-1.695 2.838 -1.035 6.441 1.567 8.546z"></path> </svg> `,
                    items: [
                        {
                            title: "Monitoring Stok",
                            url: "/pengelolaan-stok/monitoring-stok",
                        },
                        {
                            title: "Penerimaan Produk",
                            url: "/pengelolaan-stok/penerimaan-produk",
                        },
                        {
                            title: "Stok Taking",
                            url: "/pengelolaan-stok/stok-taking",
                        },
                        {
                            title: "Stok Transfer",
                            url: "/pengelolaan-stok/stok-transfer",
                        },
                        {
                            title: "Stok Summary",
                            url: "/pengelolaan-stok/stok-summary",
                        },
                    ],
                },
                {
                    title: "Tera",
                    url: "/tera",
                    icon: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" width="24" height="24" stroke-width="1.5" stroke-linejoin="round" stroke-linecap="round" stroke="currentColor"><path d="M7 16.5l-5 -3l5 -3l5 3v5.5l-5 3z"></path><path d="M2 13.5v5.5l5 3"></path><path d="M7 16.545l5 -3.03"></path><path d="M17 16.5l-5 -3l5 -3l5 3v5.5l-5 3z"></path><path d="M12 19l5 3"></path><path d="M17 16.5l5 -3"></path><path d="M12 13.5v-5.5l-5 -3l5 -3l5 3v5.5"></path><path d="M7 5.03v5.455"></path><path d="M12 8l5 -3"></path></svg>`,
                    items: [
                        {
                            title: "Peminjaman",
                            url: "/tera/peminjaman",
                        },
                        {
                            title: "Pengembalian",
                            url: "/tera/pengembalian",
                        },
                    ],
                },
                {
                    title: "Totalisator",
                    url: "/totalisator",
                    icon: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" width="24" height="24" stroke-width="1.5"><path d="M19 5a2.828 2.828 0 0 1 0 4l-8 8h-4v-4l8 -8a2.828 2.828 0 0 1 4 0z"></path><path d="M16 7l-1.5 -1.5"></path><path d="M13 10l-1.5 -1.5"></path><path d="M10 13l-1.5 -1.5"></path><path d="M7 17l-3 3"></path></svg>`,
                },
                {
                    title: "Setoran",
                    url: "/setoran",
                    icon: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" width="24" height="24" stroke-width="1.5"><path d="M7 9m0 2a2 2 0 0 1 2 -2h10a2 2 0 0 1 2 2v6a2 2 0 0 1 -2 2h-10a2 2 0 0 1 -2 -2z"></path><path d="M14 14m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0"></path><path d="M17 9v-2a2 2 0 0 0 -2 -2h-10a2 2 0 0 0 -2 2v6a2 2 0 0 0 2 2h2"></path></svg>`,
                    items: [
                        {
                            title: "Pembukaan Penjualan",
                            url: "/setoran/pembukaan-penjualan",
                        },
                        {
                            title: "Penitipan Setoran",
                            url: "/setoran/penitipan-setoran",
                        },
                        {
                            title: "Penutupan Penjualan",
                            url: "/setoran/penutupan-penjualan",
                        },
                        {
                            title: "Setoran Bank",
                            url: "/setoran/setoran-bank",
                        },
                    ],
                },
                {
                    title: "Keuangan",
                    url: "/keuangan",
                    icon: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" width="24" height="24" stroke-width="1.5"><path d="M3 5m0 3a3 3 0 0 1 3 -3h12a3 3 0 0 1 3 3v8a3 3 0 0 1 -3 3h-12a3 3 0 0 1 -3 -3z"></path><path d="M3 10l18 0"></path><path d="M7 15l.01 0"></path><path d="M11 15l2 0"></path></svg>`,
                    items: [
                        {
                            title: "Petty Cash",
                            url: "/keuangan/petty-cash",
                        },
                        {
                            title: "Rekap Pajak",
                            url: "/keuangan/rekap-pajak",
                        },
                        {
                            title: "Margin",
                            url: "/keuangan/margin",
                        },
                        {
                            title: "Laba Rugi",
                            url: "/keuangan/laba-rugi",
                        },
                        {
                            title: "Neraca",
                            url: "/keuangan/neraca",
                        },
                        {
                            title: "Buku Besar",
                            url: "/keuangan/buku-besar",
                        },
                        {
                            title: "Arus Kas",
                            url: "/keuangan/arus-kas",
                        },
                        {
                            title: "Perubahan Modal",
                            url: "/keuangan/perubahan-modal",
                        },
                    ],
                },
                {
                    title: "Jadwal Kerja",
                    url: "/jadwal-kerja",
                    icon: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" width="24" height="24" stroke-width="1.5"><path d="M4 7a2 2 0 0 1 2 -2h12a2 2 0 0 1 2 2v12a2 2 0 0 1 -2 2h-12a2 2 0 0 1 -2 -2v-12z"></path><path d="M16 3v4"></path><path d="M8 3v4"></path><path d="M4 11h16"></path><path d="M7 14h.013"></path><path d="M10.01 14h.005"></path><path d="M13.01 14h.005"></path><path d="M16.015 14h.005"></path><path d="M13.015 17h.005"></path><path d="M7.01 17h.005"></path><path d="M10.01 17h.005"></path></svg>`,
                    items: [
                        {
                            title: "Penjadwalan",
                            url: "/jadwal-kerja/penjadwalan",
                        },
                        {
                            title: "Absensi",
                            url: "/jadwal-kerja/absensi",
                        },
                        {
                            title: "Laporan Absensi",
                            url: "/jadwal-kerja/laporan-absensi",
                        },
                    ],
                },
                {
                    title: "Konfigurasi",
                    url: "/konfigurasi",
                    icon: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" width="24" height="24" stroke-width="1.5"><path d="M4 10a2 2 0 1 0 4 0a2 2 0 0 0 -4 0"></path><path d="M6 4v4"></path><path d="M6 12v8"></path><path d="M10 16a2 2 0 1 0 4 0a2 2 0 0 0 -4 0"></path><path d="M12 4v10"></path><path d="M12 18v2"></path><path d="M16 7a2 2 0 1 0 4 0a2 2 0 0 0 -4 0"></path><path d="M18 4v1"></path><path d="M18 9v11"></path></svg>`,
                    items: [
                        {
                            title: "SPBU",
                            url: "/konfigurasi/spbu",
                        },
                        {
                            title: "Divisi",
                            url: "/konfigurasi/divisi",
                        },
                        {
                            title: "Level",
                            url: "/konfigurasi/level",
                        },
                        {
                            title: "Jabatan",
                            url: "/konfigurasi/jabatan",
                        },
                        {
                            title: "Pajak",
                            url: "/konfigurasi/pajak",
                        },
                        {
                            title: "Hari",
                            url: "/konfigurasi/hari",
                        },
                        {
                            title: "Jam Kerja",
                            url: "/konfigurasi/jam-kerja",
                        },
                    ],
                },
            ],
        },
        {
            name: "SPBU",
            logo: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" width="24" height="24" stroke-width="1.5"><path d="M12 22l4 -4l-2.5 -11l.993 -2.649a1 1 0 0 0 -.936 -1.351h-3.114a1 1 0 0 0 -.936 1.351l.993 2.649l-2.5 11l4 4z"></path><path d="M10.5 7h3l5 5.5"></path></svg>`,
            plan: "Eksekutif",
            menu: [
                {
                    title: "Halaman Utama",
                    url: "/",
                    icon: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" width="24" height="24" stroke-width="1.5"><path d="M5 12l-2 0l9 -9l9 9l-2 0"></path><path d="M5 12v7a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-7"></path><path d="M10 12h4v4h-4z"></path></svg>`,
                },
                {
                    title: "Stok",
                    url: "/chartstok",
                    icon: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" width="24" height="24" stroke-width="1.5"><path d="M19 5a2.828 2.828 0 0 1 0 4l-8 8h-4v-4l8 -8a2.828 2.828 0 0 1 4 0z"></path><path d="M16 7l-1.5 -1.5"></path><path d="M13 10l-1.5 -1.5"></path><path d="M10 13l-1.5 -1.5"></path><path d="M7 17l-3 3"></path></svg>`,
                },
                {
                    title: "Pembayaran",
                    url: "/pembayaran",
                    icon: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" width="24" height="24" stroke-width="1.5"><path d="M3 5m0 3a3 3 0 0 1 3 -3h12a3 3 0 0 1 3 3v8a3 3 0 0 1 -3 3h-12a3 3 0 0 1 -3 -3z"></path><path d="M3 10l18 0"></path><path d="M7 15l.01 0"></path><path d="M11 15l2 0"></path></svg>`,
                },
                {
                    title: "Setoran",
                    url: "/chartsetoran",
                    icon: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" width="24" height="24" stroke-width="1.5"><path d="M7 9m0 2a2 2 0 0 1 2 -2h10a2 2 0 0 1 2 2v6a2 2 0 0 1 -2 2h-10a2 2 0 0 1 -2 -2z"></path><path d="M14 14m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0"></path><path d="M17 9v-2a2 2 0 0 0 -2 -2h-10a2 2 0 0 0 -2 2v6a2 2 0 0 0 2 2h2"></path></svg>`,
                },
                {
                    title: "Absensi",
                    url: "/chartabsensi",
                    icon: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" width="24" height="24" stroke-width="1.5"><path d="M4 7a2 2 0 0 1 2 -2h12a2 2 0 0 1 2 2v12a2 2 0 0 1 -2 2h-12a2 2 0 0 1 -2 -2v-12z"></path><path d="M16 3v4"></path><path d="M8 3v4"></path><path d="M4 11h16"></path><path d="M7 14h.013"></path><path d="M10.01 14h.005"></path><path d="M13.01 14h.005"></path><path d="M16.015 14h.005"></path><path d="M13.015 17h.005"></path><path d="M7.01 17h.005"></path><path d="M10.01 17h.005"></path></svg>`,
                },
            ],
        },
        {
            name: "SPBU",
            logo: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" width="24" height="24" stroke-width="1.5"><path d="M13 4m-1 0a1 1 0 1 0 2 0a1 1 0 1 0 -2 0"></path><path d="M4 17l5 1l.75 -1.5"></path><path d="M15 21l0 -4l-4 -3l1 -6"></path><path d="M7 12l0 -3l5 -1l3 3l3 1"></path></svg>`,
            plan: "Operator",
            menu: [
                {
                    title: "Halaman Utama",
                    url: "/",
                    icon: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" width="24" height="24" stroke-width="1.5"><path d="M5 12l-2 0l9 -9l9 9l-2 0"></path><path d="M5 12v7a2 2 0 0 0 2 2h10a2 2 0 0 0 2 -2v-7"></path><path d="M10 12h4v4h-4z"></path></svg>`,
                },
                {
                    title: "Absen Saya",
                    url: "/operatorabsen",
                    icon: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" width="24" height="24" stroke-width="1.5"><path d="M4 7a2 2 0 0 1 2 -2h12a2 2 0 0 1 2 2v12a2 2 0 0 1 -2 2h-12a2 2 0 0 1 -2 -2v-12z"></path><path d="M16 3v4"></path><path d="M8 3v4"></path><path d="M4 11h16"></path><path d="M7 14h.013"></path><path d="M10.01 14h.005"></path><path d="M13.01 14h.005"></path><path d="M16.015 14h.005"></path><path d="M13.015 17h.005"></path><path d="M7.01 17h.005"></path><path d="M10.01 17h.005"></path></svg>`,
                },
                {
                    title: "Penerimaan Produk",
                    url: "/operatorpenerimaan",
                    icon: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" width="24" height="24" stroke-width="1.5"><path d="M7 17m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0"></path><path d="M17 17m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0"></path><path d="M5 17h-2v-11a1 1 0 0 1 1 -1h9v12m-4 0h6m4 0h2v-6h-8m0 -5h5l3 5"></path></svg>`,
                },
                {
                    title: "Stok Taking",
                    url: "/operatortaking",
                    icon: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" width="24" height="24" stroke-width="1.5"><path d="M19 5a2.828 2.828 0 0 1 0 4l-8 8h-4v-4l8 -8a2.828 2.828 0 0 1 4 0z"></path><path d="M16 7l-1.5 -1.5"></path><path d="M13 10l-1.5 -1.5"></path><path d="M10 13l-1.5 -1.5"></path><path d="M7 17l-3 3"></path></svg>`,
                },
                {
                    title: "Stok Transfer",
                    url: "/operatortransfer",
                    icon: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" width="24" height="24" stroke-width="1.5"><path d="M20 10h-16l5.5 -6"></path><path d="M4 14h16l-5.5 6"></path></svg>`,
                },
            ],
        },
    ],
};

const Layout: React.FC<LayoutProps> = (props) => {
    const { data: session } = useSession();
    const router = useRouter();
    const [activeTeam, setActiveTeam] =
        React.useState<RoleMenuProps>(RoleMenuValue);
    const selectSpbu = (team: (typeof data.teams)[0]) => {
        setActiveTeam(team);
        localStorage.setItem("apps.role", JSON.stringify(team));
        router.push("/");
    };

    React.useEffect(() => {
        if (activeTeam.menu.length === 0) {
            if (localStorage.getItem("apps.role")) {
                const storedRole = localStorage.getItem("apps.role");
                if (storedRole) {
                    setActiveTeam(JSON.parse(storedRole));
                    setZustandValue(activeMenuStore, JSON.parse(storedRole));
                }
            }
            if (getZustandValue(activeMenuStore).menu.length > 0) {
                let temp = getZustandValue(activeMenuStore);
                setActiveTeam(temp);
                localStorage.setItem("apps.role", JSON.stringify(temp));
            }
        }
    }, [activeTeam]);

    return activeTeam.menu.length === 0 ? (
        <div>
            <Head>
                <title>Pilih Peran Anda</title>
                <link rel="icon" href="/favicon.ico" />
            </Head>
            <div className="flex flex-col items-center justify-center h-screen gap-4">
                <div className="flex flex-col items-center gap-4">
                    <h1 className="text-4xl font-semibold text-accent dark:text-gray-100">
                        Pilih Peran Anda
                    </h1>
                    <p className="text-lg text-center text-gray-600 dark:text-gray-300">
                        Pilih peran sesuai dengan tugas dan tanggung jawab anda
                    </p>
                </div>
                <div className="grid gap-4">
                    {data.teams.map((team, index) => (
                        <button
                            key={index}
                            onClick={() => selectSpbu(team)}
                            className="flex hover:scale-110 transition-all items-center gap-2 p-4 text-lg font-semibold text-gray-900 dark:text-white bg-accent rounded-xl"
                        >
                            <span
                                dangerouslySetInnerHTML={{ __html: team.logo }}
                            />
                            <span>{team.plan}</span>
                        </button>
                    ))}
                </div>
            </div>
        </div>
    ) : (
        <SidebarProvider>
            <Head>
                <title>{props.title}</title>
                <link rel="icon" href="/favicon.ico" />
            </Head>
            <AppSidebar
                teams={data.teams}
                activeTeam={activeTeam}
                selectSpbu={selectSpbu}
                user={{
                    name: session?.user?.Member.Ktp.nama ?? "",
                    email: session?.user?.email ?? "",
                    avatar: session?.user?.Member.avatar ?? "",
                }}
            />
            <SidebarInset>
                <header className="flex items-center h-16 gap-2 shrink-0">
                    <div className="flex items-center gap-2 px-4">
                        <SidebarTrigger className="-ml-1" />
                        <Separator
                            orientation="vertical"
                            className="h-4 mr-2"
                        />
                        <BreadcrumbResponsive />
                    </div>
                </header>
                <div className="flex flex-col flex-1 gap-4 p-4 pt-0">
                    {props.title !== "404" && (
                        <h3 className="text-2xl font-semibold tracking-tight scroll-m-20">
                            {props.title}
                        </h3>
                    )}
                    {props.isReady ? (
                        props.children
                    ) : (
                        <React.Fragment>
                            <div className="grid gap-4 auto-rows-min md:grid-cols-3">
                                <div className="aspect-video rounded-xl bg-muted/50" />
                                <div className="aspect-video rounded-xl bg-muted/50" />
                                <div className="aspect-video rounded-xl bg-muted/50" />
                            </div>
                            <div className="min-h-[100vh] flex-1 rounded-xl bg-muted/50 md:min-h-min" />
                        </React.Fragment>
                    )}
                </div>
            </SidebarInset>
            <Toaster />
        </SidebarProvider>
    );
};

export default Layout;
