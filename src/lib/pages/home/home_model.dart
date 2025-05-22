import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:flutter/material.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  List<ParkingLotRecord> parkListSort = [];
  void addToParkListSort(ParkingLotRecord item) => parkListSort.add(item);
  void removeFromParkListSort(ParkingLotRecord item) =>
      parkListSort.remove(item);
  void removeAtIndexFromParkListSort(int index) => parkListSort.removeAt(index);
  void insertAtIndexInParkListSort(int index, ParkingLotRecord item) =>
      parkListSort.insert(index, item);
  void updateParkListSortAtIndex(
          int index, Function(ParkingLotRecord) updateFn) =>
      parkListSort[index] = updateFn(parkListSort[index]);

  String sortingMethod = 'currentAvailability-asc';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Home widget.
  List<ParkingLotRecord>? parkingList;
  // Stores action output result for [Custom Action - sortItems] action in Home widget.
  List<ParkingLotRecord>? refListSorted;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Custom Action - sortItems] action in DropDown widget.
  List<ParkingLotRecord>? updatedList;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
