enum RoutePath {
  splash('/splash'),
  main('/main'),
  auth('/auth'),
  changePassword('/change-password'),
  detail('/detail'),
  search('/search');

  final String value;
  const RoutePath(this.value);
}
