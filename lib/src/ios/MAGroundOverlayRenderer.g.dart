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

class MAGroundOverlayRenderer extends MAOverlayRenderer  {
  //region constants
  static const String name__ = 'MAGroundOverlayRenderer';

  @override
  final String tag__ = 'amap_map_fluttify';

  
  //endregion

  //region creators
  static Future<MAGroundOverlayRenderer> create__({ bool init = true /* ios only */ }) async {
    final refId = await MethodChannel('me.yohom/amap_map_fluttify', StandardMethodCodec(FluttifyMessageCodec('amap_map_fluttify'))).invokeMethod('ObjectFactory::createMAGroundOverlayRenderer', {'init': init});
    final object = MAGroundOverlayRenderer()..refId = refId;
    return object;
  }
  
  static Future<List<MAGroundOverlayRenderer>> create_batch__(int length, { bool init = true /* ios only */ }) async {
    if (false) {
      return Future.error('all args must have same length!');
    }
    final List resultBatch = await MethodChannel('me.yohom/amap_map_fluttify', StandardMethodCodec(FluttifyMessageCodec('amap_map_fluttify'))).invokeMethod('ObjectFactory::create_batchMAGroundOverlayRenderer', {'length': length, 'init': init});
  
    final List<MAGroundOverlayRenderer> typedResult = resultBatch.map((result) => MAGroundOverlayRenderer()..refId = result).toList();
    return typedResult;
  }
  
  //endregion

  //region getters
  Future<MAGroundOverlay> get_groundOverlay() async {
    final __result__ = await MethodChannel('me.yohom/amap_map_fluttify', StandardMethodCodec(FluttifyMessageCodec('amap_map_fluttify'))).invokeMethod("MAGroundOverlayRenderer::get_groundOverlay", {'__this__': this});
    return __result__ == null ? null : (MAGroundOverlay()..refId = __result__);
  }
  
  //endregion

  //region setters
  
  //endregion

  //region methods
  
  Future<MAGroundOverlayRenderer> initWithGroundOverlay(MAGroundOverlay groundOverlay) async {
    // print log
    if (fluttifyLogEnabled) {
      debugPrint('fluttify-dart: MAGroundOverlayRenderer@$refId::initWithGroundOverlay([])');
    }
  
    // invoke native method
    final __result__ = await MethodChannel('me.yohom/amap_map_fluttify', StandardMethodCodec(FluttifyMessageCodec('amap_map_fluttify'))).invokeMethod('MAGroundOverlayRenderer::initWithGroundOverlay', {"groundOverlay": groundOverlay, "__this__": this});
  
  
    // handle native call
  
  
    // convert native result to dart side object
    if (__result__ == null) {
      return null;
    } else {
      final __return__ = MAGroundOverlayRenderer()..refId = __result__;
      return __return__;
    }
  }
  
  //endregion

  @override
  String toString() {
    return 'MAGroundOverlayRenderer{refId: $refId, runtimeType: $runtimeType, tag__: $tag__}';
  }
}

extension MAGroundOverlayRenderer_Batch on List<MAGroundOverlayRenderer> {
  //region getters
  Future<List<MAGroundOverlay>> get_groundOverlay_batch() async {
    final resultBatch = await MethodChannel('me.yohom/amap_map_fluttify', StandardMethodCodec(FluttifyMessageCodec('amap_map_fluttify'))).invokeMethod("MAGroundOverlayRenderer::get_groundOverlay_batch", [for (final __item__ in this) {'__this__': __item__}]);
  
    final typedResult = (resultBatch as List).cast<String>().map((__result__) => MAGroundOverlay()..refId = __result__).toList();
    return typedResult;
  }
  
  //endregion

  //region setters
  
  //endregion

  //region methods
  
  Future<List<MAGroundOverlayRenderer>> initWithGroundOverlay_batch(List<MAGroundOverlay> groundOverlay) async {
    if (false) {
      return Future.error('all args must have same length!');
    }
  
    // invoke native method
    final resultBatch = await MethodChannel('me.yohom/amap_map_fluttify', StandardMethodCodec(FluttifyMessageCodec('amap_map_fluttify'))).invokeMethod('MAGroundOverlayRenderer::initWithGroundOverlay_batch', [for (int __i__ = 0; __i__ < length; __i__++) {"groundOverlay": groundOverlay[__i__], "__this__": this[__i__]}]);
  
  
    // convert native result to dart side object
    if (resultBatch == null) {
      return null;
    } else {
      final typedResult = (resultBatch as List).cast<String>().map((__result__) => MAGroundOverlayRenderer()..refId = __result__).toList();
      return typedResult;
    }
  }
  
  //endregion
}