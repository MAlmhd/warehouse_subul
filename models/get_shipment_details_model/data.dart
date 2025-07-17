class Data {
	String? shipmentDate;
	String? customerName;
	String? customerPhone;
	dynamic receiptNumber;
	String? shipmentCode;
	int? parcelsCount;
	int? totalWeight;
	String? notes;

	Data({
		this.shipmentDate, 
		this.customerName, 
		this.customerPhone, 
		this.receiptNumber, 
		this.shipmentCode, 
		this.parcelsCount, 
		this.totalWeight, 
		this.notes, 
	});

	factory Data.fromJson(Map<String, dynamic> json) => Data(
				shipmentDate: json['shipment_date'] as String?,
				customerName: json['customer_name'] as String?,
				customerPhone: json['customer_phone'] as String?,
				receiptNumber: json['receipt_number'] as dynamic,
				shipmentCode: json['shipment_code'] as String?,
				parcelsCount: json['parcels_count'] as int?,
				totalWeight: json['total_weight'] as int?,
				notes: json['notes'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'shipment_date': shipmentDate,
				'customer_name': customerName,
				'customer_phone': customerPhone,
				'receipt_number': receiptNumber,
				'shipment_code': shipmentCode,
				'parcels_count': parcelsCount,
				'total_weight': totalWeight,
				'notes': notes,
			};
}
