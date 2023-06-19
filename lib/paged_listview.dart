library paged_listview;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:paged_listview/src/custom.dart';

class ListViewPagination extends Widget {
  final List<Widget> widgetList;
  final int itemsPerPage;
  final PageController controller;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final double? height;
  final double? width;
  const ListViewPagination(this.widgetList, this.itemsPerPage, this.controller,
      this.mainAxisAlignment, this.crossAxisAlignment, this.height, this.width,
      {super.key});

  factory ListViewPagination.custom(
      {required PageController controller,
      required int itemsPerPage,
      required final List<Widget> widgetList,
      final MainAxisAlignment? mainAxisAlignment,
      final CrossAxisAlignment? crossAxisAlignment,
      final double? height,
      final double? width}) {
    return PagedListView(
      controller: controller,
      itemsPerPage: itemsPerPage,
      widgetList: widgetList,
    );
  }

  @override
  Element createElement() {
    // TODO: implement createElement
    throw UnimplementedError();
  }
}
