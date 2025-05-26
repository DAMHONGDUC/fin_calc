## Generate code

```
flutter packages pub run build_runner build

fvm flutter pub run build_runner watch --delete-conflicting-outputs
```

## Git Submodules set up

- rm the .gitmodules
- run this to add submodules: git submodule add https://github.com/DAMHONGDUC/system_design_flutter packages/system_design_flutter
- if you want to rm the submodules: git rm -rf packages && rm -rf .git/modules/packages

## Splash screen

figma: https://www.figma.com/design/hWmEJB0c0qBGVomuFCtnz7/Untitled?node-id=11-19&t=wndZjxlS4Rszf6lC-0
guide: https://www.youtube.com/watch?v=U1BErwaE3zo at 6.15
frame size 1152, icon size 512
add new image => add icon pubspec.yaml => `dart run flutter_native_splash:create`

## App name

`dart run rename_app:main all="FinCal"`

## launcher icon

frame size 512
`dart run flutter_launcher_icons`

## Build

`flutter build apk --release --obfuscate --split-debug-info=build/app/outputs/symbols`

## Color config

- fin_calc code => call AppTheme or call AppColors => call SdColors
