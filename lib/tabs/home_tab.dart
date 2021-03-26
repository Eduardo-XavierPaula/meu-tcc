import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:meu_tcc/screens/agenda_screen.dart';
import 'package:meu_tcc/screens/clients_screen.dart';
import 'package:meu_tcc/tiles/menu_button_tile.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeTab extends StatelessWidget {
  final PageController pageController;

  HomeTab(this.pageController);

  @override
  Widget build(BuildContext context) {

    Widget _buildBodyBack()=> Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 31, 47, 152),
            Color.fromARGB(255, 28,167,236),
            Color.fromARGB(255, 74,222,222),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        )
      ),
    );
    return Stack(
      children: [
        _buildBodyBack(),
        CustomScrollView(
          slivers:[
            SliverAppBar(
              floating: true,
              snap:true,
              backgroundColor:Colors.transparent,
              elevation:0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text("Bem vindo"),
                centerTitle: true,
              ),
            ),
            SliverStaggeredGrid.count(
                      crossAxisCount: 2,                  
                      mainAxisSpacing: 5.0,
                      crossAxisSpacing: 5.0,
                      staggeredTiles:[
                        const StaggeredTile.count(1,1),
                        const StaggeredTile.count(1,1),
                        const StaggeredTile.count(1,1),
                        const StaggeredTile.count(1,1),
                        const StaggeredTile.count(2,1),
                        ],
                      children: [                        
                        MenuButtonTile(Icons.person,"Clientes","/clients"),   
                        MenuButtonTile(Icons.book,"Agenda","/agenda"),   
                        MenuButtonTile(Icons.ballot,"Recibos","/recibos"),   
                        MenuButtonTile(Icons.settings,"Configurações","/config"),   
                        MenuButtonTile(Icons.explore,"endereços","/config"),   
                      ]
                  ),                
          ]
        )
      ],
    );
  }
}