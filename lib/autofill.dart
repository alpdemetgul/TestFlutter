import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

class AutoFill extends StatefulWidget {
  const AutoFill({super.key});

  @override
  State<AutoFill> createState() => _AutoFillState();
}

class _AutoFillState extends State<AutoFill> {
  @override
  void initState() {
    super.initState();
    _listenSmsCode();
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  void _listenSmsCode() async {
    await SmsAutoFill().listenForCode();
  }

  void _getSmsCredential() async {
    String code = await SmsAutoFill().getAppSignature;
    print('Sms Signature: ' + code);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: PinFieldAutoFill(
          codeLength: 6,
          autoFocus: true,
          decoration: UnderlineDecoration(
            lineHeight: 2,
            lineStrokeCap: StrokeCap.square,
            bgColorBuilder: PinListenColorBuilder(
                Colors.green.shade200, Colors.grey.shade200),
            colorBuilder: const FixedColorBuilder(Colors.transparent),
          ),
        ),
      ),
    ));
  }
}
