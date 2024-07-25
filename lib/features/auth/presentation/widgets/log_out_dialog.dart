import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taske/core/theme/color/app_color.dart';

import '../bloc/auth_bloc.dart';

Future<void> showLogoutDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // User must tap button to close dialog
    builder: (BuildContext context) {
      return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSignOutEvent) {}
        },
        child: AlertDialog(
         
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'We will miss you...',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
            ],
          ),
          content: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Are you sure you want to logout?'),
            ],
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: AppColor.primaryText),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop(); // Dismiss the dialog
                  },
                ),
                TextButton(
              child: const Text(
                'Logout',
                style: TextStyle(color: AppColor.danger),
              ),
              onPressed: () {
                context.read<AuthBloc>().add(AuthSignOutEvent());
                Navigator.of(context).pop();
              },
            ),
              ],
            ),
            
          ],
        ),
      );
    },
  );
}
