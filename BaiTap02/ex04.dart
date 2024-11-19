import 'dart:io';

void main() {
  // Nhập số nguyên từ bàn phím
  print("Nhập một số nguyên (b >= 1): ");
  String? input = stdin.readLineSync();

  // Kiểm tra và chuyển đổi input thành số nguyên
  int? b = int.tryParse(input ?? '');

  // Kiểm tra tính hợp lệ của input
  if (b == null || b < 1) {
    print("Vui lòng nhập một số nguyên hợp lệ (b >= 1).");
    return;
  }

  // Chuyển đổi số nguyên thành nhị phân
  String binary = convertToBinary(b);

  // In kết quả
  print("Số nhị phân tương ứng là: $binary");
}

String convertToBinary(int number) {
  // Khởi tạo chuỗi kết quả
  String result = '';

  // Nếu số là 0, trả về '0'
  if (number == 0) {
    return '0';
  }

  // Chuyển đổi số thành nhị phân
  while (number > 0) {
    // Thêm phần dư vào đầu chuỗi kết quả
    result = '${number % 2}$result';
    // Chia số cho 2
    number ~/= 2;
  }

  return result;
}