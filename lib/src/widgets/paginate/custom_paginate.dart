import 'package:e_commerce/src/widgets/paginate/paginate.dart';
import 'package:e_commerce/src/widgets/paginate/widgets/empty_display.dart';
import 'package:e_commerce/src/widgets/paginate/widgets/empty_widget.dart';
import 'package:e_commerce/src/widgets/paginate/widgets/error_display.dart';
import 'package:e_commerce/src/widgets/paginate/widgets/init_loader.dart';
import 'package:e_commerce/src/widgets/paginate/widgets/load_more_widget.dart';
import 'package:flutter/material.dart';

class CustomPaginate extends StatefulWidget {
  final Widget? header;
  final Widget? footer;
  final Widget body;
  final Function() fetchFirstData;
  final Function() fetchNextData;

  final XPaginate paginate;
  const CustomPaginate({
    Key? key,
    this.header,
    required this.fetchFirstData,
    required this.fetchNextData,
    required this.paginate,
    this.footer,
    required this.body,
  }) : super(key: key);

  @override
  State<CustomPaginate> createState() => _CustomPaginateState();
}

class _CustomPaginateState extends State<CustomPaginate> {
  late ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    widget.fetchFirstData();
    controller.addListener(_scrollListener);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.paginate.isCompleted) {
      return NestedScrollView(
        controller: controller,
        body: RefreshIndicator(
          onRefresh: () async => widget.fetchFirstData(),
          child: CustomScrollView(
            slivers: [
              ((widget.paginate.data ?? []).isEmpty)
                  ? const EmptyDisplay()
                  : widget.body,
              widget.footer ?? const EmptyWidget(),
            ],
          ),
        ),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            [widget.header ?? const EmptyWidget()],
      );
    }
    if (widget.paginate.isLoading) {
      return NestedScrollView(
        controller: controller,
        body: RefreshIndicator(
          onRefresh: () async => widget.fetchFirstData(),
          child: CustomScrollView(
            slivers: [
              ((widget.paginate.data ?? []).isEmpty)
                  ? const EmptyDisplay()
                  : widget.body,
              const LoadMoreWidget(),
              widget.footer ?? const EmptyWidget(),
            ],
          ),
        ),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            [widget.header ?? const EmptyWidget()],
      );
    } else if (widget.paginate.isInitial) {
      return NestedScrollView(
        controller: controller,
        body: RefreshIndicator(
          onRefresh: () async => widget.fetchFirstData(),
          child: CustomScrollView(
            slivers: [
              const InitialLoader(),
              widget.footer ?? const EmptyWidget(),
            ],
          ),
        ),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            [widget.header ?? const EmptyWidget()],
      );
    } else {
      return ErrorDisplay(exception: Exception('Please try again later'));
    }
  }

  void _scrollListener() {
    if (controller.position.pixels == controller.position.maxScrollExtent) {
      widget.fetchNextData();
    }
  }
}
