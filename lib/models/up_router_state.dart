class UpRouterState {
  final Map<String, String>? params;
  final Map<String, String>? queryParams;
  final Map<String, List<String>>? queryParametersAll;

  const UpRouterState({
    this.params,
    this.queryParams,
    this.queryParametersAll,
  });
}
