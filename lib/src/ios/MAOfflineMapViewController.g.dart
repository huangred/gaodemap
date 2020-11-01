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

class MAOfflineMapViewController extends UIViewController  {
  //region constants
  static const String name__ = 'MAOfflineMapViewController';

  @override
  final String tag__ = 'amap_map_fluttify';

  
  //endregion

  //region creators
  static Future<MAOfflineMapViewController> create__({ bool init = true /* ios only */ }) async {
    final refId = await MethodChannel('me.yohom/amap_map_fluttify', StandardMethodCodec(FluttifyMessageCodec('amap_map_fluttify'))).invokeMethod('ObjectFactory::createMAOfflineMapViewController', {'init': init});
    final object = MAOfflineMapViewController()..refId = refId;
    return object;
  }
  
  static Future<List<MAOfflineMapViewController>> create_batch__(int length, { bool init = true /* ios only */ }) async {
    if (false) {
      return Future.error('all args must have same length!');
    }
    final List resultBatch = await MethodChannel('me.yohom/amap_map_fluttify', StandardMethodCodec(FluttifyMessageCodec('amap_map_fluttify'))).invokeMethod('ObjectFactory::create_batchMAOfflineMapViewController', {'length': length, 'init': init});
  
    final List<MAOfflineMapViewController> typedResult = resultBatch.map((result) => MAOfflineMapViewController()..refId = result).toList();
    return typedResult;
  }
  
  //endregion

  //region getters
  Future<MAOfflineMap> get_offlineMap() async {
    final __result__ = await MethodChannel('me.yohom/amap_map_fluttify', StandardMethodCodec(FluttifyMessageCodec('amap_map_fluttify'))).invokeMethod("MAOfflineMapViewController::get_offlineMap", {'__this__': this});
    return __result__ == null ? null : (MAOfflineMap()..refId = __result__);
  }
  
  //endregion

  //region setters
  
  //endregion

  //region methods
  
  static Future<MAOfflineMapViewController> sharedInstance() async {
    // print log
    if (fluttifyLogEnabled) {
      debugPrint('fluttify-dart: MAOfflineMapViewController::sharedInstance([])');
    }
  
    // invoke native method
    final __result__ = await MethodChannel('me.yohom/amap_map_fluttify', StandardMethodCodec(FluttifyMessageCodec('amap_map_fluttify'))).invokeMethod('MAOfflineMapViewController::sharedInstance', );
  
  
    // handle native call
  
  
    // convert native result to dart side object
    if (__result__ == null) {
      return null;
    } else {
      final __return__ = MAOfflineMapViewController()..refId = __result__;
      return __return__;
    }
  }
  
  //endregion

  @override
  String toString() {
    return 'MAOfflineMapViewController{refId: $refId, runtimeType: $runtimeType, tag__: $tag__}';
  }
}

extension MAOfflineMapViewController_Batch on List<MAOfflineMapViewController> {
  //region getters
  Future<List<MAOfflineMap>> get_offlineMap_batch() async {
    final resultBatch = await MethodChannel('me.yohom/amap_map_fluttify', StandardMethodCodec(FluttifyMessageCodec('amap_map_fluttify'))).invokeMethod("MAOfflineMapViewController::get_offlineMap_batch", [for (final __item__ in this) {'__this__': __item__}]);
  
    final typedResult = (resultBatch as List).cast<String>().map((__result__) => MAOfflineMap()..refId = __result__).toList();
    return typedResult;
  }
  
  //endregion

  //region setters
  
  //endregion

  //region methods
  
  static Future<List<MAOfflineMapViewController>> sharedInstance_batch() async {
    if (false) {
      return Future.error('all args must have same length!');
    }
  
    // invoke native method
    final resultBatch = await MethodChannel('me.yohom/amap_map_fluttify', StandardMethodCodec(FluttifyMessageCodec('amap_map_fluttify'))).invokeMethod('MAOfflineMapViewController::sharedInstance_batch', );
  
  
    // convert native result to dart side object
    if (resultBatch == null) {
      return null;
    } else {
      final typedResult = (resultBatch as List).cast<String>().map((__result__) => MAOfflineMapViewController()..refId = __result__).toList();
      return typedResult;
    }
  }
  
  //endregion
}