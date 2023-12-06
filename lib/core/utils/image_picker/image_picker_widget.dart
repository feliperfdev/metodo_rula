import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:images_picker/images_picker.dart';

import 'image_picker_controller.dart';

class ImagePickerWidget extends StatefulWidget {
  final Function(Media? media)? onMediaPicked;
  final Media? importedMedia;
  const ImagePickerWidget({
    super.key,
    this.onMediaPicked,
    this.importedMedia,
  });

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  final controller = Modular.get<ImagePickerController>();

  Media? _media;

  @override
  void initState() {
    if (widget.importedMedia != null) {
      _media = widget.importedMedia;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      replacement: Container(
        margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.purple,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.file(
              File(
                _media?.path ?? '',
              ),
              height: 200,
              fit: BoxFit.contain,
            ),
            InkWell(
              borderRadius: BorderRadius.circular(100),
              onTap: () async {
                _media = await controller.openCamera();
                if (widget.onMediaPicked != null) {
                  widget.onMediaPicked!(_media);
                }
                setState(() {});
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.cameraswitch,
                      color: Colors.purple,
                    ),
                  ),
                  const Text(
                    'Tirar outra foto',
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      visible: _media == null,
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: () async {
          _media = await controller.openCamera();
          if (widget.onMediaPicked != null) {
            widget.onMediaPicked!(_media);
          }
          setState(() {});
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.purple,
          ),
          child: const Icon(
            Icons.camera_alt_outlined,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
