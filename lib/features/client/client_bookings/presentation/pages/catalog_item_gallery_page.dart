import 'package:eventra/shared/widgets/eventra_buttons/eventra_nav_button.dart';
import 'package:flutter/material.dart';

class CatalogItemGalleryPage extends StatefulWidget {
  const CatalogItemGalleryPage({
    required this.images,
    required this.initialIndex,
    required this.title,
    super.key,
  });

  final List<String> images;
  final int initialIndex;
  final String title;

  @override
  State<CatalogItemGalleryPage> createState() => _CatalogItemGalleryPageState();
}

class _CatalogItemGalleryPageState extends State<CatalogItemGalleryPage> {
  late final PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _goToPrevious() async {
    await _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _goToNext() async {
    await _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isFirst = _currentIndex == 0;
    final isLast = _currentIndex == widget.images.length - 1;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.images.length,
            onPageChanged: (index) => setState(() => _currentIndex = index),
            itemBuilder: (context, index) {
              return Image.asset(
                widget.images[index],
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
                errorBuilder: (_, _, _) => ColoredBox(
                  color: colorScheme.primaryContainer,
                  child: Icon(
                    Icons.image_not_supported_outlined,
                    color: colorScheme.primary,
                    size: 48,
                  ),
                ),
              );
            },
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  EventraNavButton.blurGlassVersion(
                    isNext: false,
                    hasBorder: false,
                    onTap: () => Navigator.of(context).maybePop(),
                  ),
                  Expanded(
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 44),
                ],
              ),
            ),
          ),
          Positioned(
            left: 16,
            top: 0,
            bottom: 0,
            child: Center(
              child: AnimatedOpacity(
                opacity: isFirst ? 0.3 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: EventraNavButton.clearType(
                  isNext: false,
                  onTap: isFirst ? null : _goToPrevious,
                ),
              ),
            ),
          ),
          Positioned(
            right: 16,
            top: 0,
            bottom: 0,
            child: Center(
              child: AnimatedOpacity(
                opacity: isLast ? 0.3 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: isLast
                    ? const EventraNavButton.clearType(
                        isNext: true,
                        onTap: null,
                      )
                    : EventraNavButton.regular(
                        isNext: true,
                        hasBorder: false,
                        onTap: _goToNext,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
