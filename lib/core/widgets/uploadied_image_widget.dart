import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasty_bite/core/utils/new_app_colors.dart';
import '../utils/app_text_style.dart';

class UploadedImage extends StatefulWidget {
  final String userEmail;

  const UploadedImage({super.key, required this.userEmail});

  @override
  State<UploadedImage> createState() => _UploadedImageState();
}

class _UploadedImageState extends State<UploadedImage> {
  File? _pickedImage;

  @override
  void initState() {
    super.initState();
    _loadSavedImage();
  }

  Future<void> _loadSavedImage() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'profileImage_${widget.userEmail}';
    final path = prefs.getString(key);
    if (path != null && File(path).existsSync()) {
      setState(() {
        _pickedImage = File(path);
      });
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();

    final pickedFile = await showModalBottomSheet<XFile?>(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: Text(
                  "Selection from the gallery",
                  style: AppTextStyle.fontWeightW400Size18TextDark,
                ),
                onTap: () async {
                  final image = await picker.pickImage(
                    source: ImageSource.gallery,
                  );
                  Navigator.pop(context, image);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text(
                  "Use the camera",
                  style: AppTextStyle.fontWeightW400Size18TextDark,
                ),
                onTap: () async {
                  final image = await picker.pickImage(
                    source: ImageSource.camera,
                  );
                  Navigator.pop(context, image);
                },
              ),
              if (_pickedImage != null)
                ListTile(
                  leading: const Icon(Icons.image),
                  title: const Text("View current image"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ImageScreen(userEmail: widget.userEmail),
                      ),
                    );
                  },
                ),
            ],
          ),
        );
      },
    );

    if (pickedFile != null) {
      final file = File(pickedFile.path);
      setState(() {
        _pickedImage = file;
      });

      final prefs = await SharedPreferences.getInstance();
      final key = 'profileImage_${widget.userEmail}';
      await prefs.setString(key, pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: CircleAvatar(
        radius: 50.r,
        backgroundColor: NewAppColors.textLight.withAlpha(40),
        backgroundImage: _pickedImage != null ? FileImage(_pickedImage!) : null,
        child: _pickedImage == null
            ? Icon(
                Icons.person,
                size: 80.r,
                color: NewAppColors.disabled.withAlpha(120),
              )
            : null,
      ),
    );
  }
}

class ImageScreen extends StatefulWidget {
  final String userEmail;

  const ImageScreen({super.key, required this.userEmail});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  String? _imagePath;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'profileImage_${widget.userEmail}';
    final path = prefs.getString(key);
    setState(() {
      _imagePath = path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Image",
          style: AppTextStyle.appbarSize22WhiteColor,
        ),
      ),
      body: Center(
        child: _imagePath != null && File(_imagePath!).existsSync()
            ? Image.file(
                File(_imagePath!),
                fit: BoxFit.contain,
                width: double.infinity,
                height: double.infinity,
              )
            : const Text("No image saved"),
      ),
    );
  }
}
