class NotificationResponse {
  final bool? success;
  final Data? data;

  NotificationResponse({this.success, this.data});

  factory NotificationResponse.fromJson(Map<String, dynamic> json) {
    return NotificationResponse(
      success: json['success'] as bool?,
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
    );
  }
}

class Data {
  final List<NotificationItem>? notifications;
  final OptionsNotification? options;

  Data({this.notifications, this.options});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      notifications: json['notifications'] != null
          ? (json['notifications'] as List).map((notification) => NotificationItem.fromJson(notification)).toList()
          : null,
      options: json['options'] != null ? OptionsNotification.fromJson(json['options']) : null,
    );
  }
}

class NotificationItem {
  final String? id;
  final List<Target>? targets;
  final String? contentType;
  final String? message;
  final String? sender;
  final DateTime? date;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? version;

  NotificationItem({
    this.id,
    this.targets,
    this.contentType,
    this.message,
    this.sender,
    this.date,
    this.createdAt,
    this.updatedAt,
    this.version,
  });

  factory NotificationItem.fromJson(Map<String, dynamic> json) {
    return NotificationItem(
      id: json['_id'] as String?,
      targets: json['targets'] != null
          ? (json['targets'] as List).map((target) => Target.fromJson(target)).toList()
          : null,
      contentType: json['contentType'] as String?,
      message: json['message'] as String?,
      sender: json['sender'] as String?,
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      version: json['__v'] as int?,
    );
  }
}

class Target {
  final String? userId;
  final bool? read;

  Target({this.userId, this.read});

  factory Target.fromJson(Map<String, dynamic> json) {
    return Target(
      userId: json['userId'] as String?,
      read: json['read'] as bool?,
    );
  }
}

class OptionsNotification {
  final int? limit;
  final int? skip;
  final Sort? sort;
  final int? page;
  final int? count;

  OptionsNotification({this.limit, this.skip, this.sort, this.page, this.count});

  factory OptionsNotification.fromJson(Map<String, dynamic> json) {
    return OptionsNotification(
      limit: json['limit'] as int?,
      skip: json['skip'] as int?,
      sort: json['sort'] != null ? Sort.fromJson(json['sort']) : null,
      page: json['page'] as int?,
      count: json['count'] as int?,
    );
  }
}

class Sort {
  final String? createdAt;

  Sort({this.createdAt});

  factory Sort.fromJson(Map<String, dynamic> json) {
    return Sort(
      createdAt: json['createdAt'] as String?,
    );
  }
}
