
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {

  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo({
    required this.title,
    required this.caption,
    required this.imageUrl
  });

}

final slides = <SlideInfo>[
  SlideInfo(title: 'Busca la comida', caption: 'Ut est officia Lorem est.', imageUrl: 'assets/images/1.png'),
  SlideInfo(title: 'Entrega rápida', caption: 'Mollit mollit non cupidatat amet voluptate occaecat exercitation aute anim.', imageUrl: 'assets/images/2.png'),
  SlideInfo(title: 'Disfruta la comida', caption: 'Ex incididunt non proident sit cupidatat aute aute eiusmod duis.', imageUrl: 'assets/images/3.png'),
];

class AppTutorialScreen extends StatelessWidget {

  static const String name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(title: const Text('App Tutorial Screen')),
      body: _AppTutorialView(),
    );
  }
}

class _AppTutorialView extends StatefulWidget {
  const _AppTutorialView();

  @override
  State<_AppTutorialView> createState() => _AppTutorialViewState();
}

class _AppTutorialViewState extends State<_AppTutorialView> {

  final pageViewController = PageController();
  double currentPage = 0;
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      currentPage = pageViewController.page ?? 0;
      if (!endReached && page >= slides.length - 1.5) {
        endReached = true;
        // setState(() {});
      } else if (endReached && page < slides.length - 1.5) {
        endReached = false;
        // setState(() {});
      }

      setState(() {});
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: pageViewController,
          physics: const BouncingScrollPhysics(),
          children: [

            ...slides.map((slide) => _Slide(title: slide.title, caption: slide.caption, imageUrl: slide.imageUrl)).toList(),

          ],
        ),

        Positioned(
          right: 20,
          top: 50,
          child: FadeIn(
            child: TextButton(
              child: const Text('Skip'),
              onPressed: () => context.pop(),
            ),
          ),
        ),

        // if (!endReached)
          Positioned(
            bottom: 20,
            child: _Dots( amount: slides.length, currentPage: currentPage )
          ),

        if (endReached)
          Positioned(
            bottom: 30,
            right: 30,
            child: FadeInRight(
              from: 15,
              delay: const Duration(milliseconds: 400),
              child: FilledButton(
                onPressed: () => context.pop(),
                child: const Text('Start'),
              ),
            ),
          )
      ],
    );
  }
}

class _Slide extends StatelessWidget {

  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageUrl),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {

  final int amount;
  final double currentPage;

  const _Dots({
    required this.amount,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(amount, (index) => _Dot(index: index, currentPage: currentPage))
      ),
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;
  final double currentPage;

  const _Dot({
    Key? key,
    required this.index, required this.currentPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final color = Theme.of(context).colorScheme;
    const double secondaryBullet = 10;
    const double primaryBullet = 20;
    final Color secondaryColor = color.secondary;
    final Color primaryColor = color.primary;

    final pageViewIndex = currentPage;
    final activeBullet = (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5);
    final bulletSize = activeBullet ? primaryBullet : secondaryBullet;

    return AnimatedContainer(
      width: bulletSize,
      height: bulletSize,
      duration: const Duration( milliseconds: 200 ),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: activeBullet ? primaryColor : secondaryColor,
        shape: BoxShape.circle
      ),
    );
  }
}