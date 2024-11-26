import 'dienthoai.dart';
import 'hoadon.dart';

class CuaHang {
  String _tenCuaHang;
  String _diaChi;
  List<DienThoai> _danhSachDienThoai = [];
  List<HoaDon> _danhSachHoaDon = [];

  // Constructor
  CuaHang(this._tenCuaHang, this._diaChi);

  // Getter và Setter
  String get tenCuaHang => _tenCuaHang;
  set tenCuaHang(String tenCuaHang) {
    if (tenCuaHang.isNotEmpty) {
      _tenCuaHang = tenCuaHang;
    }
  }

  String get diaChi => _diaChi;
  set diaChi(String diaChi) {
    if (diaChi.isNotEmpty) {
      _diaChi = diaChi;
    }
  }

  // Phương thức quản lý điện thoại
  void themDienThoai(DienThoai dienThoai) {
    _danhSachDienThoai.add(dienThoai);
    print("Đã thêm điện thoại: ${dienThoai.tenDienThoai}");
  }

  void capNhatDienThoai(String maDienThoai, DienThoai dienThoaiMoi) {
    for (int i = 0; i < _danhSachDienThoai.length; i++) {
      if (_danhSachDienThoai[i].maDienThoai == maDienThoai) {
        _danhSachDienThoai[i] = dienThoaiMoi;
        print("Cập nhật thành công điện thoại: $maDienThoai");
        return;
      }
    }
    print("Không tìm thấy điện thoại với mã: $maDienThoai");
  }

  void ngungKinhDoanh(String maDienThoai) {
    for (var dienThoai in _danhSachDienThoai) {
      if (dienThoai.maDienThoai == maDienThoai) {
        dienThoai.trangThai = false;
        print("Điện thoại $maDienThoai đã ngừng kinh doanh.");
        return;
      }
    }
    print("Không tìm thấy điện thoại với mã: $maDienThoai");
  }

  DienThoai? timDienThoaiTheoMa(String maDienThoai) {
    try {
      return _danhSachDienThoai.firstWhere(
        (dt) => dt.maDienThoai == maDienThoai,
      );
    } catch (e) {
      return null;
    }
  }

  List<DienThoai> timDienThoaiTheoTen(String ten) {
    return _danhSachDienThoai
        .where((dt) => dt.tenDienThoai.contains(ten))
        .toList();
  }

  void hienThiDanhSachDienThoai() {
    for (var dienThoai in _danhSachDienThoai) {
      dienThoai.hienThiThongTin();
    }
  }

  // Phương thức quản lý hóa đơn
  void taoHoaDon(HoaDon hoaDon) {
    if (hoaDon.soLuongMua <= hoaDon.dienThoai.soLuongTonKho) {
      _danhSachHoaDon.add(hoaDon);
      // Cập nhật tồn kho
      hoaDon.dienThoai.soLuongTonKho -= hoaDon.soLuongMua;
      print("Hóa đơn đã được tạo thành công.");
    } else {
      print("Không thể tạo hóa đơn. Số lượng mua vượt quá tồn kho.");
    }
  }

  List<HoaDon> timHoaDonTheoMa(String maHoaDon) {
    return _danhSachHoaDon.where((hd) => hd.maHoaDon == maHoaDon).toList();
  }

  void hienThiDanhSachHoaDon() {
    for (var hoaDon in _danhSachHoaDon) {
      hoaDon.hienThiThongTinHoaDon();
    }
  }

  // Phương thức thống kê
  double tinhTongDoanhThu(DateTime tuNgay, DateTime denNgay) {
    return _danhSachHoaDon
        .where(
            (hd) => hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay))
        .map((hd) => hd.tinhTongTien())
        .fold(0.0, (sum, element) => sum + element);
  }

  double tinhTongLoiNhuan(DateTime tuNgay, DateTime denNgay) {
    return _danhSachHoaDon
        .where(
            (hd) => hd.ngayBan.isAfter(tuNgay) && hd.ngayBan.isBefore(denNgay))
        .map((hd) => hd.tinhLoiNhuanThucTe())
        .fold(0.0, (sum, element) => sum + element);
  }

  List<DienThoai> thongKeTopBanChay() {
    _danhSachDienThoai
        .sort((a, b) => b.soLuongTonKho.compareTo(a.soLuongTonKho));
    return _danhSachDienThoai.take(5).toList();
  }

  void thongKeTonKho() {
    for (var dienThoai in _danhSachDienThoai) {
      print(
          "Điện thoại: ${dienThoai.tenDienThoai}, Tồn kho: ${dienThoai.soLuongTonKho}");
    }
  }
}
