import 'package:intl/intl.dart';

//가격에 '원' 붙이기
class DataUtils{
  static final oCcy = NumberFormat('#,###', 'ko_KR');

  static String calcStringToWon(String priceString) {
    if (priceString == '무료나눔') return priceString;
    return "${oCcy.format(int.parse(priceString))}원";
  }
}