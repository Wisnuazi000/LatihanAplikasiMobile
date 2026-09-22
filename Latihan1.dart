void main() {  
  print("Hello Wisnu Azi");
  
  print("Nama Produk");
  String product = "Gula";
  print(product);
  
  print("Stok Awal");
  int jumlah = 15;
  print(jumlah);
  
  /*
  * Variabel Angka tidak bisa dirubah
  * Karena Variabel Angka Sudah di Definisakan Diatas
  */
  //angka = 10,5;
  //print(angka);
  
  print("Nama Produk");
  product = "Susu";
  print(product);

  print("Stok Awal");
  int? jumlahStok;
  jumlahStok = 20; //
  print(jumlahStok);
  
  jumlahStok = null;
  
  int jumlahStokHabis = jumlahStok ?? 0;
  print(jumlahStokHabis);
}