// https://api.bilibili.com/x/player/playurl
class PlayerPlayUrl {
  String? from;
  String? result;
  String? message;
  int? quality;
  String? format;
  int? timelength;
  String? acceptFormat;
  List<String>? acceptDescription;
  List<int>? acceptQuality;
  int? videoCodecid;
  String? seekParam;
  String? seekType;
  Dash? dash;
  List<SupportFormat>? supportFormats;
  String? highFormat;
  int? lastPlayTime;
  int? lastPlayCid;
  dynamic viewInfo;

  PlayerPlayUrl({
    this.from,
    this.result,
    this.message,
    this.quality,
    this.format,
    this.timelength,
    this.acceptFormat,
    this.acceptDescription,
    this.acceptQuality,
    this.videoCodecid,
    this.seekParam,
    this.seekType,
    this.dash,
    this.supportFormats,
    this.highFormat,
    this.lastPlayTime,
    this.lastPlayCid,
    this.viewInfo,
  });

  factory PlayerPlayUrl.fromJson(Map<String, dynamic> json) {
    return PlayerPlayUrl(
      from: json['from'],
      result: json['result'],
      message: json['message'],
      quality: json['quality'],
      format: json['format'],
      timelength: json['timelength'],
      acceptFormat: json['accept_format'],
      acceptDescription: List<String>.from(json['accept_description']),
      acceptQuality: List<int>.from(json['accept_quality']),
      videoCodecid: json['video_codecid'],
      seekParam: json['seek_param'],
      seekType: json['seek_type'],
      dash: json['dash'] != null ? Dash.fromJson(json['dash']) : null,
      supportFormats: json['support_formats'] != null
          ? (json['support_formats'] as List)
              .map((item) => SupportFormat.fromJson(item))
              .toList()
          : null,
      highFormat: json['high_format'],
      lastPlayTime: json['last_play_time'],
      lastPlayCid: json['last_play_cid'],
      viewInfo: json['view_info'],
    );
  }

  Map<String, dynamic> toJson() => {
        "from": from,
        "result": result,
        "message": message,
        "quality": quality,
        "format": format,
        "timelength": timelength,
        "acceptFormat": acceptFormat,
        "acceptDescription": acceptDescription,
        "acceptQuality": acceptQuality,
        "videoCodecid": videoCodecid,
        "seekParam": seekParam,
        "seekType": seekType,
        "dash": dash?.toJson(),
        "supportFormats":
            supportFormats?.map((item) => item.toJson()).toList(),
        "highFormat": highFormat,
        "lastPlayTime": lastPlayTime,
        "lastPlayCid": lastPlayCid,
        "viewInfo": viewInfo,
      };
}

class Dash {
  int? duration;
  double? minBufferTime;
  List<DashVideo>? video;
  List<DashAudio>? audio;
  Dolby? dolby;
  dynamic flac;

  Dash({
    this.duration,
    this.minBufferTime,
    this.video,
    this.audio,
    this.dolby,
    this.flac,
  });

  factory Dash.fromJson(Map<String, dynamic> json) {
    return Dash(
      duration: json['duration'],
      minBufferTime: json['minBufferTime']?.toDouble(),
      video: json['video'] != null
          ? (json['video'] as List)
              .map((item) => DashVideo.fromJson(item))
              .toList()
          : null,
      audio: json['audio'] != null
          ? (json['audio'] as List)
              .map((item) => DashAudio.fromJson(item))
              .toList()
          : null,
      dolby: json['dolby'] != null ? Dolby.fromJson(json['dolby']) : null,
      flac: json['flac'],
    );
  }

  Map<String, dynamic> toJson() => {
        "duration": duration,
        "minBufferTime": minBufferTime,
        "video": video?.map((item) => item.toJson()).toList(),
        "audio": audio?.map((item) => item.toJson()).toList(),
        "dolby": dolby?.toJson(),
        "flac": flac,
      };
}

class DashVideo {
  int? id;
  String? baseUrl;
  String? base_url;
  List<String>? backupUrl;
  List<String>? backup_url;
  int? bandwidth;
  String? mimeType;
  String? mime_type;
  String? codecs;
  int? width;
  int? height;
  String? frameRate;
  String? frame_rate;
  String? sar;
  int? startWithSap;
  int? start_with_sap;
  SegmentBase? segmentBase;
  SegmentBase? segment_base;
  int? codecid;

  DashVideo({
    this.id,
    this.baseUrl,
    this.base_url,
    this.backupUrl,
    this.backup_url,
    this.bandwidth,
    this.mimeType,
    this.mime_type,
    this.codecs,
    this.width,
    this.height,
    this.frameRate,
    this.frame_rate,
    this.sar,
    this.startWithSap,
    this.start_with_sap,
    this.segmentBase,
    this.segment_base,
    this.codecid,
  });

  factory DashVideo.fromJson(Map<String, dynamic> json) {
    return DashVideo(
      id: json['id'],
      baseUrl: json['baseUrl'],
      base_url: json['base_url'],
      backupUrl: List<String>.from(json['backupUrl']),
      backup_url: List<String>.from(json['backup_url']),
      bandwidth: json['bandwidth'],
      mimeType: json['mimeType'],
      mime_type: json['mime_type'],
      codecs: json['codecs'],
      width: json['width'],
      height: json['height'],
      frameRate: json['frameRate'],
      frame_rate: json['frame_rate'],
      sar: json['sar'],
      startWithSap: json['startWithSap'],
      start_with_sap: json['start_with_sap'],
      segmentBase: json['SegmentBase'] != null
          ? SegmentBase.fromJson(json['SegmentBase'])
          : null,
      segment_base: json['segment_base'] != null
          ? SegmentBase.fromJson(json['segment_base'])
          : null,
      codecid: json['codecid'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "baseUrl": baseUrl,
        "base_url": base_url,
        "backupUrl": backupUrl,
        "backup_url": backup_url,
        "bandwidth": bandwidth,
        "mimeType": mimeType,
        "mime_type": mime_type,
        "codecs": codecs,
        "width": width,
        "height": height,
        "frameRate": frameRate,
        "frame_rate": frame_rate,
        "sar": sar,
        "startWithSap": startWithSap,
        "start_with_sap": start_with_sap,
        "SegmentBase": segmentBase?.toJson(),
        "segment_base": segment_base?.toJson(),
        "codecid": codecid,
      };
}

class SegmentBase {
  String? initialization;
  String? indexRange;

  SegmentBase({
    this.initialization,
    this.indexRange,
  });

  factory SegmentBase.fromJson(Map<String, dynamic> json) {
    return SegmentBase(
      initialization: json['Initialization'],
      indexRange: json['indexRange'],
    );
  }

  Map<String, dynamic> toJson() => {
        "Initialization": initialization,
        "indexRange": indexRange,
      };
}

class DashAudio {
  int? id;
  String? baseUrl;
  String? base_url;
  List<String>? backupUrl;
  List<String>? backup_url;
  int? bandwidth;
  String? mimeType;
  String? mime_type;
  String? codecs;
  int? width;
  int? height;
  String? frameRate;
  String? frame_rate;
  String? sar;
  int? startWithSap;
  int? start_with_sap;
  SegmentBase? segmentBase;
  SegmentBase? segment_base;
  int? codecid;

  DashAudio({
    this.id,
    this.baseUrl,
    this.base_url,
    this.backupUrl,
    this.backup_url,
    this.bandwidth,
    this.mimeType,
    this.mime_type,
    this.codecs,
    this.width,
    this.height,
    this.frameRate,
    this.frame_rate,
    this.sar,
    this.startWithSap,
    this.start_with_sap,
    this.segmentBase,
    this.segment_base,
    this.codecid,
  });

  factory DashAudio.fromJson(Map<String, dynamic> json) {
    return DashAudio(
      id: json['id'],
      baseUrl: json['baseUrl'],
      base_url: json['base_url'],
      backupUrl: List<String>.from(json['backupUrl']),
      backup_url: List<String>.from(json['backup_url']),
      bandwidth: json['bandwidth'],
      mimeType: json['mimeType'],
      mime_type: json['mime_type'],
      codecs: json['codecs'],
      width: json['width'],
      height: json['height'],
      frameRate: json['frameRate'],
      frame_rate: json['frame_rate'],
      sar: json['sar'],
      startWithSap: json['startWithSap'],
      start_with_sap: json['start_with_sap'],
      segmentBase: json['SegmentBase'] != null
          ? SegmentBase.fromJson(json['SegmentBase'])
          : null,
      segment_base: json['segment_base'] != null
          ? SegmentBase.fromJson(json['segment_base'])
          : null,
      codecid: json['codecid'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "baseUrl": baseUrl,
        "base_url": base_url,
        "backupUrl": backupUrl,
        "backup_url": backup_url,
        "bandwidth": bandwidth,
        "mimeType": mimeType,
        "mime_type": mime_type,
        "codecs": codecs,
        "width": width,
        "height": height,
        "frameRate": frameRate,
        "frame_rate": frame_rate,
        "sar": sar,
        "startWithSap": startWithSap,
        "start_with_sap": start_with_sap,
        "SegmentBase": segmentBase?.toJson(),
        "segment_base": segment_base?.toJson(),
        "codecid": codecid,
      };
}

class Dolby {
  int? type;
  dynamic audio;

  Dolby({
    this.type,
    this.audio,
  });

  factory Dolby.fromJson(Map<String, dynamic> json) {
    return Dolby(
      type: json['type'],
      audio: json['audio'],
    );
  }

  Map<String, dynamic> toJson() => {
        "type": type,
        "audio": audio,
      };
}

class SupportFormat {
  int? quality;
  String? format;
  String? newDescription;
  String? displayDesc;
  String? superscript;
  List<String>? codecs;

  SupportFormat({
    this.quality,
    this.format,
    this.newDescription,
    this.displayDesc,
    this.superscript,
    this.codecs,
  });

  factory SupportFormat.fromJson(Map<String, dynamic> json) {
    return SupportFormat(
      quality: json['quality'],
      format: json['format'],
      newDescription: json['new_description'],
      displayDesc: json['display_desc'],
      superscript: json['superscript'],
      codecs: List<String>.from(json['codecs']),
    );
  }

  Map<String, dynamic> toJson() => {
        "quality": quality,
        "format": format,
        "new_description": newDescription,
        "display_desc": displayDesc,
        "superscript": superscript,
        "codecs": codecs,
      };
}
