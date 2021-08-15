abstract class BaseNavigationMAnager {
  Future<void> navigationToPage(String path, {Object args});

  Future<void> naigationTopPageClear(String path, {Object args});

  void navigationPop();
}
