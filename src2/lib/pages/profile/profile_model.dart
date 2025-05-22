import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_widget.dart' show ProfileWidget;
import 'package:flutter/material.dart';

class ProfileModel extends FlutterFlowModel<ProfileWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Firestore Query - Query a collection] action in IconButton widget.
  List<MessageRecord>? messages;
  // Stores action output result for [Backend Call - Read Document] action in IconButton widget.
  CarRecord? carRef;
  // State field(s) for NewCarPlate widget.
  FocusNode? newCarPlateFocusNode;
  TextEditingController? newCarPlateTextController;
  String? Function(BuildContext, String?)? newCarPlateTextControllerValidator;
  String? _newCarPlateTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return 'Car plate needs to be 6 characters';
    }
    if (val.length > 6) {
      return 'Car plate needs to be 6 characters';
    }

    return null;
  }

  // Stores action output result for [Custom Action - convertToUppercase] action in NewCarPlate widget.
  String? finalCarPlate;
  // Stores action output result for [Firestore Query - Query a collection] action in NewCarPlate widget.
  CarRecord? carReference;
  // Stores action output result for [Backend Call - Create Document] action in NewCarPlate widget.
  CarRecord? newCarReference;

  @override
  void initState(BuildContext context) {
    newCarPlateTextControllerValidator = _newCarPlateTextControllerValidator;
  }

  @override
  void dispose() {
    newCarPlateFocusNode?.dispose();
    newCarPlateTextController?.dispose();
  }
}
