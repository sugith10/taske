import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:taske/core/theme/color/app_color.dart';
import 'package:taske/features/navigation_menu/bloc/navigation_bloc.dart';
import 'package:taske/features/tasks/presentation/pages/task_page.dart';
import 'package:taske/features/task_user/presentation/pages/user_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          switch (state) {
            case NavigationHomeState():
              return const TaskPage();
            case NavigationUserState():
              return const UserPage();
          }
        },
      ),
      bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            backgroundColor: AppColor.bg,
            selectedItemColor: AppColor.create,
            selectedLabelStyle: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            selectedIconTheme: const IconThemeData(
              color: AppColor.create,
            ),
            currentIndex: _getCurrentIndex(state),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: _getCurrentIndex(state) == 0
                    ? const Icon(IconlyBold.edit)
                    : const Icon(IconlyBroken.edit),
                label: 'Tasks',
              ),
              BottomNavigationBarItem(
                icon: _getCurrentIndex(state) == 1
                    ? const Icon(IconlyBold.user_3)
                    : const Icon(IconlyBroken.user_3),
                label: 'Users',
              ),
            ],
            onTap: (index) {
              context.read<NavigationBloc>().add(NavigationEvent(index));
            },
          );
        },
      ),
    );
  }

  int _getCurrentIndex(NavigationState state) {
    if (state is NavigationHomeState) {
      return 0;
    } else if (state is NavigationUserState) {
      return 1;
    }
    return 0; // Default index if state is not recognized
  }
}
