import 'package:demo_app_provider/Provider/favorite_provider.dart';
import 'package:demo_app_provider/Screen/Favorite/favoriteScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          title: Text("Favorite App"),
          backgroundColor: Colors.green,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 25),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FavoritedScreen(),
                  ));
                },
                child: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  return ListTile(
                      onTap: () {
                        if (provider.selelted.contains(index)) {
                          provider.RemoveFavorite(index);
                        } else {
                          provider.AddFavorite(index);
                        }
                      },
                      title: Text("Item : ${index}"),
                      leading: Icon(Icons.insert_emoticon),
                      trailing: provider.selelted.contains(index)
                          ? const Icon(Icons.favorite)
                          : const Icon(Icons.favorite_border_outlined));
                },
              ),
            )
          ],
        )));
  }
}
