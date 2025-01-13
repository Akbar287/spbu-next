export interface AsetProps {
    asetId: string;
    spbuId: string;
    namaAset: string;
    jumlah: number;
    tanggalDigunakan: string;
    harga: number;
    penyusutanPerHari: number;
    isDigunakan: boolean;
    keterangan: string;
    createdAt: string;
    updatedAt: string;
    spbu: {};
    fileAset: [];
}

export const Aset: AsetProps = {
    asetId: "",
    spbuId: "",
    namaAset: "",
    jumlah: 0,
    tanggalDigunakan: "",
    harga: 0,
    penyusutanPerHari: 0,
    isDigunakan: false,
    keterangan: "",
    createdAt: "",
    updatedAt: "",
    spbu: {},
    fileAset: [],
};
