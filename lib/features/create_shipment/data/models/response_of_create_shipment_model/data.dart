class Data {
	String? type;
	String? customerId;
	int? supplierId;
	String? supplierName;
	String? supplierNumber;
	String? declaredParcelsCount;
	String? notes;
	String? status;
	int? createdByUserId;
	String? trackingNumber;
	bool? isApproved;
	DateTime? updatedAt;
	DateTime? createdAt;
	int? id;

	Data({
		this.type, 
		this.customerId, 
		this.supplierId, 
		this.supplierName, 
		this.supplierNumber, 
		this.declaredParcelsCount, 
		this.notes, 
		this.status, 
		this.createdByUserId, 
		this.trackingNumber, 
		this.isApproved, 
		this.updatedAt, 
		this.createdAt, 
		this.id, 
	});

	factory Data.fromJson(Map<String, dynamic> json) => Data(
				type: json['type'] as String?,
				customerId: json['customer_id'] as String?,
				supplierId: json['supplier_id'] as int?,
				supplierName: json['supplier_name'] as String?,
				supplierNumber: json['supplier_number'] as String?,
				declaredParcelsCount: json['declared_parcels_count'] as String?,
				notes: json['notes'] as String?,
				status: json['status'] as String?,
				createdByUserId: json['created_by_user_id'] as int?,
				trackingNumber: json['tracking_number'] as String?,
				isApproved: json['is_approved'] as bool?,
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				id: json['id'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'type': type,
				'customer_id': customerId,
				'supplier_id': supplierId,
				'supplier_name': supplierName,
				'supplier_number': supplierNumber,
				'declared_parcels_count': declaredParcelsCount,
				'notes': notes,
				'status': status,
				'created_by_user_id': createdByUserId,
				'tracking_number': trackingNumber,
				'is_approved': isApproved,
				'updated_at': updatedAt?.toIso8601String(),
				'created_at': createdAt?.toIso8601String(),
				'id': id,
			};
}
