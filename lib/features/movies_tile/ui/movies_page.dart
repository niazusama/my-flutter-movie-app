import 'package:flutter/material.dart';
import 'package:movie_app_ver2/features/movies_tile/widgets/movies_grid_create.dart';
import 'package:movie_app_ver2/features/movies_tile/widgets/my_pill_buttons.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // ! mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // This contains Watch now and Search Button
          Container(
            padding: const EdgeInsets.only(
                left: 12.0, top: 35, right: 12.0, bottom: 12.0),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Watch now
                Text(
                  "Watch Now",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                // Search Icon -> Search button in future
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                )
              ],
            ),
          ),

          /*
              
              Movie categories pill buttons
    
              */
          const MyPillButtons(),

          /* 
              
              Movies Grid View
        
              */

          // Adding the spacing
          const SizedBox(
            height: 16,
          ),

          const MoviesGridCreate(),

          // Spacing
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
