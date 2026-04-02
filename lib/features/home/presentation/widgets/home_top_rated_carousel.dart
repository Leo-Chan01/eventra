import 'package:eventra/features/home/domain/models/vendor.dart';
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
    if (widget.vendors.isEmpty) return const SizedBox.shrink();

    return Column(
      children: [
        SizedBox(
          height: 330,
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
        const SizedBox(height: 16),
        _CarouselIndicator(
          activeIndex: _currentPage,
          count: widget.vendors.length,
        ),
      ],
    );
  }
}

class _CarouselIndicator extends StatelessWidget {
  const _CarouselIndicator({
    required this.activeIndex,
    required this.count,
  });

  final int activeIndex;
  final int count;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: activeIndex == index ? 24 : 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: activeIndex == index
                ? const Color(0xFFFF5722) // Using the orange from design
                : colorScheme.outline.withValues(alpha: 0.2),
          ),
        ),
      ),
    );
  }
}
