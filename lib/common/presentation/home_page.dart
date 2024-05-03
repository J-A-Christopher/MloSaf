import 'package:flutter/material.dart';
import 'package:mlosafi/common/utils/intro_slides_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _pages = [
    {
      'assetImagePath': 'assets/frame1.png',
      'titleText': 'All your favorites',
      'description':
          'Get all your loved foods in one place;\n just place the order and we will do the rest.',
    },
    {
      'assetImagePath': 'assets/frame2.png',
      'titleText': 'Order from chosen chef',
      'description':
          'Get one of the best dishes from\n our highly skilled chefs and enjoy your meal.',
    },
    {
      'assetImagePath': 'assets/frame3.png',
      'titleText': 'Free delivery offers',
      'description':
          'Quick transport activities between our hotel and your destination so signUp and enjoy once more ',
    },
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToLastPage() {
    _controller.animateToPage(
      _pages.length - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _navigateToNextPage(int currentPage) {
    if (currentPage == _pages.length - 1) {
      // Navigate to login or signup route
      // Replace this with your actual navigation logic
      print('Navigate to login or signup route');
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final sizeObject = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemCount: _pages.length,
              itemBuilder: (context, index) {
                final page = _pages[index];
                return Column(
                  children: [
                    IntroSlidesComponent(
                      assetImagePath: page['assetImagePath'],
                      titleText: page['titleText'],
                      description: page['description'],
                    ),
                    SizedBox(
                      height: sizeObject.height * 0.08,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _pages.length,
                          (index) => Container(
                            width: 8.0,
                            height: 8.0,
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentPage == index
                                  ? Theme.of(context)
                                      .colorScheme
                                      .primaryContainer
                                  : Colors.grey.withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: sizeObject.width * 0.7,
                      height: sizeObject.height * 0.05,
                      child: ElevatedButton(
                        onPressed: () => _navigateToNextPage(index),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('NEXT'),
                      ),
                    ),
                    SizedBox(
                      height: sizeObject.height * 0.05,
                    ),
                    if (index != _pages.length - 1)
                      TextButton(
                          onPressed: _navigateToLastPage,
                          child: const Text('Skip'))
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
