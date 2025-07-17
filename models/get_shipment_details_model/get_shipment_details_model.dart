import 'data.dart';

class GetShipmentDetailsModel {
	bool? success;
	int? status;
	String? message;
	Data? data;

	GetShipmentDetailsModel({
		this.success, 
		this.status, 
		this.message, 
		this.data, 
	});

	factory GetShipmentDetailsModel.fromJson(Map<String, dynamic> json) {
		return GetShipmentDetailsModel(
			success: json['success'] as bool?,
			status: json['status'] as int?,
			message: json['message'] as String?,
			data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'success': success,
				'status': status,
				'message': message,
				'data': data?.toJson(),
			};
}
