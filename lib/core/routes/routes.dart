import 'package:ecommerce_app/core/app_cubit/change_category_cubit/change_catergory_cubit.dart';
import 'package:ecommerce_app/core/app_cubit/layout/cubit/layout_cubit.dart';
import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/features/auth/data/repo/auth_repo.dart';
import 'package:ecommerce_app/features/auth/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:ecommerce_app/features/auth/login/presentation/views/forget_password_view.dart';
import 'package:ecommerce_app/features/auth/login/presentation/views/login_view.dart';
import 'package:ecommerce_app/features/auth/sign_up/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:ecommerce_app/features/auth/sign_up/presentation/views/otp_verfication_view.dart';
import 'package:ecommerce_app/features/auth/sign_up/presentation/views/sign_up_view.dart';
import 'package:ecommerce_app/features/cart/presentation/views/cart_view.dart';
import 'package:ecommerce_app/features/favorites/presentation/views/favorites_view.dart';
import 'package:ecommerce_app/features/home/data/models/furniture_model.dart';
import 'package:ecommerce_app/features/home/data/repos/home_repo.dart';
import 'package:ecommerce_app/features/home/presentation/manager/fetch_home_data_cubit/fetch_home_data_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/views/home_view.dart';
import 'package:ecommerce_app/features/home/presentation/views/product_details_view.dart';
import 'package:ecommerce_app/features/nav_bar/nav_bar.dart';
import 'package:ecommerce_app/features/place_order/presentation/views/place_order_view.dart';
import 'package:ecommerce_app/features/profile/presentation/views/my_orders_view.dart';
import 'package:ecommerce_app/features/profile/presentation/views/profile_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

// GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/', // Set the initial screen

    routes: [
      ShellRoute(
        // navigatorKey: shellNavigatorKey,
        builder: (context, state, child) {
          return BlocProvider(
            create: (context) => LayoutCubit(),
            child: NavBar(child: child),
          );
        },
        routes: [
          GoRoute(
            path: Routes.homeView,
            name: Routes.homeView,
            builder: (context, state) => MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => ChangeCatergoryCubit(),
                ),
                BlocProvider(
                  create: (context) => FetchHomeDataCubit(
                    getIt.get<HomeRepo>(),
                  )..fetchHomeData(),
                ),
              ],
              child: const HomeView(),
            ),
          ),
          GoRoute(
            path: Routes.cartView,
            name: Routes.cartView,
            builder: (context, state) => const CartView(),
          ),
          GoRoute(
            path: Routes.favoritesView,
            name: Routes.favoritesView,
            builder: (context, state) => const FavoritesView(),
          ),
          GoRoute(
            path: Routes.profileView,
            name: Routes.profileView,
            builder: (context, state) => const ProfileView(),
          ),
        ],
      ),
      GoRoute(
        path: '/',
        name: Routes.loginView,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(getIt.get<AuthRepo>()),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: Routes.signUpView,
        name: Routes.signUpView,
        builder: (context, state) => BlocProvider(
          create: (context) => SignupCubit(getIt.get<AuthRepo>()),
          child: const SignUpView(),
        ),
      ),
      GoRoute(
        path: Routes.otpVerificationView,
        name: Routes.otpVerificationView,
        builder: (context, state) {
          final extra =
              state.extra as Map<String, dynamic>?; // Retrieve extra data
          final bool fromForgotPassword = extra?['fromForgotPassword'] ?? false;

          return OTPVerificationView(fromForgetPassword: fromForgotPassword);
        },
      ),
      GoRoute(
        path: Routes.forgetPasswordView,
        name: Routes.forgetPasswordView,
        builder: (context, state) => const ForgetPasswordView(),
      ),
      GoRoute(
        path: Routes.productDetailsView,
        name: Routes.productDetailsView,
        builder: (context, state) {
          return const ProductDetailsView();
        },
      ),
      GoRoute(
        path: Routes.myOrdersView,
        name: Routes.myOrdersView,
        builder: (context, state) => const MyOrdersView(),
      ),
      GoRoute(
        path: Routes.placeOrderView,
        name: Routes.placeOrderView,
        builder: (context, state) => const PlaceOrderView(),
      ),
    ],
  );
}

class Routes {
  static const String splashView = "/";
  static const String onBoardingView = "/onBoardingView";
  static const String loginView = '/loginView';
  static const String signUpView = '/signUpView';
  static const String forgetPasswordView = '/forgetPasswordView';
  static const String otpVerificationView = '/otpVerificationView';
  static const String homeView = '/homeView';
  static const String productDetailsView = '/productDetailsView';
  static const String profileView = '/profileView';
  static const String cartView = '/cartView';
  static const String favoritesView = '/favoritesView';
  static const String myOrdersView = '/myOrdersView';
  static const String placeOrderView = '/placeOrderView';
}
