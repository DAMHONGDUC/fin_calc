# === Flutter-specific rules ===
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# === App package ===
-keep class com.example.fin_calc.** { *; }

# === JNI / native used classes ===
-keep class com.example.fin_calc.** { *; }

# === Retrofit, Gson ===
-keepattributes Signature
-keepattributes *Annotation*

-keep class retrofit2.** { *; }
-dontwarn retrofit2.**

-keep class com.google.gson.** { *; }
-dontwarn com.google.gson.**

# === Fix: Flutter Deferred Components & Play Core classes ===
-keep class io.flutter.embedding.engine.deferredcomponents.** { *; }
-keep class io.flutter.embedding.android.FlutterPlayStoreSplitApplication { *; }

-keep class com.google.android.play.core.splitcompat.** { *; }
-keep class com.google.android.play.core.splitinstall.** { *; }
-keep class com.google.android.play.core.tasks.** { *; }

-dontwarn com.google.android.play.core.**
