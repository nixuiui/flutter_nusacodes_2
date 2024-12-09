import 'package:flutter_nusacodes_2/helpers/helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("formatRupiah()", () {
    test("return format rupiah jika nilai positif", () {
      final result = formatRupiah(500000);
      expect(result, "Rp 500.000");
    });

    test("return Rp 0 jika nilai null", () {
      final result = formatRupiah(null);
      expect(result, "Rp 0");
    });

    test("return Rp 0 jika nilai 0", () {
      final result = formatRupiah(0);
      expect(result, "Rp 0");
    });

    test("return -Rp 100.000 jika nilai -100000", () {
      final result = formatRupiah(-100000);
      expect(result, "-Rp 100.000");
    });
  });

  group("luasSegitiga(a, t)", () {
    test("mendapatkan luas 400 jika alas 40, tinggi 20", () {
      final result = luasSegitiga(40, 20);
      expect(result, 400);
    });
    test("mendapatkan luas 450 jika alas 30, tinggi 30", () {
      final result = luasSegitiga(30, 30);
      expect(result, 450);
    });
  });
}
