import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tracking_app/core/constants.dart';
import 'package:tracking_app/generated/l10n.dart' show S;

class ImagePickerField extends StatefulWidget {
  final Function(File?) onImageSelected;
  final String hinttext;

  const ImagePickerField(
      {super.key, required this.onImageSelected, required this.hinttext});

  @override
  _ImagePickerFieldState createState() => _ImagePickerFieldState();
}

class _ImagePickerFieldState extends State<ImagePickerField> {
  File? _selectedImage;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
      widget.onImageSelected(_selectedImage);
    }
  }

  void _showImagePickerOptions(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: AppColors.backgroundColor,
      context: context,
      builder: (ctx) => Container(
        padding: const EdgeInsets.all(10),
        height: 150,
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: Text(S.of(context).useCamera),
              onTap: () {
                Navigator.pop(ctx);
                _pickImage(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.image),
              title: Text(S.of(context).chooseFromGallery),
              onTap: () {
                Navigator.pop(ctx);
                _pickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _removeImage() {
    setState(() {
      _selectedImage = null;
    });
    widget.onImageSelected(null);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => _showImagePickerOptions(context),
          child: AbsorbPointer(
            child: TextField(
              decoration: InputDecoration(
                hintText: widget.hinttext,
                hintStyle:
                    const TextStyle(fontSize: 16, color: AppColors.textColor3),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: const Icon(Icons.upload),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        _selectedImage != null
            ? Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      _selectedImage!,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: _removeImage,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red,
                        ),
                        padding: const EdgeInsets.all(6),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}
