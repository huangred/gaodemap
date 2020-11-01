// ignore_for_file: non_constant_identifier_names, camel_case_types, missing_return, unused_import, unused_local_variable, dead_code, unnecessary_cast
//////////////////////////////////////////////////////////
// GENERATED BY FLUTTIFY. DO NOT EDIT IT.
//////////////////////////////////////////////////////////

import 'dart:typed_data';

import 'package:amap_map_fluttify/src/ios/ios.export.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:foundation_fluttify/foundation_fluttify.dart';
import 'package:core_location_fluttify/core_location_fluttify.dart';

class MAUserLocation extends MAAnimatedAnnotation with MAAnimatableAnnotation, MAAnnotation {
  //region constants
  static const String name__ = 'MAUserLocation';

  @override
  final String tag__ = 'amap_map_fluttify';

  
  //endregion

  //region creators
  static Future<MAUserLocation> create__({ bool init = true /* ios only */ }) async {
    final refId = await MethodChannel('me.yohom/amap_map_fluttify', StandardMethodCodec(FluttifyMessageCodec('amap_map_fluttify'))).invokeMethod('ObjectFactory::createMAUserLocation', {'init': init});
    final object = MAUserLocation()..refId = refId;
    return object;
  }
  
  static Future<List<MAUserLocation>> create_batch__(int length, { bool init = true /* ios only */ }) async {
    if (false) {
      return Future.error('all args must have same length!');
    }
    final List resultBatch = await MethodChannel('me.yohom/amap_map_fluttify', StandardMethodCodec(FluttifyMessageCodec('amap_map_fluttify'))).invokeMethod('ObjectFactory::create_batchMAUserLocation', {'length': length, 'init': init});
  
    final List<MAUserLocation> typedResult = resultBatch.map((result) => MAUserLocation()..refId = result).toList();
    return typedResult;
  }
  
  //endregion

  //region getters
  Future<bool> get_updating() async {
    final __result__ = await MethodChannel('me.yohom/amap_map_fluttify', StandardMethodCodec(FluttifyMessageCodec('amap_map_fluttify'))).invokeMethod("MAUserLocation::get_isUpdating", {'__this__': this});
    return __result__ == null ? null : (__result__);
  }
  
  Future<CLLocation> get_location() async {
    final __result__ = await MethodChannel('me.yohom/amap_map_fluttify', StandardMethodCodec(FluttifyMessageCodec('amap_map_fluttify'))).invokeMethod("MAUserLocation::get_location", {'__this__': this});
    return __result__ == null ? null : (CLLocation()..refId = __result__);
  }
  
  Future<CLHeading> get_heading() async {
    final __result__ = await MethodChannel('me.yohom/amap_map_fluttify', StandardMethodCodec(FluttifyMessageCodec('amap_map_fluttify'))).invokeMethod("MAUserLocation::get_heading", {'__this__': this});
    return __result__ == null ? null : (CLHeading()..refId = __result__);
  }
  
  //endregion

  //region setters
  
  //endregion

  //region methods
  
  //endregion

  @override
  String toString() {
    return 'MAUserLocation{refId: $refId, runtimeType: $runtimeType, tag__: $tag__}';
  }
}

extension MAUserLocation_Batch on List<MAUserLocation> {
  //region getters
  Future<List<bool>> get_updating_batch() async {
    final resultBatch = await MethodChannel('me.yohom/amap_map_fluttify', StandardMethodCodec(FluttifyMessageCodec('amap_map_fluttify'))).invokeMethod("MAUserLocation::get_isUpdating_batch", [for (final __item__ in this) {'__this__': __item__}]);
  
    final typedResult = (resultBatch as List).cast<bool>().map((__result__) => __result__).toList();
    return typedResult;
  }
  
  Future<List<CLLocation>> get_location_batch() async {
    final resultBatch = await MethodChannel('me.yohom/amap_map_fluttify', StandardMethodCodec(FluttifyMessageCodec('amap_map_fluttify'))).invokeMethod("MAUserLocation::get_location_batch", [for (final __item__ in this) {'__this__': __item__}]);
  
    final typedResult = (resultBatch as List).cast<String>().map((__result__) => CLLocation()..refId = __result__).toList();
    return typedResult;
  }
  
  Future<List<CLHeading>> get_heading_batch() async {
    final resultBatch = await MethodChannel('me.yohom/amap_map_fluttify', StandardMethodCodec(FluttifyMessageCodec('amap_map_fluttify'))).invokeMethod("MAUserLocation::get_heading_batch", [for (final __item__ in this) {'__this__': __item__}]);
  
    final typedResult = (resultBatch as List).cast<String>().map((__result__) => CLHeading()..refId = __result__).toList();
    return typedResult;
  }
  
  //endregion

  //region setters
  
  //endregion

  //region methods
  
  //endregion
}