# Manajemen Sertifikat Digital / Ijazah Akademik Berbasis Blockchain

Repositori ini dikembangkan untuk memenuhi tugas Final Project (UAS) mata kuliah **Teknologi Blockchain**.

## Anggota Kelompok
* **Ramadhanni Zidan Arifin** (6623600076)
* **N Tahta PhudjaShakty** (6623600093)
* **Kuncoro Singgih Prasojo** (6623600094)

## Deskripsi Proyek
Smart contract ini dirancang untuk mencatat, memverifikasi, dan mengelola status keaslian ijazah atau sertifikat akademik secara transparan dan *immutable* di jaringan blockchain, guna mencegah pemalsuan dokumen.

## 3 Fungsi Utama Smart Contract
1. **`issueCertificate`**: Digunakan oleh admin/kampus untuk menerbitkan dan mencatat data sertifikat baru ke blockchain.
2. **`verifyCertificate`**: Digunakan oleh publik/perusahaan untuk memverifikasi keabsahan nomor sertifikat dan melihat detail data mahasiswa.
3. **`revokeCertificate`**: Digunakan oleh admin untuk mencabut atau menonaktifkan status sertifikat jika terjadi pembatalan/kesalahan.