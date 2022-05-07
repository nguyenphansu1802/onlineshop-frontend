import 'dart:io';

import 'package:equatable/equatable.dart';

import '../../../models/User.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// Load profile of logged firebase user in firestore
class LoadProfile extends ProfileEvent {}

/// Upload user avatar
class UploadAvatar extends ProfileEvent {
  final File imageFile;

  UploadAvatar(this.imageFile);

  List<Object> get props => [imageFile];
}

/// Delivery addresses changed
// class AddressListChanged extends ProfileEvent {
//   final DeliveryAddressModel deliveryAddress;
//   final ListMethod method;
//
//   AddressListChanged({required this.deliveryAddress, required this.method});
//
//   List<Object> get props => [deliveryAddress, method];
// }

/// Profile was updated
class ProfileUpdated extends ProfileEvent {
  final UserModel updatedUser;

  ProfileUpdated(this.updatedUser);

  List<Object> get props => [updatedUser];
}
