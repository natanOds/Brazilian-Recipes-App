import 'package:flutter/material.dart';
import 'dart:convert';
import '../../models/recipe.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return _buildHome(); //O underline é por ser um metodo/função privado
  }

  Widget _buildHome() {
    return Scaffold(
      body: _buildCardList(),
      appBar: _buildAppBar(),
    );
  }

  Widget _buildCardList() {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString('assets/recipe.json'),
      builder: (context, snapshot) {
        List<dynamic> recipes = json.decode(snapshot.data.toString());

        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            Recipe recipe = Recipe.fromJson(recipes[index]);

            return _buildCard(recipe.title, recipe.photo);
          },
          itemCount: recipes == null ? 0 : recipes.length,
        );
      }
    );
  }

  Widget _buildCard(title, photo) {
    return SizedBox(
      //Poder redimencionar o tamanho
      height: 280,
      child: Card(
        margin: EdgeInsets.all(16), //Borda em todos cantos dos elementos
        child: Column(
          children: <Widget>[
            Stack(
              //Coloca elemento em cima do outro, para o Texto ficam em cima da foto
              children: <Widget>[
                _buildImage(photo),
                _buildText(title),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildImage(photo) {
    return Image.asset(photo, fit: BoxFit.fill, height: 248);
  }

  Widget _buildText(title) {
    return Positioned(
      //Para posicionar o elemento na tela
      bottom: 10,
      left: 10,
      child: Text(
        title,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(title: Text('Brazilian Recipes'), centerTitle: true);
  }
}
