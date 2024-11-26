import '../models/cuahang.dart';
import '../models/dienthoai.dart';
import '../models/hoadon.dart';
void main() {
  // Tạo cửa hàng
  CuaHang cuaHang = CuaHang("Cửa hàng ABC", "123 Đường XYZ");

  // Thêm các điện thoại vào danh sách
  cuaHang.themDienThoai(DienThoai(
      "DT-001", "iPhone 14", "Apple", 15000000, 20000000, 10, true));
  cuaHang.themDienThoai(DienThoai(
      "DT-002", "Samsung Galaxy S23", "Samsung", 12000000, 18000000, 15, true));
  cuaHang.themDienThoai(DienThoai(
      "DT-003", "Xiaomi Mi 13", "Xiaomi", 10000000, 14000000, 20, true));

  // Hiển thị danh sách điện thoại
  print("\n=== Danh sách điện thoại ===");
  cuaHang.hienThiDanhSachDienThoai();

  // Kiểm tra tìm điện thoại theo mã
  print("\n=== Tìm điện thoại theo mã ===");
  try {
    var dienThoai = cuaHang.timDienThoaiTheoMa("DT-001");
    if (dienThoai != null) {
      print("Tìm thấy điện thoại: ${dienThoai.tenDienThoai}");
      dienThoai.hienThiThongTin();
    } else {
      print("Không tìm thấy điện thoại.");
    }
  } catch (e) {
    print("Lỗi: $e");
  }

  // Kiểm tra tìm kiếm mã không tồn tại
  print("\n=== Tìm điện thoại theo mã không tồn tại ===");
  try {
    var dienThoai = cuaHang.timDienThoaiTheoMa("DT-999");
    if (dienThoai != null) {
      print("Tìm thấy điện thoại: ${dienThoai.tenDienThoai}");
    } else {
      print("Không tìm thấy điện thoại.");
    }
  } catch (e) {
    print("Lỗi: $e");
  }

  // Cập nhật thông tin điện thoại
  print("\n=== Cập nhật thông tin điện thoại ===");
  cuaHang.capNhatDienThoai("DT-002", DienThoai(
        "DT-002", "Samsung Galaxy S23 Ultra", "Samsung", 20000000, 24000000, 15, true));
  cuaHang.hienThiDanhSachDienThoai();

  // Ngừng kinh doanh điện thoại
  print("\n=== Ngừng kinh doanh điện thoại ===");
  cuaHang.ngungKinhDoanh("DT-003");
  cuaHang.hienThiDanhSachDienThoai();
  

  // Tạo hóa đơn và cập nhật tồn kho
  print("\n=== Tạo hóa đơn ===");
  try {
    var hoaDon = HoaDon(
        "HD-001", DateTime.now(), cuaHang.timDienThoaiTheoMa("DT-001")!, 5, 20000000, "Nguyễn Văn A", "0123456789");
    cuaHang.taoHoaDon(hoaDon);
    cuaHang.hienThiDanhSachHoaDon();
  } catch (e) {
    print("Lỗi khi tạo hóa đơn: $e");
  }

  // Tính toán doanh thu
  print("\n=== Tính tổng doanh thu ===");
  double doanhThu = cuaHang.tinhTongDoanhThu(DateTime(2024, 1, 1), DateTime.now());
  print("Tổng doanh thu: $doanhThu");

  // Thống kê tồn kho
  print("\n=== Thống kê tồn kho ===");
  cuaHang.thongKeTonKho();
}
