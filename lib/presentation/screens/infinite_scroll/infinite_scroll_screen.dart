import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_scroll_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  //Lista de imagenes
  List<int> imagesIds = [1, 2, 3, 4, 5];
  //Controlador de scroll
  final ScrollController scrollController = ScrollController();
  //Bandera para saber si esta cargando
  bool isLoading = false;
  //Bandera para saber si esta montado el componente/widget
  bool isMounted = true;

//Se ejecuta antes de que el widget sea construido
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  //Se ejecuta antes de que el widget sea destruido
  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

//Carga la siguiente pagina
  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    isLoading = false;

    //todo: revisar si esta montado el componente/widget
    if (!isMounted) return;
    setState(() {});

    //todo: Mover scroll
  }

//Agrega 5 imagenes a la lista
  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        //remueve el padding del MediaQuery
        context: context,
        removeTop: true,
        removeBottom: true, //no funciona en algunos dispositivos moviles
        child: ListView.builder(
            physics: const BouncingScrollPhysics(), //efecto de rebote
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                  placeholder:
                      const AssetImage('assets/images/jar-loading.gif'),
                  image: NetworkImage(
                      'https://picsum.photos/id/${imagesIds[index]}/500/300'));
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: isLoading
            ? SpinPerfect(
                infinite: true, child: const Icon(Icons.refresh_rounded))
            : const Icon(Icons.arrow_back),
      ),
    );
  }
}
