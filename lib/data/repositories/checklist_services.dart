import 'package:flutter/material.dart';
import 'package:todolist/data/base_api/base_api.dart';
import 'package:todolist/features/home/models/response_getchecklist.dart';
import 'package:todolist/features/home/models/response_postchecklist.dart';

class CheckListServices extends BaseApi {
  Future<ResponseGetChecklist?> getCheckList(
    BuildContext context, {
    String path = '/api/checklist',
  }) async {
    final res = await get(
      context,
      path,
      {},
      loading: true,
    );
    if (res != null) {
      ResponseGetChecklist response = ResponseGetChecklist.fromJson(res);
      return response;
    }
    return null;
  }

  Future<ResponsePostChecklist?> postCheckList(
    BuildContext context, {
    String path = '/api/checklist',
    required String name,
  }) async {
    final res = await post(
      context,
      path,
      {"name": name},
      loading: true,
    );
    if (res != null) {
      ResponsePostChecklist response = ResponsePostChecklist.fromJson(res);
      return response;
    }
    return null;
  }

  Future<bool?> deleteCheckList(
    BuildContext context, {
    String path = '/api/checklist/',
    required var id,
  }) async {
    final res = await delete(
      context,
      "$path$id",
      {},
      loading: true,
    );
    if (res != null) {
      return true;
    }
    return null;
  }
}
