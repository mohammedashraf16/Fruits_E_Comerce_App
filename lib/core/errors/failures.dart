abstract class Failures{
  final String errorMessage;

  Failures(this.errorMessage);
}
class ServerFailure extends Failures{
  ServerFailure(super.errorMessage);
}