# bitcoin_demo_app

A demo app made in Flutter. This app fetches real time bitcoin prices, charts historical price data, and simulates a bitcoin buying experience.

## Demo Video

[Watch the demo video](https://drive.google.com/file/d/1Jo_9bdwC9_RxW-C2hCEl7PreYeCVEiFO/view?usp=sharing)

- note that the video is compressed so it does not show the quote coundown indicator ticking down every 1 second.

## Project Tree

```
bitcoin_demo_app
├─ .github
│  └─ workflows
│     └─ dart.yml
├─ .gitignore
├─ .metadata
├─ README.md
├─ analysis_options.yaml
├─ assets
│  └─ bitcoins.json
├─ devtools_options.yaml
├─ lib
│  ├─ app
│  │  ├─ app.bottomsheets.dart
│  │  ├─ app.dart
│  │  ├─ app.dialogs.dart
│  │  ├─ app.locator.dart
│  │  └─ app.router.dart
│  ├─ main.dart
│  ├─ models
│  │  ├─ btc_historical_price_model.dart
│  │  └─ btc_price_model.dart
│  ├─ services
│  │  ├─ api_service.dart
│  │  └─ shared_data_service.dart
│  └─ ui
│     ├─ bottom_sheets
│     │  └─ notice
│     │     ├─ notice_sheet.dart
│     │     └─ notice_sheet_model.dart
│     ├─ common
│     │  ├─ app_colors.dart
│     │  └─ ui_helpers.dart
│     ├─ dialogs
│     │  ├─ error
│     │  │  ├─ error_dialog.dart
│     │  │  └─ error_dialog_model.dart
│     │  └─ info_alert
│     │     ├─ info_alert_dialog.dart
│     │     └─ info_alert_dialog_model.dart
│     └─ views
│        ├─ bitcoin
│        │  ├─ bitcoin_price_view.dart
│        │  └─ bitcoin_price_viewmodel.dart
│        ├─ buy
│        │  ├─ buy_view.dart
│        │  ├─ buy_view.form.dart
│        │  ├─ buy_viewmodel.dart
│        │  ├─ custom_text_field.dart
│        │  └─ validators.dart
│        ├─ confirmation
│        │  ├─ confirmation_view.dart
│        │  └─ confirmation_viewmodel.dart
│        ├─ home
│        │  ├─ home_view.dart
│        │  └─ home_viewmodel.dart
│        ├─ partials
│        │  ├─ bitcoin_chart
│        │  │  ├─ models
│        │  │  │  ├─ bitcoin_chart_viewmodel.dart
│        │  │  │  ├─ bitcoin_line_chart_viewmodel.dart
│        │  │  │  ├─ loading_indicator_viewmodel.dart
│        │  │  │  └─ time_period_buttons_viewmodel.dart
│        │  │  └─ views
│        │  │     ├─ bitcoin_chart_view.dart
│        │  │     ├─ bitcoin_line_chart_view.dart
│        │  │     ├─ loading_indicator_view.dart
│        │  │     └─ time_period_buttons_view.dart
│        │  ├─ bitcoin_price
│        │  │  ├─ bitcoin_price_view.dart
│        │  │  └─ bitcoin_price_viewmodel.dart
│        │  ├─ quote_countdown
│        │  │  ├─ quote_countdown_view.dart
│        │  │  └─ quote_countdown_viewmodel.dart
│        │  └─ usd_bitcoin_amount
│        │     ├─ usd_bitcoin_amount_view.dart
│        │     └─ usd_bitcoin_amount_viewmodel.dart
│        ├─ preview
│        │  ├─ preview_view.dart
│        │  └─ preview_viewmodel.dart
│        └─ startup
│           ├─ startup_view.dart
│           └─ startup_viewmodel.dart
├─ pubspec.lock
├─ pubspec.yaml
└─ test
   ├─ helpers
   │  ├─ test_helpers.dart
   │  └─ test_helpers.mocks.dart
   ├─ services
   │  ├─ api_service_test.dart
   │  ├─ api_service_test.mocks.dart
   │  └─ shared_data_service_test.dart
   └─ viewmodel_tests
      ├─ buy_viewmodel_test.dart
      ├─ confirmation_viewmodel_test.dart
      ├─ home_viewmodel_test.dart
      ├─ preview_viewmodel_test.dart
      └─ startup_viewmodel_test.dart
```



