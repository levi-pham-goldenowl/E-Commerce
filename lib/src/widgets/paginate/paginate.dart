import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/widgets/snackbar/snackbar.dart';

class XPaginate<T> {
  final String? message;

  final List<T>? data;

  PageStatus status;
  int page;

  bool hasMore;

  bool get canNext => hasMore == true && isLoading == false;

  T? get lastDoc {
    if (data?.isNotEmpty == true) {
      return data!.last;
    }
    return null;
  }

  // hasMore - còn sản phẩm
  // canNext - có thể tải trang tiếp theo

  XPaginate(
      {this.message,
      this.hasMore = true,
      this.data,
      this.status = PageStatus.initial,
      this.page = 0});

  factory XPaginate.initial() {
    return XPaginate();
  }

  bool get isInitial => status == PageStatus.initial;

  bool get isLoading => status == PageStatus.loading;

  bool get isCompleted => status == PageStatus.success;

  bool get isError => status == PageStatus.error;

  XPaginate<T> loading() {
    if (canNext == true && status != PageStatus.initial) {
      return XPaginate(data: data, page: page, status: PageStatus.loading);
    } else {
      return XPaginate();
    }
  }

  XPaginate<T> result(XResult<List<T>> result) {
    hasMore = (result.data ?? []).isEmpty ? false : true;
    status = result.status;

    final List<T> items = [
      ...data ?? [],
      ...result.data ?? [],
    ];
    if (items.isNotEmpty && canNext == false) {
      XSnackBar.show(msg: 'End List');
    }
    if (canNext) {
      page++;
    }
    return XPaginate(
        status: status,
        message: result.error,
        data: items,
        page: page,
        hasMore: hasMore);
  }
}

enum PageStatus { initial, loading, error, success }
