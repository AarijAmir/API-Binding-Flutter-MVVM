import 'package:flutter/material.dart';
import 'package:flutter_api_mvvm/data/network/responses/status.dart';
import 'package:flutter_api_mvvm/utils/constants/constant_fields.dart';
import 'package:flutter_api_mvvm/view_model/home_view_model.dart';
import 'package:flutter_api_mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../utils/constants/constant_methods.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<HomeViewModel>(context, listen: false).getMoviesList(context);
  }

  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Row(
            children: [
              InkWell(
                onTap: () async {
                  await userPreferences.removeUser();
                  Navigator.of(context).pushNamed(kLoginScreen);
                },
                child: const Text(
                  'Logout',
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Consumer<HomeViewModel>(
          builder: (context, value, child) {
            switch (value.moviesList.status) {
              case Status.loading:
                return const CircularProgressIndicator();
              case Status.error:
                return Text(value.moviesList.status.toString());
              default:
                return ListView.builder(
                  itemCount: value.moviesList.data?.movies?.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: Image.network(
                          value.moviesList.data!.movies![index].posterurl
                              .toString(),
                          errorBuilder: (context, error, stack) {
                            return const Icon(
                              Icons.error,
                              color: Colors.red,
                            );
                          },
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                        title: Text(value.moviesList.data!.movies![index].title
                            .toString()),
                        subtitle: Text(value
                            .moviesList.data!.movies![index].year
                            .toString()),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(averageRating(value
                                    .moviesList.data!.movies![index].ratings!)
                                .toStringAsFixed(1)),
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
