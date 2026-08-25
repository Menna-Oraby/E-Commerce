import 'package:e_commerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class MainErrorWidget extends StatelessWidget {
  final String messageError;
  final VoidCallback? onTryAgain;

  const MainErrorWidget({
    super.key,
    required this.messageError,
    this.onTryAgain,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(messageError, style: AppStyles.medium14tPrimaryDark),
        onTryAgain != null
            ? ElevatedButton(
                onPressed: onTryAgain,
                child: Text('Try Again', style: AppStyles.medium14tPrimaryDark),
              )
            : Container(),
      ],
    );
  }
}
