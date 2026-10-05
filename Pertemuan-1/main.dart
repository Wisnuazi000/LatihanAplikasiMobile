void main() {
  print("=== SISTEM WARUNG SEMBAKO ===");
  print("Selamat datang di Warung Sembako Makmur!");

  // Nullable String
  String? namaPembeli = "Dewi";
  print("Nama pembeli: $namaPembeli");

  int jumlahBelanja = 4;
  print("Jumlah barang: $jumlahBelanja");

  // String dapat diubah menjadi null
  namaPembeli = null;
  print("Nama pembeli setelah diubah: $namaPembeli");

  // Null Safety
  String? alamatPembeli;
  alamatPembeli = null;

  String alamat = alamatPembeli ?? "Alamat belum tersedia";
  print("Alamat pembeli: $alamat");

  // Final
  final String nomorTransaksi = "TRX-2026-0157";
  print("Nomor transaksi: $nomorTransaksi");

  // Const
  const String namaWarung = "Warung Sembako Makmur";
  print("Nama warung: $namaWarung");

  // Late Modifier
  late String namaKasir;

  void isiNamaKasir() {
    namaKasir = "Andi";
    print("Nama kasir: $namaKasir");
  }

  isiNamaKasir();

  // String
  String namaBarang = "Minyak Goreng";
  String kategoriBarang = "Kebutuhan Dapur";

  print("Nama barang: $namaBarang");
  print("Kategori barang: $kategoriBarang");

  // Integer
  int hargaBarang = 18000;
  int jumlahBarang = 3;

  int totalBelanja = hargaBarang * jumlahBarang;

  print("Harga barang: Rp$hargaBarang");
  print("Jumlah barang: $jumlahBarang");
  print("Total belanja: Rp$totalBelanja");

  // Double
  double hargaBeras = 68500.5;
  double hargaGula = 17500.5;
  double hargaTepung = 13500.5;

  double totalSembako =
      hargaBeras + hargaGula + hargaTepung;

  print("Total harga sembako: Rp$totalSembako");

  // Num
  num diskonBelanja = 5;
  print("Diskon awal: $diskonBelanja%");

  diskonBelanja = 7.5;
  print("Diskon setelah berubah: $diskonBelanja%");

  // Bool
  bool barangTersedia = true;
  bool pembayaranLunas = false;

  bool transaksiSelesai =
      barangTersedia && pembayaranLunas;

  print("Transaksi sudah selesai: $transaksiSelesai");

  // List
  List<String> daftarBarang = [
    "Beras",
    "Gula",
    "Minyak Goreng",
    "Telur"
  ];

  print("Barang kedua: ${daftarBarang[1]}");

  daftarBarang.add("Tepung");

  print("Barang tambahan: ${daftarBarang[4]}");
  print("Daftar barang warung: $daftarBarang");

  // Set
  Set<String> kodeBarang = {
    "BRG001",
    "BRG002",
    "BRG003",
    "BRG001"
  };

  print("Kode barang: $kodeBarang");

  // Set tidak menyimpan data yang sama lebih dari satu kali

  // Map
  Map<String, dynamic> dataBelanja = {
    "kodeTransaksi": "TRX008",
    "namaPembeli": "Rizky",
    "namaBarang": "Beras",
    "jumlah": 2,
    "harga": 137000,
    "sudahBayar": true,
  };

  print("Kode transaksi: ${dataBelanja['kodeTransaksi']}");
  print("Nama pembeli: ${dataBelanja['namaPembeli']}");
  print("Nama barang: ${dataBelanja['namaBarang']}");
  print("Jumlah barang: ${dataBelanja['jumlah']}");
  print("Harga: Rp${dataBelanja['harga']}");
  print("Status pembayaran: ${dataBelanja['sudahBayar']}");

  // Object
  Object dataBarang = "Produk Sembako";

  dataBarang = 12;
  dataBarang = true;

  print("Nilai Object terakhir: $dataBarang");

  // List Object
  List<Object> dataTransaksi = [
    "TRX009",
    5,
    true
  ];

  print("Data transaksi: $dataTransaksi");

  // Dynamic
  dynamic statusToko = "Sedang Buka";

  statusToko = 10;
  statusToko = "Toko Siap Melayani";

  print("Status toko terakhir: $statusToko");
}