import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo_app_provider/Provider/favorite_provider.dart';

class FavoritedScreen extends StatefulWidget {
  const FavoritedScreen({Key? key}) : super(key: key);

  @override
  State<FavoritedScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoritedScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoriteProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorited"),
        backgroundColor: Colors.green,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 25),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: provider.selelted.length,
                itemBuilder: (context, index) {
                  int itemIndex = provider.selelted[index];
                  return ListTile(
                    onTap: () {
                      provider.RemoveFavorite(itemIndex);
                    },
                    title: Text("Item : $itemIndex"),
                    leading: const Icon(Icons.insert_emoticon),
                    trailing: const Icon(Icons.favorite),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
