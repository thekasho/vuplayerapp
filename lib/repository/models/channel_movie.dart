class ChannelMovie {
  final String? num;
  final String? name;
  final String? streamType;
  final String? streamId;
  final String? streamIcon;
  final int? rating;
  final String? rating5based;
  final String? added;
  final String? isAdult;
  final String? categoryId;
  final String? containerExtension;
  final String? customSid;
  final String? directSource;

  ChannelMovie({
    this.num,
    this.name,
    this.streamType,
    this.streamId,
    this.streamIcon,
    this.rating,
    this.rating5based,
    this.added,
    this.isAdult,
    this.categoryId,
    this.containerExtension,
    this.customSid,
    this.directSource,
  });

  ChannelMovie.fromJson(Map<String, dynamic> json)
      : num = json['num'] == null ? null : json['num'].toString(),
        name = json['name'] as String?,
        streamType = json['stream_type'] as String?,
        streamId =
            json['stream_id'] == null ? null : json['stream_id'].toString(),
        streamIcon = json['stream_icon'] as String?,
        rating = json['rating'] as int?,
        rating5based = json['rating_5based'] == null
            ? null
            : json['rating_5based'].toString(),
        added = json['added'] as String?,
        isAdult = json['is_adult'] as String?,
        categoryId = json['category_id'] as String?,
        containerExtension = json['container_extension'] as String?,
        customSid = json['custom_sid'] as String?,
        directSource = json['direct_source'] as String?;

  Map<String, dynamic> toJson() => {
        'num': num,
        'name': name,
        'stream_type': streamType,
        'stream_id': streamId,
        'stream_icon': streamIcon,
        'rating': rating,
        'rating_5based': rating5based,
        'added': added,
        'is_adult': isAdult,
        'category_id': categoryId,
        'container_extension': containerExtension,
        'custom_sid': customSid,
        'direct_source': directSource
      };
}
