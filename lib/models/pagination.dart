class Pagination {
  Pagination(this.pageIndex, this.pageSize);

  final int pageIndex;
  final int pageSize;

  Pagination.fromJson(Map<String, dynamic> json)
      : pageIndex = json['pageIndex'] as int,
        pageSize = json['pageSize'] as int;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'pageIndex': pageIndex,
    'pageSize': pageSize
  };
}