import 'package:bookly/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/material.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics:
          const NeverScrollableScrollPhysics(), // no scroll in this listView
      padding: EdgeInsets
          .zero, // because ListView make padding by default so remove it
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: BookListViewItem(),
        );
      },
    );
  }
}
// shrinkWrap: true,  take height of children mean build all items once to specify height
// remove shrinkWrap because we use SliverFillRemaining instead of SliverToBoxAdapter