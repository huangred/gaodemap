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

class MACircleRenderer extends MAOverlayPathRenderer  {
  //region constants
  static const String name__ = 'MACircleRenderer';

  @override
  final String tag__ = 'amap_map_fluttify';

  
  //endregion

  //region creators
  static Future<MACircleRenderer> create__({ bool init = true /* ios only */ }) async {
    final refId = await MethodChannel('me.yohom/amap_map_fluttify', StandardMethodCodec(FluttifyMessageCodec('amap_map_fluttify'))).invokeMethod('ObjectFactory::createMACircleRenderer', {'init': init});
    final object = MACircleRenderer()..refId = refId;
    return object;
  }
  
  static Future<List<MACircleRenderer>> create_batch__(int length, { bool init = true /* ios only */ }) async {
    if (false) {
      return Future.error('all args must have same length!');
    }
    final List resultBatch = await MethodChannel('me.yohom/amap_map_fluttify', StandardMethodCodec(FluttifyMessageCodec('amap_map_fluttify'))).invokeMethod('ObjectFactory::create_batchMACircleRenderer', {'length': length, 'init': init});
  
    final List<MACircleRenderer> typedResult = resultBatch.map((result) => MACircleRenderer()..refId = result).toList();
    return typedResult;
  }
  
  //endregion

  //region getters
  Future<MACircle> get_circle() async {
    final __result__ = await MethodChannel('me.yohom/amap_map_fluttify', StandardMethodCodec(FluttifyMessageCodec('amap_map_fluttify'))).invokeMethod("MACircleRenderer::get_circle", {'__this__': this});
    return __result__ == null ? null : (MACircle()..refId = __result__);
  }
  
  //endregion

  //region setters
  
  //endregion

  //region methods
  
  Future<MACircleRenderer> initWithCircle(MACircle circle) async {
    // print log
    if (fluttifyLogEnabled) {
      debugPrint('fluttify-dart: MACircleRenderer@$refId::initWithCircle([])');
    }
  
    // invoke native method
    final __result__ = await MethodChannel('me.yohom/amap_map_fluttify', StandardMethodCodec(FluttifyMessageCodec('amap_map_fluttify'))).invokeMethod('MACircleRenderer::initWithCircle', {"circle": circle, "__this__": this});
  
  
    // handle native call
  
  
    // convert native result to dart side object
    if (__result__ == null) {
      return null;
    } else {
      final __return__ = MACircleRenderer()..refId = __result__;
      return __return__;
    }
  }
  
  //endregion

  @override
  String toString() {
    return 'MACircleRenderer{refId: $refId, runtimeType: $runtimeType, tag__: $tag__}';
  }
}

extension MACircleRenderer_Batch on List<MACircleRenderer> {
  //region getters
  Future<List<MACircle>> get_circle_batch() async {
    final resultBatch = await MethodChannel('me.yohom/amap_map_fluttify', StandardMethodCodec(FluttifyMessageCodec('amap_map_fluttify'))).invokeMethod("MACircleRenderer::get_circle_batch", [for (final __item__ in this) {'__this__': __item__}]);
  
    final typedResult = (resultBatch as List).cast<String>().map((__result__) => MACircle()..refId = __result__).toList();
    return typedResult;
  }
  
  //endregion

  //region setters
  
  //endregion

  //region methods
  
  Future<List<MACircleRenderer>> initWithCircle_batch(List<MACircle> circle) async {
    if (false) {
      return Future.error('all args must have same length!');
    }
  
    // invoke native method
    final resultBatch = await MethodChannel('me.yohom/amap_map_fluttify', StandardMethodCodec(FluttifyMessageCodec('amap_map_fluttify'))).invokeMethod('MACircleRenderer::initWithCircle_batch', [for (int __i__ = 0; __i__ < length; __i__++) {"circle": circle[__i__], "__this__": this[__i__]}]);
  
  
    // convert native result to dart side object
    if (resultBatch == null) {
      return null;
    } else {
      final typedResult = (resultBatch as List).cast<String>().map((__result__) => MACircleRenderer()..refId = __result__).toList();
      return typedResult;
    }
  }
  
  //endregion
}