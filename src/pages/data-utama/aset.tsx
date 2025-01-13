import React from "react";
import Layout from "@/components/Layout";
import { DataTable } from "@/components/Datatable";
import { ColumnDef } from "@tanstack/react-table";
import { AsetProps } from "@/model/AsetProps";
import { GetServerSideProps } from "next";
import { PrismaClient } from "@prisma/client";
import { MoreHorizontal } from "lucide-react";
import { Button } from "@/components/ui/button";
import { useToast } from "@/hooks/use-toast";
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuLabel,
    DropdownMenuSeparator,
    DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import {
    AlertDialog,
    AlertDialogAction,
    AlertDialogCancel,
    AlertDialogContent,
    AlertDialogDescription,
    AlertDialogFooter,
    AlertDialogHeader,
    AlertDialogTitle,
} from "@/components/ui/alert-dialog";
import {
    Dialog,
    DialogContent,
    DialogDescription,
    DialogFooter,
    DialogHeader,
    DialogTitle,
} from "@/components/ui/dialog";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";

export const getServerSideProps: GetServerSideProps = async () => {
    const prisma = new PrismaClient();

    try {
        const data = await prisma.aset.findMany();
        return { props: { data: JSON.parse(JSON.stringify(data)) } };
    } catch (error) {
        console.error("Failed to fetch data:", error);
        return { props: { error: "Failed to load data" } };
    } finally {
        await prisma.$disconnect();
    }
};

const AsetColumns: ColumnDef<AsetProps>[] = [
    {
        id: "actions",
        cell: ({ row }) => {
            const aset = row.original;
            const { toast } = useToast();
            const [open, setOpen] = React.useState(false);
            const [openEdit, setOpenEdit] = React.useState(false);

            const updateAset = async () => {
                setOpenEdit(false);
                toast({
                    title: "Data Aset Diubah",
                    description: "Data aset telah diubah dari aplikasi",
                });
            };
            const deleteAset = async () => {
                setOpen(false);
                toast({
                    title: "Data Aset Dihapus",
                    description: "Data aset telah dihapus dari aplikasi",
                });
            };

            return (
                <DropdownMenu>
                    <DropdownMenuTrigger asChild>
                        <Button variant="ghost" className="h-8 w-8 p-0">
                            <span className="sr-only">Open menu</span>
                            <MoreHorizontal className="h-4 w-4" />
                        </Button>
                    </DropdownMenuTrigger>
                    <DropdownMenuContent align="end">
                        <DropdownMenuLabel>Aksi</DropdownMenuLabel>
                        <DropdownMenuItem
                            onClick={() => {
                                navigator.clipboard.writeText(aset.asetId);
                                toast({
                                    title: "Salin Aset ID",
                                    description:
                                        "Aset Id telah disalin ke Clipboard Komputer Anda",
                                });
                            }}
                        >
                            Salin Aset ID
                        </DropdownMenuItem>
                        <DropdownMenuSeparator />
                        <DropdownMenuItem onClick={() => setOpenEdit(true)}>
                            Ubah Data Aset
                        </DropdownMenuItem>
                        <DropdownMenuItem onClick={() => setOpen(true)}>
                            Hapus Data Aset
                        </DropdownMenuItem>
                    </DropdownMenuContent>
                    {/* Edit  */}
                    <Dialog open={openEdit} onOpenChange={setOpenEdit}>
                        <DialogContent className="sm:max-w-[425px]">
                            <DialogHeader>
                                <DialogTitle>Ubah Data Aset</DialogTitle>
                                <DialogDescription>
                                    Buat Perubahan pada data aset yang ingin
                                    Anda ubah
                                </DialogDescription>
                            </DialogHeader>
                            <div className="grid gap-4 py-4">
                                <div className="grid grid-cols-4 items-center gap-4">
                                    <Label
                                        htmlFor="name"
                                        className="text-right"
                                    >
                                        Name
                                    </Label>
                                    <Input
                                        id="name"
                                        value="Pedro Duarte"
                                        className="col-span-3"
                                    />
                                </div>
                                <div className="grid grid-cols-4 items-center gap-4">
                                    <Label
                                        htmlFor="username"
                                        className="text-right"
                                    >
                                        Username
                                    </Label>
                                    <Input
                                        id="username"
                                        value="@peduarte"
                                        className="col-span-3"
                                    />
                                </div>
                            </div>
                            <DialogFooter>
                                <Button
                                    type="submit"
                                    onClick={() => updateAset()}
                                >
                                    Save changes
                                </Button>
                            </DialogFooter>
                        </DialogContent>
                    </Dialog>

                    {/* Delete  */}
                    <AlertDialog open={open} onOpenChange={setOpen}>
                        <AlertDialogContent>
                            <AlertDialogHeader>
                                <AlertDialogTitle>Konfirmasi</AlertDialogTitle>
                                <AlertDialogDescription>
                                    Data yang sudah dihapus tidak dapat
                                    dikembalikan. Apakah Anda yakin ingin
                                    melanjutkan?
                                </AlertDialogDescription>
                            </AlertDialogHeader>
                            <AlertDialogFooter>
                                <AlertDialogCancel
                                    onClick={() => {
                                        setOpen(false);
                                    }}
                                >
                                    Batalkan
                                </AlertDialogCancel>
                                <AlertDialogAction onClick={() => deleteAset()}>
                                    Lanjutkan
                                </AlertDialogAction>
                            </AlertDialogFooter>
                        </AlertDialogContent>
                    </AlertDialog>
                </DropdownMenu>
            );
        },
    },
    {
        accessorKey: "namaAset",
        header: "Nama Aset",
    },
    {
        accessorKey: "jumlah",
        header: "Jumlah",
    },
    {
        accessorKey: "tanggalDigunakan",
        header: "Tanggal Digunakan",
        cell: ({ row }) => {
            const date = new Date(row.getValue("tanggalDigunakan"));
            const day = date.getDate().toString().padStart(2, "0");
            const month = date.toLocaleString("en-US", { month: "long" });
            const year = date.getFullYear();

            return (
                <div className="text-right font-medium">{`${day} ${month} ${year}`}</div>
            );
        },
    },
    {
        accessorKey: "harga",
        header: "Harga",
        cell: ({ row }) => {
            const amount = parseFloat(row.getValue("harga"));
            const formatted = new Intl.NumberFormat("id-ID", {
                style: "currency",
                currency: "IDR",
            }).format(amount);

            return <div className="text-right font-medium">{formatted}</div>;
        },
    },
    {
        accessorKey: "penyusutanPerHari",
        header: "Penyusutan Per Hari",
        cell: ({ row }) => {
            const amount = parseFloat(row.getValue("penyusutanPerHari"));
            const formatted = new Intl.NumberFormat("id-ID", {
                style: "currency",
                currency: "IDR",
            }).format(amount);

            return <div className="text-right font-medium">{formatted}</div>;
        },
    },
];

interface AsetPageProps {
    data: AsetProps[];
}

const Aset = ({ data }: AsetPageProps) => {
    return (
        <Layout title="Aset" isReady>
            <div className="container mx-auto ">
                <Button
                    onClick={() => {}}
                    className="hover:scale-110 transition-all duration-100"
                    variant={"default"}
                >
                    Tambah
                </Button>
            </div>
            <div className="container mx-auto py-2">
                <DataTable columns={AsetColumns} data={data} />
            </div>
        </Layout>
    );
};

export default Aset;
