# ENG
Demo project of iOS app (include Pods + Fastlane) is intergated with Github Action (CI/CD)

# RUS
Пробный проект интеграции iOS приложения (Pods + Fastlane) с Github Action

### Requirements / Требования

+ macOS: ≥ 10.15.2
+ Ruby: ≥ 2.6.0
+ Xcode: ≥ 11.5

### Local launch / Локальный запуск
The actual launch is as simple as: / Просто выполни в терминале:
``` 
bundle install
bundle exec fastlane ios install_pods
bundle exec fastlane ios build_simulator_app
bundle exec fastlane ios test_single_mode
```
