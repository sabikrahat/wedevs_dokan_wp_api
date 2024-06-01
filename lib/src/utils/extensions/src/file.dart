

part of '../extensions.dart';

extension FileExt on File {
  Future<String> get base64 async => base64Encode(await readAsBytes());

  String get name => path.split('/').last;

  Future<File> saveToAppDir() async => await copy(join(appDir.files.path, name));
}

extension PlatformFileExt on PlatformFile {
  Future<String> get base64 async => base64Encode(bytes!);

  File get toFile => File(path!);
}

extension PlatformFilesExt on List<PlatformFile> {
  List<File> get toFiles => map((e) => e.toFile).toList();
}

extension FilePickerResultExt on FilePickerResult {
  List<File> get toFiles => paths.map((e) => File(e!)).toList();
}
