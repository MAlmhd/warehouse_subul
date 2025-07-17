import 'package:warehouse_subul/features/get_shipment_in_process/domain/entities/update_shipment_for_delivery_entity/update_shipment_for_delivery_entity.dart';

import 'data.dart';

class UpdateShipmentForDeleiveryModel extends UpdateShipmentForDeliveryEntity{
	bool? success;
	int? status;
	String? message2;
	Data? data;

	UpdateShipmentForDeleiveryModel({
		this.success, 
		this.status, 
		this.message2, 
		this.data, 
	}) : super(message: message2!);

	factory UpdateShipmentForDeleiveryModel.fromJson(Map<String, dynamic> json) {
		return UpdateShipmentForDeleiveryModel(
			success: json['success'] as bool?,
			status: json['status'] as int?,
			message2: json['message'] as String?,
			data: json['data'] == null
						? null
						: Data.fromJson(json['data'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toJson() => {
				'success': success,
				'status': status,
				'message': message2,
				'data': data?.toJson(),
			};
}
