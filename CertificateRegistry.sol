// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/**
 * @title CertificateRegistry
 * @dev Smart Contract untuk Manajemen Sertifikat Digital / Ijazah Akademik
 * Kelompok: Ramadhanni Zidan, N Tahta, Kuncoro Singgih
 */
contract CertificateRegistry {
    
    // Alamat pemilik (admin/kampus) yang berhak menerbitkan sertifikat
    address public owner;

    // Struktur data untuk menyimpan informasi sertifikat
    struct Certificate {
        string studentName;
        string major;
        string graduationDate;
        string ipkOrScore;
        bool isValid;
        bool exists;
    }

    // Mapping dari Nomor Sertifikat (ID unik) ke data Certificate
    mapping(string => Certificate) private certificates;

    // Event yang dipicu saat ada sertifikat diterbitkan atau dicabut
    event CertificateIssued(string indexed certId, string studentName);
    event CertificateRevoked(string indexed certId);

    // Modifier untuk membatasi fungsi hanya bisa dipanggil oleh owner/admin
    modifier onlyOwner() {
        require(msg.sender == owner, "Akses ditolak: Hanya admin/kampus yang dapat mengakses.");
        _;
    }

    // Constructor untuk menetapkan pembuat kontrak sebagai owner
    constructor() {
        owner = msg.sender;
    }

    // ==========================================
    // FUNGSI UTAMA 1: Menerbitkan Sertifikat
    // ==========================================
    function issueCertificate(
        string memory _certId,
        string memory _studentName,
        string memory _major,
        string memory _graduationDate,
        string memory _ipkOrScore
    ) public onlyOwner {
        require(!certificates[_certId].exists, "Error: Nomor sertifikat sudah terdaftar.");

        certificates[_certId] = Certificate({
            studentName: _studentName,
            major: _major,
            graduationDate: _graduationDate,
            ipkOrScore: _ipkOrScore,
            isValid: true,
            exists: true
        });

        emit CertificateIssued(_certId, _studentName);
    }

    // ==========================================
    // FUNGSI UTAMA 2: Memverifikasi Sertifikat
    // ==========================================
    function verifyCertificate(string memory _certId) public view returns (
        string memory studentName,
        string memory major,
        string memory graduationDate,
        string memory ipkOrScore,
        string memory status
    ) {
        require(certificates[_certId].exists, "Sertifikat tidak ditemukan / Palsu.");
        
        Certificate memory cert = certificates[_certId];
        
        string memory currentStatus = cert.isValid ? "VALID & Aktif" : "TIDAK VALID (Telah Dicabut)";

        return (
            cert.studentName,
            cert.major,
            cert.graduationDate,
            cert.ipkOrScore,
            currentStatus
        );
    }

    // ==========================================
    // FUNGSI UTAMA 3: Mencabut/Membatalkan Sertifikat
    // ==========================================
    function revokeCertificate(string memory _certId) public onlyOwner {
        require(certificates[_certId].exists, "Sertifikat tidak ditemukan.");
        require(certificates[_certId].isValid, "Sertifikat sudah dalam status tidak aktif.");

        certificates[_certId].isValid = false;

        emit CertificateRevoked(_certId);
    }
}