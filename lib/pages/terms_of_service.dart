import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:gbkyc/pages/register.dart';
import 'package:gbkyc/state_store.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/route_manager.dart';
import 'package:permission_handler/permission_handler.dart';

class TermOfService extends StatefulWidget {
  const TermOfService({Key? key}) : super(key: key);

  @override
  State<TermOfService> createState() => _TermOfServiceState();
}

class _TermOfServiceState extends State<TermOfService> {
  bool? checkbox = false;
  bool readCondition = false;
  final ScrollController _scrollController = ScrollController();

  Future loadTermsOfService() async {
    await EasyLoading.show();
    StateStore.fileText.value = await rootBundle.loadString('packages/gbkyc/assets/terms_of_service_${'language'.tr}.txt');
    await EasyLoading.dismiss();
    return true;
  }

  @override
  void initState() {
    super.initState();
    loadTermsOfService().then((v) {
      if (v) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (_scrollController.position.maxScrollExtent == 0) {
            setState(() => readCondition = true);
          }
        });
        _scrollController.addListener(() {
          if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
            setState(() => readCondition = true);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Stack
          AppBar(systemOverlayStyle: SystemUiOverlayStyle.light),
          //Stack
          Container(
            padding: const EdgeInsets.only(top: 170),
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              'assets/images/amount_logo.png',
              package: 'gbkyc',
              scale: 1.7,
            ),
          ),
          //Stack
          ListView(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            children: [
              const SizedBox(height: 170),
              FittedBox(
                child: RichText(
                  text: TextSpan(
                    text: 'Terms_and_Conditions_of_Application_Service'.tr,
                    style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20, fontFamily: 'kanit', package: 'gbkyc', color: Colors.black),
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'GB Wallet\n',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromRGBO(255, 159, 2, 1),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Obx(() => Text(StateStore.fileText.value)),
            ],
          ),
          //Stack
          Container(
            height: 150,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
              image: DecorationImage(
                alignment: Alignment.topRight,
                scale: 2,
                image: AssetImage('assets/images/GB_Banner.png', package: 'gbkyc'),
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF003B54),
                  Color(0xFF115899),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Get_started'.tr,
                  style: TextStyle(fontSize: 17, color: Colors.white.withOpacity(0.7)),
                ),
                Text(
                  'Terms_conditions'.tr,
                  style: const TextStyle(fontSize: 22, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.bottomCenter,
        height: 140,
        padding: const EdgeInsets.only(bottom: 25),
        decoration: const BoxDecoration(color: Colors.white, border: Border(top: BorderSide(color: Colors.grey))),
        child: Column(children: [
          if (!readCondition) const SizedBox(height: 16),
          GestureDetector(
            onTap: readCondition ? () => setState(() => checkbox = !checkbox!) : null,
            child: Row(children: [
              const SizedBox(width: 20),
              readCondition
                  ? Checkbox(
                      checkColor: Colors.white,
                      activeColor: const Color(0xFF02416D),
                      side: const BorderSide(width: 2, color: Color(0xFF02416D)),
                      value: checkbox,
                      onChanged: (bool? v) {
                        if (readCondition) setState(() => checkbox = v);
                      },
                      tristate: false,
                    )
                  : const Text(
                      "   *** ",
                      style: TextStyle(color: Colors.red),
                    ),
              Expanded(
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  fit: BoxFit.scaleDown,
                  child: Text(readCondition ? 'I_agree_terms_and_conditions'.tr : 'Please_check_the_terms_and_conditions_of_service'.tr),
                ),
              ),
              const SizedBox(width: 20),
            ]),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(children: [
              Expanded(
                child: MaterialButton(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: const BorderSide(color: Color(0xFFEB5757)),
                  ),
                  child: Text(
                    'not_accept'.tr,
                    style: const TextStyle(color: Color(0xFFEB5757)),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        checkbox! ? const Color(0xFF115899) : Colors.grey,
                        checkbox! ? const Color(0xFF02416D) : Colors.grey,
                      ],
                    ),
                  ),
                  child: MaterialButton(
                    child: Text('continue'.tr),
                    onPressed: () async {
                      await Permission.camera.request();
                      if (checkbox!) {
                        Get.off(const Register());
                      }
                    },
                  ),
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
