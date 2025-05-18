import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'card_park_widget.dart' show CardParkWidget;
import 'package:flutter/material.dart';

class CardParkModel extends FlutterFlowModel<CardParkWidget> {
  ///  Local state fields for this component.

  String coordinatesForMaps = '0,0';

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - latLngToString] action in CardPark widget.
  String? currentPos;
  // Stores action output result for [Backend Call - API (DistancePark)] action in CardPark widget.
  ApiCallResponse? aPIRes;
  // Stores action output result for [Backend Call - API (DistancePark)] action in CardPark widget.
  ApiCallResponse? aPIResWalking;
  // Stores action output result for [Backend Call - API (rating)] action in CardPark widget.
  ApiCallResponse? aPIResRating;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
