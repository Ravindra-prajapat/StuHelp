class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure(
      [this.message = "An Unknown erroroccured."]);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak -password':
        return const SignUpWithEmailAndPasswordFailure('please enter a strong password');
        case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure('Email is not valid or badly formatted');
        case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure('An account already exists for that email');
        case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure('Operation is not allowed. please contact support.');
        case 'User-disabled':
        return const SignUpWithEmailAndPasswordFailure('This user has been disalbed. Please contact support for help.');
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}
