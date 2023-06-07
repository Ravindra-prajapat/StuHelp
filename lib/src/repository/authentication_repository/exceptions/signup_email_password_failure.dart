class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure(
      [this.message = "An Unknown erroroccured."]);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak -password':
        return SignUpWithEmailAndPasswordFailure('please enter a strong password');
        case 'invalid-email':
        return SignUpWithEmailAndPasswordFailure('Email is not valid or badly formatted');
        case 'email-already-in-use':
        return SignUpWithEmailAndPasswordFailure('An account already exists for that email');
        case 'operation-not-allowed':
        return SignUpWithEmailAndPasswordFailure('Operation is not allowed. please contact support.');
        case 'User-disabled':
        return SignUpWithEmailAndPasswordFailure('This user has been disalbed. Please contact support for help.');
      default:
        return SignUpWithEmailAndPasswordFailure();
    }
  }
}
