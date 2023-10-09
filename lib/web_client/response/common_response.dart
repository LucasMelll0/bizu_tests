abstract class CommonResponse<T> {

  String message;
  CommonResponseMetadata<T> metadata;

  CommonResponse({required this.message, required this.metadata});

}
class CommonResponseMetadata<T> {

    CommonResponseMetadata({required this.data});

    final T data;
}