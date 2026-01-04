import 'package:intl/intl.dart';

class Formater {
  List<String> namaBulan = [
    "Januari",
    "Februari",
    "Maret",
    "April",
    "Mei",
    "Juni",
    "Juli",
    "Agustus",
    "September",
    "Oktober",
    "November",
    "Desember",
  ];

  List<String> namaHari = ["Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu", "Minggu"];

  String formatTanggal(String? date) {
    if (date == null) {
      return "-";
    } else {
      final value = DateTime.parse(date);
      return DateFormat('d MMM y').format(value);
    }
  }

  String formatDate(DateTime date) {
    return "${namaHari[date.weekday - 1]} ${namaBulan[date.month - 1]} ${date.year}";
  }

  String formatJam(String? time) {
    if (time == null || time.isEmpty) return "-";

    final value = DateTime.parse(time);
    return DateFormat('HH:mm').format(value);
  }

  String formatRupiah(num number) {
    final format = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return format.format(number);
  }
}
