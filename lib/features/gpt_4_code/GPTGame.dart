import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:own_project/common/show_snackbar.dart';

class GenderAvatar extends StatefulWidget {
  static const String routeName = "/gender-avatar";

  const GenderAvatar({super.key});

  @override
  State<GenderAvatar> createState() => _GenderAvatarState();
}

class _GenderAvatarState extends State<GenderAvatar> {
  String _gender = '';
  String _name = 'scott';
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchGender();
  }

  Future<void> _fetchGender() async {
    setState(() {
      _isLoading = true;
    });

    final response =
        await http.get(Uri.parse('https://api.genderize.io?name=$_name'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        _gender = data['gender'];
      });
    } else {
      if (!context.mounted) return;
      showSnackBar(context, "Error Occurred");
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget avatar = _isLoading
        ? const CircularProgressIndicator()
        : _gender.isEmpty
            ? const Text('No gender data available')
            : Image.asset(
                _gender == 'male' ? 'assets/boy.jpg' : 'assets/girl.png');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gender Avatar'),
      ),
      body: Center(
        child: avatar,
      ),
    );
  }
}
