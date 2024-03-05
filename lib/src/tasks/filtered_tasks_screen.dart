import 'package:flutter/material.dart';

class Filter {
  final String name;

  Filter(this.name);
}

final List<Filter> filters = [
  Filter('Filter 1'),
  Filter('Filter 2'),
  Filter('Filter 3'),
  Filter('Filter 4'),
  Filter('Filter 5'),
  Filter('Filter 6'),
  Filter('Filter 7'),
];

class MyTasksScreen extends StatelessWidget {
  const MyTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: _SliverAppBarDelegate(
              filters: filters,
              minHeight: 40.0,
              maxHeight: 80.0,
            ),
            pinned: true,
          ),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final List<Filter> filters;
  final double minHeight;
  final double maxHeight;

  _SliverAppBarDelegate({
    required this.filters,
    required this.minHeight,
    required this.maxHeight,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.center,
            child: TextButton(
              child: Text(filters[index].name),
              onPressed: () {},
            ),
          );
        },
      ),
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
