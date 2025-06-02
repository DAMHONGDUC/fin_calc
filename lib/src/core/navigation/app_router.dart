import 'package:system_design_flutter/index.dart';

class AppRouter {
  // Home Route
  static final SdRouter HOME_ROOT = SdRouter(
    name: "home",
    path: "/home",
    fullPath: "/home",
  );

  // CompoundInterest
  static final SdRouter COMPOUND_INTEREST = SdRouter(
    name: "compound_interest",
    path: "/compound_interest",
    fullPath: "/home/compound_interest",
  );

  // SimpleInterest
  static final SdRouter SIMPLE_INTEREST = SdRouter(
    name: "simple_interest",
    path: "/simple_interest",
    fullPath: "/home/simple_interest",
  );

  // Installment
  static final SdRouter INSTALLMENT = SdRouter(
    name: "installment",
    path: "/installment",
    fullPath: "/home/installment",
  );

  // Setting Route
  static final SdRouter SETTING_ROOT = SdRouter(
    name: "setting",
    path: "/setting",
    fullPath: "/setting",
  );
}
