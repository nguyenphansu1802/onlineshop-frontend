import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/Screen/profile_screen/profile_bloc/profile_event.dart';
import 'package:online_shop/Screen/profile_screen/profile_bloc/profile_state.dart';

import '../../../Service/auth_service.dart';
import '../../../Service/user_service/user_service.dart';
import '../../../get_it.dart';
import '../../../models/User.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final _authRepository = getIt<IAuthService>();
  final _userRepository = getIt<IUserService>();
  // AuthRepository _authRepository = AppRepository.authRepository;
  // UserRepository _userRepository = AppRepository.userRepository;
  // StorageRepository _storageRepository = AppRepository.storageRepository;
  StreamSubscription? _profileStreamSub;
  UserModel? _loggedUser;

  ProfileBloc() : super(ProfileLoading());

  // @override
  // Stream<ProfileState> mapEventToState(event) async* {
  //   if (event is LoadProfile) {
  //     yield* _mapLoadProfileToState(event);
  //   } else if (event is UploadAvatar) {
  //     yield* _mapUploadAvatarToState(event);
  //   } else if (event is AddressListChanged) {
  //     yield* _mapAddressListChangedToState(event);
  //   } else if (event is ProfileUpdated) {
  //     yield* _mapProfileUpdatedToState(event);
  //   }
  // }
  //
  // /// Load Profile event => states
  // Stream<ProfileState> _mapLoadProfileToState(LoadProfile event) async* {
  //   try {
  //     _profileStreamSub?.cancel();
  //     _profileStreamSub = _userRepository
  //         .loggedUserStream(_authRepository.loggedFirebaseUser)
  //         .listen((updatedUser) => add(ProfileUpdated(updatedUser)));
  //   } catch (e) {
  //     yield ProfileLoadFailure(e.toString());
  //   }
  // }
  //
  // /// Upload Avatar event => states
  // Stream<ProfileState> _mapUploadAvatarToState(UploadAvatar event) async* {
  //   try {
  //     // Get image url from firebase storage
  //     String imageUrl = await _storageRepository.uploadImageFile(
  //       "users/profile/${_loggedUser!.id}",
  //       event.imageFile,
  //     );
  //     // Clone logged user with updated avatar
  //     var updatedUser = _loggedUser!.cloneWith(avatar: imageUrl);
  //     // Update user's avatar
  //     await _userRepository.updateUserData(updatedUser);
  //   } catch (e) {}
  // }
  //
  // /// Address List Changed event => states
  // Stream<ProfileState> _mapAddressListChangedToState(
  //     AddressListChanged event) async* {
  //   try {
  //     // Get delivery address from event
  //     var deliveryAddress = event.deliveryAddress;
  //     // Get current addresses
  //     var addresses = List<DeliveryAddressModel>.from(_loggedUser!.addresses);
  //     if (deliveryAddress.isDefault) {
  //       addresses =
  //           addresses.map((item) => item.cloneWith(isDefault: false)).toList();
  //     }
  //     // Check method
  //     switch (event.method) {
  //       case ListMethod.ADD:
  //         // If current addresses is empty, so the first delivery address is always default
  //         if (addresses.isEmpty) {
  //           deliveryAddress = deliveryAddress.cloneWith(isDefault: true);
  //         }
  //         addresses.add(deliveryAddress);
  //         break;
  //       case ListMethod.DELETE:
  //         addresses.remove(deliveryAddress);
  //         break;
  //       case ListMethod.UPDATE:
  //         addresses = addresses.map((item) {
  //           return item.id == deliveryAddress.id ? deliveryAddress : item;
  //         }).toList();
  //
  //         break;
  //       default:
  //     }
  //     // Clone logged user with updated addresses
  //     var updatedUser = _loggedUser!.cloneWith(addresses: addresses);
  //     // Update user's addresses
  //     await _userRepository.updateUserData(updatedUser);
  //   } catch (e) {}
  // }
  //
  // /// Profile Updated event => states
  // Stream<ProfileState> _mapProfileUpdatedToState(ProfileUpdated event) async* {
  //   try {
  //     _loggedUser = event.updatedUser;
  //     yield ProfileLoaded(event.updatedUser);
  //   } catch (e) {
  //     yield ProfileLoadFailure(e.toString());
  //   }
  // }

  @override
  Future<void> close() {
    _profileStreamSub?.cancel();
    _loggedUser = null;
    return super.close();
  }
}

enum ListMethod { ADD, DELETE, UPDATE }
