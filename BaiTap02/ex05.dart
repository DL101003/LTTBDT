import 'dart:io';

void main() {
  // Nhập số nguyên từ bàn phím
  print("Nhập một số nguyên (n >= 1): ");
  String? input = stdin.readLineSync();

  // Kiểm tra và chuyển đổi input thành số nguyên
  int? n = int.tryParse(input ?? '');

  // Kiểm tra tính hợp lệ của input
  if (n == null || n < 1) {
    print("Vui lòng nhập một số nguyên hợp lệ (n >= 1).");
    return;
  }

  // Tính tổng các ước số
  int sum = sumOfDivisors(n);

  // In kết quả
  print("Tổng các ước số của $n là: $sum");
}

int sumOfDivisors(int number) {
  // Khởi tạo biến tổng
  int sum = 0;

  // Duyệt từ 1 đến căn bậc hai của số
  for (int i = 1; i * i <= number; i++) {
    // Nếu i là ước của number
    if (number % i == 0) {
      // Thêm i vào tổng
      sum += i;

      // Nếu i khác với number / i, thêm number / i vào tổng
      if (i != number ~/ i) {
        sum += number ~/ i;
      }
    }
  }

  return sum;
}