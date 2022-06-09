import 'package:gbkyc/pages/terms_of_service.dart';
import 'package:gbkyc/widgets/button_confirm.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  String local = 'EN';
  bool switchTH = true;

  checkLocal(BuildContext context) {
    if (Get.locale.toString() == 'th_TH') {
      setState(() {
        local = 'TH';
        switchTH = true;
      });
    } else {
      setState(() {
        local = 'EN';
        switchTH = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    checkLocal(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          Container(
            width: 80,
            padding: const EdgeInsets.only(right: 10),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Stack(alignment: Alignment.center, children: [
                Container(width: 60, height: 30, color: Colors.grey[200]),
                Row(children: [
                  GestureDetector(
                    onTap: () => setState(() {
                      local = 'TH';
                      switchTH = true;
                      Get.updateLocale(const Locale('th', 'TH'));
                    }),
                    child: CircleAvatar(
                      radius: switchTH ? 20 : 15,
                      backgroundColor: Colors.grey[200],
                      backgroundImage: AssetImage('assets/images/Thailand-flag${switchTH ? '' : '-bw'}.png', package: 'gbkyc'),
                    ),
                  ),
                  const SizedBox(width: 20),
                  GestureDetector(
                    onTap: () => setState(() {
                      local = 'EN';
                      switchTH = false;
                      Get.updateLocale(const Locale('en', 'EN'));
                    }),
                    child: CircleAvatar(
                      radius: switchTH ? 15 : 20,
                      backgroundColor: Colors.grey[200],
                      backgroundImage: AssetImage('assets/images/United_Kingdom${switchTH ? '_bw' : ''}.png', package: 'gbkyc'),
                    ),
                  ),
                ]),
              ]),
            ),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Column(children: [
            Column(children: [
              Image.asset('assets/images/logo_home.jpg', package: 'gbkyc', scale: 2.5),
              const Text(
                'GB Wallet',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              const Text(
                'CUSTOMIZE YOUR PAYMENT',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ]),
            const Divider(height: 20, indent: 60, endIndent: 60),
            Text('slogan'.tr, textAlign: TextAlign.center, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 40),
            ButtonConfirm(
              width: 300,
              text: '${'register'.tr} GB Wallet',
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const TermOfService())),
            ),
            // const SizedBox(height: 20),
            // Row(children: [
            //   Text('no_member'.tr, style: const TextStyle(color: Colors.grey)),
            //   GestureDetector(
            //     onTap: () async {
            //       // (await LocalStorage.getUserLoginID()).isEmpty
            //       //     ? Navigator.push(context, MaterialPageRoute(builder: (context) => const SelectorLogin()))
            //       //     : Navigator.push(context, MaterialPageRoute(builder: (context) => const Signin()));
            //     },
            //     child: Text('login'.tr, style: const TextStyle(color: Color(0xFFFF9F02))),
            //   )
            // ]),
            const SizedBox(height: kToolbarHeight + kBottomNavigationBarHeight),
          ]),
        ),
      ),
    );
  }
}
