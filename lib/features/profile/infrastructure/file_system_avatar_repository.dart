import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pizza_order_app/features/profile/domain/avatar_repository.dart';

class FileSystemAvatarRepository extends AvatarRepository {
  Future<String> get _avatarPath async => join(
        (await getApplicationDocumentsDirectory()).path,
        'avatar.png',
      );

  @override
  Future<ImageProvider<Object>> getAvatar() async {
    final file = File(await _avatarPath);
    if (file.existsSync()) {
      return FileImage(file);
    }
    return const AssetImage('assets/anonymus_avatar.png');
  }

  @override
  Future<void> saveAvatar(Uint8List bytes) async {
    await File(await _avatarPath).writeAsBytes(bytes, flush: true);
  }
}
