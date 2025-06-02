import 'package:easy_localization/easy_localization.dart';
import 'package:fin_calc/src/core/core.dart';
import 'package:fin_calc/src/domain/domain.dart';
import 'package:share_plus/share_plus.dart';
import 'package:system_design_flutter/index.dart';

class ShareHelper {
  static void shareCompoundInterest({
    required CompoundInterestModel compoundInterest,
    required double totalAmount,
  }) {
    final message = '''
    💰 Principal Amount: ${SdCurrencyFormatHelper.formatCurrencyFromDouble(compoundInterest.principalAmount)}
    ➕ Monthly Contribution: ${SdCurrencyFormatHelper.formatCurrencyFromDouble(compoundInterest.monthlyContribution)}
    📈 Interest Rate: ${compoundInterest.rate}%
    ⏳ Time: ${compoundInterest.time} ${compoundInterest.timeUnit.name}
    🔁 Compound Frequency (per year): ${compoundInterest.frequency.value}

    📦 Final Amount: ${SdCurrencyFormatHelper.formatCurrencyFromDouble(totalAmount)}
    📅 Calculation Date: ${DateFormat('dd/MM/yyyy').format(DateTime.now())}
    ''';

    SharePlus.instance.share(
      ShareParams(title: '📊 Compound Interest Summary', text: message),
    );
  }

  static void shareSimpleInterest({
    required SimpleInterestModel simpleInterest,
    required double totalAmount,
  }) {
    final message = '''
  💰 Principal Amount: ${SdCurrencyFormatHelper.formatCurrencyFromDouble(simpleInterest.principalAmount)}
  📈 Interest Rate: ${simpleInterest.rate}%
  ⏳ Time: ${simpleInterest.time} ${simpleInterest.timeUnit.name}

  📦 Final Amount: ${SdCurrencyFormatHelper.formatCurrencyFromDouble(totalAmount)}
  📅 Calculation Date: ${DateFormat('dd/MM/yyyy').format(DateTime.now())}
  ''';

    SharePlus.instance.share(
      ShareParams(title: '📊 Simple Interest Summary', text: message),
    );
  }
}
