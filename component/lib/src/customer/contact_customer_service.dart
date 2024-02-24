import 'package:flutter/material.dart';
import 'package:theme/colors.dart';

class ContactCustomerService extends StatelessWidget {
  ContactCustomerService({
    Key? key,
    required this.prefixText,
    required this.serviceTap,
    this.jumpToAgentServicePage = false, //默认跳转会员客服
    required this.exclusiveCustomerService,
    this.prefixStyle =
        const TextStyle(fontSize: 12, color: AppColors.subtitleColor),
    this.exclusiveCustomerServiceStyle =
        const TextStyle(fontSize: 12, color: AppColors.primaryColor),
    this.padding = const EdgeInsets.symmetric(vertical: 15),
  }) : super(key: key);
  final String prefixText;
  final String exclusiveCustomerService;
  final GestureTapCallback serviceTap;
  final bool jumpToAgentServicePage;

  final TextStyle prefixStyle;
  final TextStyle exclusiveCustomerServiceStyle;
  final EdgeInsets padding;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: serviceTap,
            child: Padding(
              padding: padding,
              child: Text.rich(
                TextSpan(text: prefixText, style: prefixStyle, children: [
                  TextSpan(
                    text: exclusiveCustomerService,
                    style: exclusiveCustomerServiceStyle,
                  )
                ]),
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
