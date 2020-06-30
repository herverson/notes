import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes/domain/auth/i_auth_facade.dart';
import 'package:notes/domain/core/errors.dart';
import 'package:notes/injection.dart';

extension FirestoreX on Firestore {
  Future<DocumentReference> userDocument() async {
    final userOption = await getIt<IAuthFacade>().getSignedInUser();
    final user = userOption.getOrElse(() => throw NotAuthenticatedError());
    return Firestore.instance
        .collection('users')
        .document(user.id.getOrCrash());
  }
}

extension DocumentReferenceX on DocumentReference {
  CollectionReference get noteCollection => collection('notes');
}