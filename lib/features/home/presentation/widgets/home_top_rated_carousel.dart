import 'package:eventra/features/home/domain/models/vendor.dart';
import 'package:eventra/features/home/presentation/widgets/home_carousel_indicator.dart';
import 'package:eventra/features/home/presentation/widgets/vendor_card_top_rated.dart';
import 'package:flutter/material.dart';

class HomeTopRatedCarousel extends StatefulWidget {
  const HomeTopRatedCarousel({required this.vendors, super.key});

  final List<Vendor> vendors;

  @override
  State<HomeTopRatedCarousel> createState() => _HomeTopRatedCarouselState();
}

class _HomeTopRatedCarouselState extends State<HomeTopRatedCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.vendors.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        SizedBox(
          height: 324,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: widget.vendors.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: VendorCardTopRated(vendor: widget.vendors[index]),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        HomeCarouselIndicator(
          activeIndex: _currentPage,
          count: widget.vendors.length,
        ),
      ],
    );
  }
}
