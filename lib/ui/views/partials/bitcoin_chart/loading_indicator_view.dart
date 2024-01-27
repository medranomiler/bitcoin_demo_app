import 'package:bitcoin_demo_app/ui/common/ui_helpers.dart';
import 'package:bitcoin_demo_app/ui/views/partials/bitcoin_chart/loading_indicator_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class LoadingIndicatorView extends StackedView<LoadingIndicatorViewModel> {
  const LoadingIndicatorView({super.key});

  @override
  Widget builder(BuildContext context, LoadingIndicatorViewModel viewModel, Widget? child) {
    return const  Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Loading ...', style: TextStyle(fontSize: 16)),
        horizontalSpaceSmall,
        SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(
            color: Colors.black,
            strokeWidth: 6,
          ),
        )
      ],
    );
  }
  
    @override
  LoadingIndicatorViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoadingIndicatorViewModel();
}
