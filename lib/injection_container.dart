import 'package:get_it/get_it.dart';
import 'package:room_control/features/auth/data/datasource/auth_remote_data_source.dart';
import 'package:room_control/features/auth/data/repositories/auth_repository.dart';
import 'package:room_control/features/auth/domain/repositories/auth_repository.dart';
import 'package:room_control/features/auth/domain/usecases/login.dart';
import 'package:room_control/features/auth/domain/usecases/sign_up.dart';
import 'package:room_control/features/auth/presentation/providers/login/login_provider.dart';
import 'package:room_control/features/auth/presentation/providers/sign_up/sign_up_provider.dart';
import 'package:room_control/features/room_control/presentation/providers/room_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Core

  //! External

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////
  // 1 AUTHENTICATION
  // Bloc
  sl.registerFactory<LoginProvider>(
    () => LoginProvider(performLogin: sl()),
  );
  sl.registerFactory<SignUpProvider>(
    () => SignUpProvider(performSignUp: sl()),
  );
  // Use cases
  sl.registerLazySingleton(() => PerformLogin(authRepository: sl()));
  sl.registerLazySingleton(() => PerformSignUp(authRepository: sl()));
  // Repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl()),
  );
  // Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );

  ///////////////////////////////////////////////////////////////////////////////////////////////////////////
  // 2 ROOM CONTROL
  // Provider
  sl.registerFactory<RoomProvider>(
    () => RoomProvider(),
  );
}
