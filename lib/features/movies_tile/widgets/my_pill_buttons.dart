import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_ver2/features/movies_tile/cubit/movie_pills_cubit.dart';
import 'package:movie_app_ver2/util/constants.dart';

class MyPillButtons extends StatelessWidget {
  const MyPillButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviePillsCubit, MoviePillsState>(
      builder: (context, state) {
        // MoviePillCubit
        final moviePillsCubit = context.read<MoviePillsCubit>();
        return Container(
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          padding: const EdgeInsets.only(bottom: 12),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            // Sizedbox to control the height of the pill buttons
            child: SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // Total Number of buttons
                itemCount: Constants.movieCategories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    // Padding between buttons
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    // Creating pill button
                    child: TextButton(
                      style: TextButton.styleFrom(
                        // Color change based on the selected button
                        backgroundColor: state.index == index
                            ? Theme.of(context).focusColor
                            : Theme.of(context).disabledColor,
                        // foregroundColor: Colors.grey.shade700,
                      ),
                      onPressed: () {
                        switch (index) {
                          case 0:
                            moviePillsCubit.getTopRatedMovies();
                          case 1:
                            moviePillsCubit.getComingSoonMovies();
                          case 2:
                            moviePillsCubit.getTrendingMovies();
                          default:
                            const SizedBox();
                        }
                      },
                      child: Padding(
                        padding:
                            // Pill button Text padding
                            const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                            // Name of the pill button
                            Constants.movieCategories[index],
                            style: Theme.of(context).textTheme.titleMedium),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
