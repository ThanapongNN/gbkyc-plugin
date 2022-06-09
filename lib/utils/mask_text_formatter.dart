//  mask_text_input_formatter: ^2.0.0
//String text = _amountscontroller.text.replaceAll('-', '');  => Use Remove '-'

import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

//จัดฟอแมตของข้อความให้ตรงตามรูปแบบที่กำหนด
class MaskTextFormatter {
  static MaskTextInputFormatter numberIDCardTH = MaskTextInputFormatter(
    mask: '#-####-#####-##-#',
    filter: {"#": RegExp(r'[0-9]')},
  );

  static MaskTextInputFormatter phoneNumber = MaskTextInputFormatter(
    mask: '###-###-####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  static MaskTextInputFormatter bankAccount = MaskTextInputFormatter(
    mask: '###-#-#####-#-##',
    filter: {"#": RegExp(r'[0-9]')},
  );

  static MaskTextInputFormatter virtualNumber = MaskTextInputFormatter(
    mask: '#### #### #### ####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  static amount(String number) {
    return NumberFormat.simpleCurrency(name: '').format(double.parse(number.replaceAll(',', '')));
  }
}
