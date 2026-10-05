void main() {
  print('Hello, Dart!');

  print(tentukanPemenang(10));

  cekStatusUsia(20);
}

String tentukanPemenang(double rekor) {
  if (rekor >= 90) {
    return "Juara 1";
  } else if (rekor >= 80) {
    return "Juara 2";
  } else if (rekor >= 70) {
    return "Juara 3";
  }
  return "Tidak Juara";
}

// String cekStatusUsia(int usia) {
//   String status = "";
//   if (usia >= 18) {
//     status = "Dewasa";
//   } else {
//     status = "Anak-anak";
//   }
//   print("Status usia: $status");
//   return status;
// }

String cekStatusUsia (int usia) {
  String status = usia >= 18 ? "Dewasa" : "Anak-anak";
  print("Status usia: $status");
  return status;
}



