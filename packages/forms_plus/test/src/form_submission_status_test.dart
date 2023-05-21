import 'package:flutter_test/flutter_test.dart';
import 'package:forms_plus/src/form_submission_status.dart';

void main() {
  group('FormSubmissionStatusX', () {
    test('isInitial returns true', () {
      expect(FormSubmissionStatus.initial.isInitial, isTrue);
    });

    test('isInProgress returns true', () {
      expect(FormSubmissionStatus.inProgress.isInProgress, isTrue);
    });

    test('isFailure returns true', () {
      expect(FormSubmissionStatus.failure.isFailure, isTrue);
    });

    test('isSuccess returns true', () {
      expect(FormSubmissionStatus.success.isSuccess, isTrue);
    });

    test('isCanceled returns true', () {
      expect(FormSubmissionStatus.canceled.isCanceled, isTrue);
    });
  });
}
