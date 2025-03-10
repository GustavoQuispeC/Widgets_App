import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        return _CustomListile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListile extends StatelessWidget {
  const _CustomListile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(
        title: Text(menuItem.title),
        subtitle: Text(menuItem.subtitle),
        trailing: Icon(Icons.chevron_right, color: colors.primary),
        leading: Icon(menuItem.icon, color: colors.primary),
        onTap: () => {
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => const ButtonsScreen()))
              //Navigator.of(context).pushNamed(menuItem.link)

              //context.pushNamed(CardsScreen.name)

              context.push(menuItem.link)
            });
  }
}
