import 'dart:io';

import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';

class DownloadService {
  Future<PermissionResult> requestManageStoragePermission() async {
    final status = await Permission.manageExternalStorage.request();

    if (status.isGranted) {
      return PermissionResult(
        permission: "MANAGE_EXTERNAL_STORAGE",
        granted: true,
        status: "GRANTED",
      );
    }

    if (status.isPermanentlyDenied) {
      return PermissionResult(
        permission: "MANAGE_EXTERNAL_STORAGE",
        granted: false,
        status: "PERMANENTLY_DENIED",
      );
    }

    if (status.isDenied) {
      return PermissionResult(
        permission: "MANAGE_EXTERNAL_STORAGE",
        granted: false,
        status: "DENIED",
      );
    }

    if (status.isRestricted) {
      return PermissionResult(
        permission: "MANAGE_EXTERNAL_STORAGE",
        granted: false,
        status: "RESTRICTED",
      );
    }

    if (status.isLimited) {
      return PermissionResult(
        permission: "MANAGE_EXTERNAL_STORAGE",
        granted: false,
        status: "LIMITED",
      );
    }

    return PermissionResult(
      permission: "MANAGE_EXTERNAL_STORAGE",
      granted: false,
      status: "UNKNOWN",
    );
  }

  Future<String> downloadFile(String url) async {
    try {
      final hasPermission = await requestManageStoragePermission();
      if (!hasPermission.granted) {
        return "PERMISSION_DENIED";
      }

      final uri = Uri.parse(url);

      if (uri.pathSegments.length < 2) {
        return "INVALID_URL";
      }

      final folderName = uri.pathSegments[1];
      final fileName = uri.pathSegments.last;

      final dir = Directory('/storage/emulated/0/Download/app_name/$folderName');
      if (!await dir.exists()) {
        await dir.create(recursive: true);
      }

      final file = File('${dir.path}/$fileName');

      final response = await Dio().get(
        url,
        options: Options(responseType: ResponseType.bytes, followRedirects: false),
      );

      if (response.statusCode != 200 || response.data == null) {
        return "DOWNLOAD_FAILED";
      }

      await file.writeAsBytes(response.data);

      return "SUCCESS:$fileName";
    } on DioException catch (e) {
      return "NETWORK_ERROR:${e.message}";
    } on FileSystemException catch (e) {
      return "FILE_ERROR:${e.message}";
    } catch (e) {
      return "UNKNOWN_ERROR:$e";
    }
  }
}

class PermissionResult {
  final String permission;
  final bool granted;
  final String status;

  PermissionResult({required this.permission, required this.granted, required this.status});
}
