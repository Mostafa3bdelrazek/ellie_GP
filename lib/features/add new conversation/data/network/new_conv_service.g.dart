// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_conv_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _NewConvServiceClient implements NewConvServiceClient {
  _NewConvServiceClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://interactive-elearning-avatar-backend.onrender.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<NewConvResponse> addConv(newConvRequest) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(newConvRequest.toJson());
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<NewConvResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/conversation',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = NewConvResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
