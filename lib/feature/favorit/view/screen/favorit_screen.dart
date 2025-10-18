import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/empty_placeholder_text.dart';
import '../cubit/favorit_cubit.dart';
import '../widget/favorit_item_list.dart';

class FavoritScreen extends StatelessWidget {
  const FavoritScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorite Dishes")),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (state is FavoritesLoaded) {
            return ListView.builder(
              padding: EdgeInsets.only(top: 10),
              itemCount: state.favorites.length,
              itemBuilder: (context, index) {
                return FavoritItem(itemDetails: state.favorites[index]);
              },
            );
          }
          return EmptyPlaceholderText(title: "There are no favorite dishes yet.");
        },
      ),
    );
  }
}

