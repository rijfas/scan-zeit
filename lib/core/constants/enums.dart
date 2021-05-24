enum AccountType {
  customer,
  merchant,
}
enum AuthError {
  UserNotFound,
  PasswordNotValid,
  UserAlreadyExists,
  InvalidEmail,
  TooManyRequests,
  UserDisabled,
  EmailAlreadInUse,
  NetworkError,
}
