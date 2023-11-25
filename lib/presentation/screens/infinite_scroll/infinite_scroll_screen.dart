

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {

  static const String name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  bool isMounted = true;
  bool isLoading = false;
  List<int> imagesIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final ScrollController scrollController = ScrollController();

  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll(
      [1, 2, 3, 4, 5].map((value) => lastId + value)
    );
  }

  void loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2)); // simulate loading delay

    isLoading = false;
    addFiveImages();
    if (!isMounted) return;
    setState(() {});

    moveScrollToBottom();

  }

  Future<void> onRefresh() async {
    isLoading = true;

    await Future.delayed(const Duration(seconds: 3));
    if (!isMounted) return;

    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    isLoading = false;
    addFiveImages();

    setState(() {});
  }

  void moveScrollToBottom() {

    if (scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
      scrollController.position.pixels + 120,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn
    );

  }

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels <= scrollController.position.maxScrollExtent - 500) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    isMounted = false;
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,

      // appBar: AppBar(
      //   title: const Text('Infinite Scroll Screen')
      // ),

      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 10,
          strokeWidth: 2,
          child: _CustomListView(scrollController: scrollController, imagesIds: imagesIds),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: isLoading
          ? SpinPerfect(
            infinite: true,
            child: const Icon(Icons.refresh_rounded),
          )
          : FadeIn(child: const Icon(Icons.arrow_back)),
      ),
    );
  }
}

class _CustomListView extends StatelessWidget {

  const _CustomListView({
    required this.scrollController,
    required this.imagesIds,
  });

  final ScrollController scrollController;
  final List<int> imagesIds;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      itemCount: imagesIds.length,
      itemBuilder: (context, index) {
        final imageId = imagesIds[index];
        return FadeInImage(
          placeholder: const AssetImage('assets/images/jar-loading.gif'),
          image: NetworkImage('https://picsum.photos/id/$imageId/500/300'),
          width: double.infinity,
          height: 300,
          fit: BoxFit.cover,
        );
      }
    );
  }
}
