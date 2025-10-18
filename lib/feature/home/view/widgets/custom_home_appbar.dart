
import 'package:flutter/material.dart';
import '../../../../core/helper/get_user_data.dart';
import '../../../../core/utils/new_app_colors.dart';

class CustomHomeAppbar extends StatefulWidget implements PreferredSizeWidget {
  const CustomHomeAppbar({super.key, required this.onPressed});

  final Function() onPressed;

  @override
  State<CustomHomeAppbar> createState() => _CustomHomeAppbarState();
  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _CustomHomeAppbarState extends State<CustomHomeAppbar> {
  String userName = "";
  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    final name = await GetUserData.getUserName();
    if (mounted) {
      setState(() {
        userName = name ?? "Guest";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Hello, $userName"),
      actions: [
        IconButton(
          onPressed: widget.onPressed,
          icon: Icon(Icons.person, color: NewAppColors.white),
        ),
      ],
    );
  }
}
