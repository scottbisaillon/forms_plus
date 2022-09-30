/// Enum representing the submission status of a form.
enum FormSubmissionStatus {
  /// The form has not yet been submitted.
  initial,

  /// The form is in the process of being submitted.
  inProgress,

  /// The form has been submitted successfully.
  success,

  /// The form submission failed.
  failure,

  /// The form submission has been canceled.
  canceled
}

/// Useful extensions on [FormSubmissionStatus]
extension FormSubmissionStatusX on FormSubmissionStatus {
  /// Indicates whether the form has not yet been submitted.
  bool get isInitial => this == FormSubmissionStatus.initial;

  /// Indicates whether the form is in the process of being submitted.
  bool get isInProgress => this == FormSubmissionStatus.inProgress;

  /// Indicates whether the form has been submitted successfully.
  bool get isSuccess => this == FormSubmissionStatus.success;

  /// Indicates whether the form submission failed.
  bool get isFailure => this == FormSubmissionStatus.failure;

  /// Indicates whether the form submission has been canceled.
  bool get isCanceled => this == FormSubmissionStatus.canceled;
}
