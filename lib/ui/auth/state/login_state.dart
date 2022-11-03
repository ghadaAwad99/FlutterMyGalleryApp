class LoginState {
  final bool isLoading;
  final String? username;

  LoginState({
    this.isLoading = false,
    this.username
  });

  LoginState copyWith({
    bool? isLoading,
    String? username
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      username: username ??  this.username
    );
  }
}
