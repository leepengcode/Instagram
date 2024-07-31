import 'package:demo_app_provider/data/respnse/status.dart';
import 'package:demo_app_provider/model/movie_model.dart';
import 'package:demo_app_provider/utils/routes/routes_name.dart';
import 'package:demo_app_provider/view/movie_screen.dart';
import 'package:demo_app_provider/view_model/auth_view_model.dart';
import 'package:demo_app_provider/view_model/home_view_model.dart';
import 'package:demo_app_provider/view_model/user_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeViewModel.fetchMovieListApi();
  }

  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
              onTap: Navigator.of(context).pop,
              child: Center(
                  child: GestureDetector(
                onTap: () {
                  userPreference.remove().then((value) {
                    Navigator.pushNamed(context, RoutesName.login);
                  });
                },
                child: Text(
                  "LOGOUT",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ))),
        ],
        backgroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        onRefresh: () {
          homeViewModel.fetchMovieListApi();
          return Future.delayed(Duration(seconds: 1));
        },
        child: Center(
          child: ChangeNotifierProvider<HomeViewModel>(
            create: (BuildContext context) => homeViewModel,
            child: Consumer<HomeViewModel>(
              builder: (context, value, _) {
                switch (value.movieList.status) {
                  case Status.LOADING:
                    return CircularProgressIndicator();
                  case Status.ERROR:
                    return Text(value.movieList.message.toString());
                  case Status.COMPLETED:
                    return ListView.builder(
                      itemCount: value.movieList.data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieScreen(
                                  movie: value.movieList.data![index],
                                ),
                              ),
                            );
                          },
                          child: Card(
                              child: ListTile(
                            leading: Image(
                              image: NetworkImage(value
                                  .movieList.data![index].image
                                  .toString()),
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.error);
                              },
                            ),
                            title: Text(
                                value.movieList.data![index].title.toString()),
                            subtitle: Text(
                                value.movieList.data![index].year.toString()),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  value.movieList.data![index].rating
                                      .toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.star_border_outlined,
                                  size: 28,
                                  color: Colors.yellow,
                                )
                              ],
                            ),
                          )),
                        );
                      },
                    );
                  default:
                    null;
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
