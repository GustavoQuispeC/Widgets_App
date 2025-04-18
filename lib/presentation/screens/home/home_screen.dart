import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
//! ScaffoldKey para el drawer: permite abrir el drawer desde el body
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        //llamamos al scaffoldKey
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text('Flutter + Material 3'),
        ),
        body: const _HomeView(),
        drawer: SideMenu(scaffoldKey: scaffoldKey));
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
