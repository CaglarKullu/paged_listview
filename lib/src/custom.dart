import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import '../paged_listview.dart';

class PagedListView extends StatefulWidget implements ListViewPagination {
  final List<Widget> widgetList;
  final int itemsPerPage;
  final PageController controller;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final double? height;
  final double? width;
  const PagedListView(
      {super.key,
      required this.widgetList,
      required this.itemsPerPage,
      required this.controller,
      this.mainAxisAlignment,
      this.crossAxisAlignment,
      this.height,
      this.width});

  @override
  State<PagedListView> createState() => _PagedListViewState();
}

class _PagedListViewState extends State<PagedListView> {
  List<Widget> pages = [];
  int _currentPage = 0;
  @override
  void initState() {
    buildPages(widget.widgetList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildPages(widget.widgetList);
  }

  Widget buildPages(List<Widget> widgetList) {
    pages.clear();
    List<List<Widget>> itemLists =
        widgetList.slices(widget.itemsPerPage).toList();
    for (var i = 0; i < itemLists.length; i++) {
      List<Widget> item = itemLists[i];
      Widget coloum = SingleChildScrollView(
        child: Column(
          mainAxisAlignment:
              widget.mainAxisAlignment ?? MainAxisAlignment.center,
          crossAxisAlignment:
              widget.crossAxisAlignment ?? CrossAxisAlignment.center,
          children: item,
        ),
      );
      pages.add(coloum);
    }
    return Expanded(
      child: PageView.builder(
        controller: widget.controller,
        itemCount: pages.length,
        itemBuilder: (BuildContext context, int index) {
          return pages[index % pages.length];
        },
        onPageChanged: (page) => setState(() {
          _currentPage = page;
        }),
      ),
    );
  }
}
