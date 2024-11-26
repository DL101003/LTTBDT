import '../models/dienthoai.dart';

class HoaDon {
  String _maHoaDon;
  DateTime _ngayBan;
  DienThoai _dienThoai;
  int _soLuongMua;
  double _giaBanThucTe;
  String _tenKhachHang;
  String _soDienThoaiKhach;

  HoaDon(this._maHoaDon, this._ngayBan, this._dienThoai, this._soLuongMua,
      this._giaBanThucTe, this._tenKhachHang, this._soDienThoaiKhach);

  String get maHoaDon => _maHoaDon;
  set maHoaDon(String maHoaDon) {
    if (maHoaDon.isEmpty && maHoaDon.startsWith("HD-")) {
      _maHoaDon = maHoaDon;
    }
  }

  DateTime get ngayBan => _ngayBan;
  set ngayBan(DateTime ngayBan) {
    if (ngayBan.isAtSameMomentAs(DateTime.now())) {
      _ngayBan = ngayBan;
    }
  }

  DienThoai get dienThoai => _dienThoai;
  set dienThoai(DienThoai dienThoai) {
    _dienThoai = dienThoai;
  }

  int get soLuongMua => _soLuongMua;
  set soLuongMua(int soLuongMua) {
    if (soLuongMua > 0 && soLuongMua <= _dienThoai.soLuongTonKho) {
      _soLuongMua = soLuongMua;
    }
  }

  double get giaBanThucTe => _giaBanThucTe;
  set giaBanThucTe(double giaBanThucTe) {
    if (giaBanThucTe > 0) {
      _giaBanThucTe = giaBanThucTe;
    }
  }

  String get tenKhachHang => _tenKhachHang;
  set tenKhachHang(String tenKhachHang) {
    if (tenKhachHang.isNotEmpty) {
      _tenKhachHang = tenKhachHang;
    }
  }

  String get soDienThoaiKhach => _soDienThoaiKhach;
  set soDienThoaiKhach(String soDienThoaiKhach) {
    if (soDienThoaiKhach.isNotEmpty && RegExp(r'^0\d{9,10}$').hasMatch(soDienThoaiKhach)) {
      _soDienThoaiKhach = soDienThoaiKhach;
    }
  }

  // Tính tổng tiền
  double tinhTongTien() => _soLuongMua * _giaBanThucTe;

  // Tính lợi nhuận thực tế
  double tinhLoiNhuanThucTe() =>
      _soLuongMua * (_giaBanThucTe - _dienThoai.tinhLoiNhuan());

  // Hiển thị thông tin hóa đơn
  void hienThiThongTinHoaDon() {
    print(
        'Hóa đơn: $_maHoaDon, Ngày: $_ngayBan, Khách hàng: $_tenKhachHang, Số điện thoại: $_soDienThoaiKhach, Số lượng mua: $_soLuongMua, Tổng tiền: ${tinhTongTien()}');
  }
}
