import 'package:get_it/get_it.dart';
import 'package:online_shop/api/http_client.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screen/bloc/page_bloc.dart';
import 'Service/auth_service.dart';
import 'Service/auth_service_impl.dart';


final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton<Client>(() => Client());

  final sharedPref = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPref);

  getIt.registerLazySingleton<HttpClient>(
          () => HttpClient(client: getIt(), sharedPreferences: getIt()));

  getIt.registerLazySingleton<IAuthService>(
          () => AuthServiceImpl(httpClient: getIt(), sharedPreferences: getIt()));

  getIt.registerFactory<PageBloc>(() => PageBloc());
}
