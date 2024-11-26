class DienThoai {
  String _maDienThoai;
  String _tenDienThoai;
  String _hangSanXuat;
  double _giaNhap;
  double _giaBan;
  int _soLuongTonKho;
  bool _trangThai;

  // Constructor
  DienThoai(this._maDienThoai, this._tenDienThoai, this._hangSanXuat,
      this._giaNhap, this._giaBan, this._soLuongTonKho, this._trangThai);

  // Getter và setter

  String get maDienThoai => _maDienThoai;
  set maDienThoai(String maDienThoai) {
    if (maDienThoai.isEmpty && maDienThoai.startsWith("DT-")) {
      _maDienThoai = maDienThoai;
    }
  }

  String get tenDienThoai => _tenDienThoai;
  set tenDienThoai(String tenDienThoai) {
    if (tenDienThoai.isEmpty) {
      _tenDienThoai = tenDienThoai;
    }
  }

  String get hangSanXuat => _hangSanXuat;
  set hangSanXuat(String hangSanXuat) {
    if (hangSanXuat.isEmpty) {
      _hangSanXuat = hangSanXuat;
    }
  }

  double get giaNhap => _giaNhap;
  set giaNhap(double giaNhap) {
    if (giaNhap > 0) {
       _giaNhap = giaNhap;
    }
  }

  double get giaBan => _giaBan;
  set giaBan(double giaBan) {
    if (giaBan > 0 && giaBan > _giaNhap) {
      _giaBan = giaBan;
    }
  }

  int get soLuongTonKho => _soLuongTonKho;
  set soLuongTonKho(int soLuongTonKho) {
    if (soLuongTonKho > 0) {
      _soLuongTonKho = soLuongTonKho;
    }
  }

  bool get trangThai => _trangThai;
  set trangThai(bool trangThai) => _trangThai = trangThai;

  // Phương thức tính lợi nhuận dự kiến
  double tinhLoiNhuan() => _giaBan - _giaNhap;

  // Phương thức hiển thị thông tin
  void hienThiThongTin() {
    print("Mã: $_maDienThoai, Tên: $_tenDienThoai, Hãng: $_hangSanXuat, Giá nhập: $_giaNhap, Giá bán: $_giaBan, Tồn kho: $_soLuongTonKho, Trạng thái: ${_trangThai ? "Còn kinh doanh" : "Ngừng kinh doanh"}");
  }

  // Phương thức kiểm tra có thể bán không
  bool coTheBan() => _soLuongTonKho > 0 && _trangThai;
}
