import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressBloc extends Bloc<AddressEvent, Map> {
  AddressBloc() : super({"province": [], "district": [], "sub_district": [], "search_district": ""});

  @override
  Stream<Map> mapEventToState(AddressEvent event) async* {
    if (event is SetProvince) {
      Map data = state;
      data['province'].add(event.province);
      yield data;
    } else if (event is SetDistrict) {
      Map data = state;
      data['district'].add(event.district);
      yield data;
    } else if (event is SetSubDistrict) {
      Map data = state;
      data['sub_district'].add(event.subDistrict);
      yield data;
    } else if (event is ClearProvince) {
      Map data = state;
      data['province'] = [];
      yield data;
    } else if (event is ClearDistrict) {
      Map data = state;
      data['district'] = [];
      yield data;
    } else if (event is ClearSubDistrict) {
      Map data = state;
      data['sub_district'] = [];
      yield data;
    } else if (event is SearchDistrict) {
      Map data = state;
      data['search_district'] = event.district;
      yield data;
    }
  }
}

abstract class AddressEvent extends Equatable {
  const AddressEvent();

  @override
  List<Object> get props => [];
}

class SetProvince extends AddressEvent {
  const SetProvince(this.province);

  final Map province;

  @override
  List<Object> get props => [province];
}

class SetDistrict extends AddressEvent {
  const SetDistrict(this.district);

  final Map district;

  @override
  List<Object> get props => [district];
}

class SetSubDistrict extends AddressEvent {
  const SetSubDistrict(this.subDistrict);

  final Map subDistrict;

  @override
  List<Object> get props => [subDistrict];
}

class ClearProvince extends AddressEvent {
  const ClearProvince();

  @override
  List<Object> get props => [];
}

class ClearDistrict extends AddressEvent {
  const ClearDistrict();

  @override
  List<Object> get props => [];
}

class ClearSubDistrict extends AddressEvent {
  const ClearSubDistrict();

  @override
  List<Object> get props => [];
}

class SearchDistrict extends AddressEvent {
  const SearchDistrict(this.district);

  final String district;

  @override
  List<Object> get props => [district];
}
