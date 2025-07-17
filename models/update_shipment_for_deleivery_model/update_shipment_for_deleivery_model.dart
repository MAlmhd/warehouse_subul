import 'data.dart';

class UpdateShipmentForDeleiveryModel {
	bool? success;
	int? status;
	String? message;
	Data? data;

	UpdateShipmentForDeleiveryModel({
		this.success, 
		this.status, 
		this.message, 
		this.data, 
	});

	factory UpdateShipmentForDeleiveryModel.fromJson(Map<String, dynamic> json) {
		return UpdateShipmentForDeleiveryModel(
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
