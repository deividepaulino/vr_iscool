import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:vr_iscool/core/shared/presenter/atoms/core_atoms.dart';

class CustomBottomMenu extends StatefulWidget {
  const CustomBottomMenu({super.key});

  @override
  State<CustomBottomMenu> createState() => _CustomBottomMenuState();
}

class _CustomBottomMenuState extends State<CustomBottomMenu> {
  @override
  Widget build(BuildContext context) {
    context.select(() => navBarIndex.value);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: navBarIndex.value,
          elevation: 10,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor:
              Theme.of(context).primaryColorDark.withOpacity(0.5),
          onTap: (i) {
            if (i == navBarIndex.value) {
              return;
            }
            navBarIndex.setValue(i);

            if (i == 1) {
              Modular.to.pushNamed('/course/');
              return;
            }
            if (i == 2) {
              Modular.to.pushNamed('/student/');
              return;
            }
            Modular.to.pushNamed('/index/');
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.grey.shade200,
              icon: _buildIcon(Icons.home, 0),
              label: '',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.grey.shade200,
              icon: _buildIcon(Icons.menu_book, 1),
              label: '',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.grey.shade200,
              icon: _buildIcon(Icons.school, 2),
              label: '',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.grey.shade200,
              icon: _buildIcon(Icons.file_copy, 3),
              label: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon),
        const SizedBox(height: 4),
        if (navBarIndex.value == index)
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange,
            ),
          ),
      ],
    );
  }
}
