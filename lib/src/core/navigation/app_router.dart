class CustomRouter {
  CustomRouter({
    required this.name,
    required this.path,
    required this.fullPaths,
  });

  final String path;
  final String name;
  final String fullPaths;
}

class AppRouter {
  // Home Route
  static final CustomRouter HOME_ROOT = CustomRouter(
    name: "home",
    path: "/home",
    fullPaths: "/home",
  );

  // CompoundInterest
  static final CustomRouter COMPOUND_INTEREST = CustomRouter(
    name: "compound_interest",
    path: "/compound_interest",
    fullPaths: "/home/compound_interest",
  );

  // SimpleInterest
  static final CustomRouter SIMPLE_INTEREST = CustomRouter(
    name: "simple_interest",
    path: "/simple_interest",
    fullPaths: "/home/simple_interest",
  );

  // Installment
  static final CustomRouter INSTALLMENT = CustomRouter(
    name: "installment",
    path: "/installment",
    fullPaths: "/home/installment",
  );

  // Setting Route
  static final CustomRouter SETTING_ROOT = CustomRouter(
    name: "setting",
    path: "/setting",
    fullPaths: "/setting",
  );
}
