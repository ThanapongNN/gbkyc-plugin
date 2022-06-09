import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../address_bloc.dart';

//แสดงที่อยู่แบบเลือกเป็นขั้นตอนเริ่มจาก จังหวัด
class SelectAddress extends StatefulWidget {
  final dynamic address;

  const SelectAddress(this.address, {Key? key}) : super(key: key);
  @override
  State<SelectAddress> createState() => _SelectAddressState();
}

class _SelectAddressState extends State<SelectAddress> with TickerProviderStateMixin {
  String province = "province".tr;
  String? district = "district".tr;
  String subDistrict = "subdistrict".tr;
  String addressCurrent = "";

  int? _selectedProvince, _selectedDistrict;
  int? indexProvince;
  int? indexDistrict;
  int? indexSubDistrict;
  TabController? _tabBar;

  dynamic address;

  @override
  void initState() {
    super.initState();
    address = widget.address;
    _tabBar = TabController(length: 3, vsync: this);
    _tabBar!.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      width: double.infinity,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Text("district_address".tr),
              GestureDetector(
                child: const Icon(Icons.close),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
        Container(
          height: 50,
          width: double.infinity,
          color: Colors.grey[300],
          child: TabBar(
            controller: _tabBar,
            indicatorColor: const Color(0xFF02416D),
            labelColor: Colors.black,
            onTap: (v) {
              if (v == 1 && province == "province".tr) {
                _tabBar!.index = 0;
              } else if (v == 2 && province == "province".tr) {
                _tabBar!.index = 0;
              } else if (v == 2 && district == "district".tr) {
                _tabBar!.index = 1;
              }
            },
            tabs: [
              Tab(child: Text(province, softWrap: false)),
              Tab(child: Text(district!, softWrap: false)),
              Tab(child: Text(subDistrict, softWrap: false)),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabBar,
            children: [
              BlocBuilder<AddressBloc, Map>(builder: (_, data) {
                return ListView.builder(
                  itemCount: data['province'].length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(data['province'][index]['name${'lang'.tr}']),
                      selected: index == _selectedProvince,
                      trailing: index == _selectedProvince
                          ? const Image(image: AssetImage('assets/images/Check.png', package: 'gbkyc'), width: 25, height: 25)
                          : const SizedBox(),
                      onTap: () {
                        setState(() {
                          _selectedProvince = index;
                          _selectedDistrict = null;

                          province = '${data['province'][index]['name${'lang'.tr}']}';
                          district = "district".tr;
                          subDistrict = "subdistrict".tr;
                          context.read<AddressBloc>().add(const ClearDistrict());
                          context.read<AddressBloc>().add(const ClearSubDistrict());

                          List listDistrict = address['district'];
                          listDistrict.sort((a, b) => a['name${'lang'.tr}'].compareTo(b['name${'lang'.tr}']));

                          for (var item in listDistrict) {
                            if (item['province_id'] == data['province'][index]['id']) {
                              context.read<AddressBloc>().add(SetDistrict(item));
                            }
                          }
                          _tabBar!.index = 1;
                        });
                      },
                    );
                  },
                );
              }),
              BlocBuilder<AddressBloc, Map>(builder: (_, data) {
                return ListView.builder(
                  itemCount: data['district'].length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(data['district'][index]['name${'lang'.tr}']),
                      selected: index == _selectedDistrict,
                      trailing: index == _selectedDistrict
                          ? const Image(image: AssetImage('assets/images/Check.png', package: 'gbkyc'), width: 25, height: 25)
                          : const SizedBox(),
                      onTap: () async {
                        setState(() {
                          _selectedDistrict = index;

                          district = data['district'][index]['name${'lang'.tr}'];
                          context.read<AddressBloc>().add(const ClearSubDistrict());

                          List listSubDistrict = address['sub_district'];
                          listSubDistrict.sort((a, b) => a['name${'lang'.tr}'].compareTo(b['name${'lang'.tr}']));

                          for (var item in listSubDistrict) {
                            if (item['code'].toString().substring(0, 4) == data['district'][index]['code'].toString()) {
                              context.read<AddressBloc>().add(SetSubDistrict(item));
                            }
                          }
                          _tabBar!.index = 2;
                        });
                      },
                    );
                  },
                );
              }),
              BlocBuilder<AddressBloc, Map>(builder: (_, data) {
                return ListView.builder(
                  itemCount: data['sub_district'].length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(children: [
                      ListTile(
                        title: Text(
                          '${data["sub_district"][index]['name${'lang'.tr}']}',
                        ),
                        onTap: () {
                          indexProvince = data["sub_district"][index]['province_id'];
                          indexDistrict = data["sub_district"][index]['district_id'];
                          indexSubDistrict = data["sub_district"][index]['id'];

                          Navigator.pop(context, {
                            "indexProvince": indexProvince,
                            "indexDistrict": indexDistrict,
                            "indexSubDistrict": indexSubDistrict,
                            "showAddress":
                                "$province/$district/${data["sub_district"][index]['name${'lang'.tr}']}/${data["sub_district"][index]['post_code']}"
                          });
                        },
                      )
                    ]);
                  },
                );
              }),
            ],
          ),
        )
      ]),
    );
  }
}
