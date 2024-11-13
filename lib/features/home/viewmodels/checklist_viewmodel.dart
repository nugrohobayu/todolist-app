import 'package:flutter/material.dart';
import 'package:todolist/data/repositories/checklist_services.dart';
import 'package:todolist/features/home/models/response_getchecklist.dart';

class CheckListViewModel extends ChangeNotifier {
  final service = CheckListServices();

  ResponseGetChecklist checklist = ResponseGetChecklist();

  getCheckList(BuildContext context) async {
    final result = await service.getCheckList(context);
    if (result != null) {
      checklist = result;
      notifyListeners();
    }
  }

  postCheckList(BuildContext context, String name) async {
    final result = await service.postCheckList(context, name: name);
    if (result != null && context.mounted) {
      getCheckList(context);
    }
  }

  deleteCheckList(BuildContext context, String id) async {
    final result = await service.deleteCheckList(context, id: id);
    if (result != null && context.mounted) {
      getCheckList(context);
    }
  }
}
