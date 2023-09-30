import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2023/ui/sign_in/sign_in_page.dart';
import 'package:flutter_hackathon_2023/ui/welcome/welcome_page.dart';
import 'package:go_router/go_router.dart';

// アプリ起動時のパス
const _initialLocation = '/';

final goRouter = GoRouter(
  // アプリが起動した時
  initialLocation: _initialLocation,
  // パスと画面の組み合わせ
  routes: [
    GoRoute(
      path: _initialLocation,
      pageBuilder: (context, state) {
        return const MaterialPage(
          child: WelcomePage(),
        );
      },
    ),
    // ex) アカウント画面
    GoRoute(
      name: SignInPage.routePath,
      path: SignInPage.routePath,
      pageBuilder: (context, state) {
        final param = state.extra as SignInPageParams;

        return MaterialPage(
          key: state.pageKey,
          child: SignInPage(
            param: param,
          ),
        );
      },
    ),
  ],
  // 遷移ページがないなどのエラーが発生した時に、このページに行く
  errorPageBuilder: (context, state) => MaterialPage(
    key: state.pageKey,
    child: Scaffold(
      body: Center(
        child: Text(state.error.toString()),
      ),
    ),
  ),
);
