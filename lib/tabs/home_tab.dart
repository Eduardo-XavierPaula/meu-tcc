import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:meu_tcc/tiles/menu_button_tile.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeTab extends StatelessWidget {
  final PageController pageController;

  HomeTab(this.pageController);

  @override
  Widget build(BuildContext context) {
    BoxDecoration _buildBodyBack() => BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 31, 47, 152),
                Color.fromARGB(255, 28, 167, 236),
                Color.fromARGB(255, 74, 222, 222),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              tileMode: TileMode.clamp),
        );

    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Bem vindo')),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                  Color.fromARGB(255, 31, 47, 152),
                  Color.fromARGB(255, 28, 167, 236),
                  Color.fromARGB(255, 74, 222, 222),
                ],
                    begin: Alignment.topLeft,
                    end: Alignment.centerRight,
                    tileMode: TileMode.clamp)),
          ),
        ),
        body: Center(
          child: Container(
              decoration: _buildBodyBack(),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: <Widget>[
                        MenuButtonTile(Icons.person, "Clientes", "/clients"),
                        SizedBox(
                          width: 20,
                        ),
                        MenuButtonTile(Icons.book, "Agenda", "/agenda"),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    Row(
                      children: <Widget>[
                        MenuButtonTile(Icons.ballot, "Guias", "/guias"),
                        SizedBox(
                          width: 20,
                        ),
                        MenuButtonTile(
                            Icons.settings, "Configurações", "/config"),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    MenuButtonTile(Icons.explore, "endereços", "/config"),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                ),
              )),
        ));

//Cor gradiente
// new BoxDecoration(
//               gradient: new LinearGradient(
//                   colors: [
//                     const Color(0xFF3366FF),
//                     const Color(0xFF00CCFF),
//                   ],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                   stops: [0.0, 1.0],
//                   tileMode: TileMode.clamp

    // return Stack(
    //   children: [
    //     _buildBodyBack(),
    //     CustomScrollView(
    //       slivers:[
    //          SliverAppBar(
    //           floating: true,
    //           snap:true,
    //           backgroundColor:Colors.transparent,
    //           elevation:0.0,
    //           flexibleSpace: FlexibleSpaceBar(
    //             title: const Text("Bem vindo"),
    //             centerTitle: true,
    //           ),
    //         ),

    //         SliverStaggeredGrid.count(
    //                   crossAxisCount: 2,
    //                   mainAxisSpacing: 5.0,
    //                   crossAxisSpacing: 5.0,
    //                   staggeredTiles:[
    //                     const StaggeredTile.count(1,1),
    //                     const StaggeredTile.count(1,1),
    //                     const StaggeredTile.count(1,1),
    //                     const StaggeredTile.count(1,1),
    //                     const StaggeredTile.count(2,1),
    //                     ],
    //                   children: [
    //                     MenuButtonTile(Icons.person,"Clientes","/clients"),
    //                     MenuButtonTile(Icons.book,"Agenda","/agenda"),
    //                     MenuButtonTile(Icons.ballot,"Recibos","/recibos"),
    //                     MenuButtonTile(Icons.settings,"Configurações","/config"),
    //                     MenuButtonTile(Icons.explore,"endereços","/config"),
    //                   ]
    //               ),
    //       ],

    //     )
    //   ],
    // );
  }
}
