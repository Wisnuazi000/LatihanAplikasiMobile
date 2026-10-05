// =============================================
// HW 2 - Use Case: Laundry
// Nama : Wisnu Azi
// NIM  : 1124160235
// =============================================

// ---------- ABSTRACTION ----------
enum JenisLayanan { reguler, express }

enum LaundryStatus { success, belowMinWeight }

class Pelanggan {
  final String id;
  final String name;

  Pelanggan(this.id, this.name);
}

class TransaksiLaundry {
  final String id;
  final String pelangganId;
  final double beratReal;
  final JenisLayanan layanan;
  final double totalBayar;
  final DateTime date;

  TransaksiLaundry({
    required this.id,
    required this.pelangganId,
    required this.beratReal,
    required this.layanan,
    required this.totalBayar,
    required this.date,
  });
}

// ---------- DATA ----------
final List<Pelanggan> pelangganList = [
  Pelanggan('P01', 'Andi'),
  Pelanggan('P02', 'Budi'),
];

final List<TransaksiLaundry> riwayatTransaksi = [];

// ---------- DECOMPOSITION ----------
Pelanggan? findPelanggan(String id) {
  for (final pelanggan in pelangganList) {
    if (pelanggan.id == id) return pelanggan;
  }
  return null;
}

// Mengimplementasikan BR-02: minimal 2 kg
double hitungBeratDihitung(double beratReal) {
  if (beratReal < 2.0) {
    return 2.0;
  }
  return beratReal;
}

// Mengimplementasikan BR-01: Rp7.000 / kg
double hitungBiayaDasar(double beratDihitung) {
  return beratDihitung * 7000;
}

// Mengimplementasikan BR-03: express +50%
double hitungBiayaExpress(double biayaDasar, JenisLayanan layanan) {
  if (layanan == JenisLayanan.express) {
    return biayaDasar * 0.5;
  }
  return 0.0;
}

// ---------- ALGORITHM ----------
TransaksiLaundry? prosesTransaksi({
  required String id,
  required String pelangganId,
  required double beratReal,
  required JenisLayanan layanan,
  required DateTime time,
}) {
  final pelanggan = findPelanggan(pelangganId);
  if (pelanggan == null) {
    return null; // Pelanggan tidak ditemukan
  }

  final beratEff = hitungBeratDihitung(beratReal); // BR-02
  final biayaDasar = hitungBiayaDasar(beratEff); // BR-01
  final biayaExpress = hitungBiayaExpress(biayaDasar, layanan); // BR-03
  final total = biayaDasar + biayaExpress;

  final transaksi = TransaksiLaundry(
    id: id,
    pelangganId: pelangganId,
    beratReal: beratReal,
    layanan: layanan,
    totalBayar: total,
    date: time,
  );

  riwayatTransaksi.add(transaksi);
  return transaksi;
}

String toMessage(TransaksiLaundry? transaksi) {
  if (transaksi == null) {
    return 'Gagal: pelanggan tidak ditemukan';
  }
  return 'Transaksi berhasil (Total: Rp${transaksi.totalBayar.toInt()})';
}

// ---------- TEST SCENARIO ----------
void main() {
  final hariIni = DateTime(2026, 10, 5, 8, 15);

  // Skenario 1 - expected: Transaksi berhasil (Total: Rp21000)
  print(
    toMessage(
      prosesTransaksi(
        id: 'TRX01',
        pelangganId: 'P01',
        beratReal: 3.0,
        layanan: JenisLayanan.reguler,
        time: hariIni,
      ),
    ),
  );

  // Skenario 2 (BR-02) - expected: Transaksi berhasil (Total: Rp14000)
  print(
    toMessage(
      prosesTransaksi(
        id: 'TRX02',
        pelangganId: 'P02',
        beratReal: 1.0,
        layanan: JenisLayanan.reguler,
        time: hariIni,
      ),
    ),
  );

  // Skenario 3 (BR-03) - expected: Transaksi berhasil (Total: Rp42000)
  print(
    toMessage(
      prosesTransaksi(
        id: 'TRX03',
        pelangganId: 'P01',
        beratReal: 4.0,
        layanan: JenisLayanan.express,
        time: hariIni,
      ),
    ),
  );

  // Skenario 4 (BR-02 & BR-03) - expected: Transaksi berhasil (Total: Rp21000)
  print(
    toMessage(
      prosesTransaksi(
        id: 'TRX04',
        pelangganId: 'P02',
        beratReal: 1.5,
        layanan: JenisLayanan.express,
        time: hariIni,
      ),
    ),
  );

  // Skenario 5 (Pelanggan tidak ditemukan) - expected: Gagal: pelanggan tidak ditemukan
  print(
    toMessage(
      prosesTransaksi(
        id: 'TRX05',
        pelangganId: 'P99',
        beratReal: 2.0,
        layanan: JenisLayanan.reguler,
        time: hariIni,
      ),
    ),
  );

  // expected: Total transaksi tersimpan: 4
  print('Total transaksi tersimpan: ${riwayatTransaksi.length}');
}
