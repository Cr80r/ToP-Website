import 'package:flutter/material.dart';import 'package:flutter_riverpod/flutter_riverpod.dart';import 'core/routing/app_router.dart';import 'core/theme/app_theme.dart';
void main()=>runApp(const ProviderScope(child:ZayloApp()));
class ZayloApp extends ConsumerWidget{const ZayloApp({super.key});@override Widget build(BuildContext context,WidgetRef ref)=>MaterialApp.router(title:'Zaylo',theme:AppTheme.light(),darkTheme:AppTheme.dark(),themeMode:ThemeMode.system,routerConfig:ref.watch(routerProvider),debugShowCheckedModeBanner:false);}
