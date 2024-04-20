// https://api.bilibili.com/x/web-interface/view
class WebInterfaceView {
  String? bvid;
  int? aid;
  int? videos;
  int? tid;
  String? tname;
  int? copyright;
  String? pic;
  String? title;
  int? pubdate;
  int? ctime;
  String? desc;
  int? state;
  int? duration;
  String? dynamics;
  int? cid;
  String? premiere;
  int? teenageMode;
  bool? isChargeableSeason;
  bool? isStory;
  bool? isUpowerExclusive;
  bool? isUpowerPlay;
  bool? isUpowerPreview;
  int? enableVt;
  String? vtDisplay;
  bool? noCache;
  bool? isSeasonDisplay;
  String? likeIcon;
  bool? needJumpBv;
  bool? disableShowUpInfo;
  int? isStoryPlay;

  List<DescV2>? descV2;
  Rights? rights;
  Owner? owner;
  Stat? stat;
  ArgueInfo? argueInfo;
  Dimension? dimension;
  List<PageInfo>? pages;
  Subtitle? subtitle;
  List<Staff>? staff;
  UserGarb? userGarb;
  Map<String, dynamic>? honorReply;

  WebInterfaceView({
    this.bvid,
    this.aid,
    this.videos,
    this.tid,
    this.tname,
    this.copyright,
    this.pic,
    this.title,
    this.pubdate,
    this.ctime,
    this.desc,
    this.state,
    this.duration,
    this.dynamics,
    this.cid,
    this.premiere,
    this.teenageMode,
    this.isChargeableSeason,
    this.isStory,
    this.isUpowerExclusive,
    this.isUpowerPlay,
    this.isUpowerPreview,
    this.enableVt,
    this.vtDisplay,
    this.noCache,
    this.isSeasonDisplay,
    this.likeIcon,
    this.needJumpBv,
    this.disableShowUpInfo,
    this.isStoryPlay,
    this.descV2,
    this.rights,
    this.owner,
    this.stat,
    this.argueInfo,
    this.dimension,
    this.pages,
    this.subtitle,
    this.staff,
    this.userGarb,
    this.honorReply,
  });

  factory WebInterfaceView.fromJson(Map<String, dynamic> json) {
    return WebInterfaceView(
      bvid: json['bvid'],
      aid: json['aid'],
      videos: json['videos'],
      tid: json['tid'],
      tname: json['tname'],
      copyright: json['copyright'],
      pic: json['pic'],
      title: json['title'],
      pubdate: json['pubdate'],
      ctime: json['ctime'],
      desc: json['desc'],
      state: json['state'],
      duration: json['duration'],
      dynamics: json['dynamic'],
      cid: json['cid'],
      premiere: json['premiere'],
      teenageMode: json['teenage_mode'],
      isChargeableSeason: json['is_chargeable_season'],
      isStory: json['is_story'],
      isUpowerExclusive: json['is_upower_exclusive'],
      isUpowerPlay: json['is_upower_play'],
      isUpowerPreview: json['is_upower_preview'],
      enableVt: json['enable_vt'],
      vtDisplay: json['vt_display'],
      noCache: json['no_cache'],
      isSeasonDisplay: json['is_season_display'],
      likeIcon: json['like_icon'],
      needJumpBv: json['need_jump_bv'],
      disableShowUpInfo: json['disable_show_up_info'],
      isStoryPlay: json['is_story_play'],
      descV2: json['desc_v2'] != null
          ? (json['desc_v2'] as List)
              .map((item) => DescV2.fromJson(item))
              .toList()
          : null,
      rights: json['rights'] != null ? Rights.fromJson(json['rights']) : null,
      owner: json['owner'] != null ? Owner.fromJson(json['owner']) : null,
      stat: json['stat'] != null ? Stat.fromJson(json['stat']) : null,
      argueInfo: json['argue_info'] != null
          ? ArgueInfo.fromJson(json['argue_info'])
          : null,
      dimension: json['dimension'] != null
          ? Dimension.fromJson(json['dimension'])
          : null,
      pages: json['pages'] != null
          ? (json['pages'] as List)
              .map((item) => PageInfo.fromJson(item))
              .toList()
          : null,
      subtitle:
          json['subtitle'] != null ? Subtitle.fromJson(json['subtitle']) : null,
      staff: json['staff'] != null
          ? (json['staff'] as List).map((item) => Staff.fromJson(item)).toList()
          : null,
      userGarb: json['user_garb'] != null
          ? UserGarb.fromJson(json['user_garb'])
          : null,
      honorReply: json['honor_reply'],
    );
  }

  Map<String, dynamic> toJson() => {
        "bvid": bvid,
        "aid": aid,
        "videos": videos,
        "tid": tid,
        "tname": tname,
        "copyright": copyright,
        "pic": pic,
        "title": title,
        "pubdate": pubdate,
        "ctime": ctime,
        "desc": desc,
        "state": state,
        "duration": duration,
        "dynamics": dynamics,
        "cid": cid,
        "premiere": premiere,
        "teenageMode": teenageMode,
        "isChargeableSeason": isChargeableSeason,
        "isStory": isStory,
        "isUpowerExclusive": isUpowerExclusive,
        "isUpowerPlay": isUpowerPlay,
        "isUpowerPreview": isUpowerPreview,
        "enableVt": enableVt,
        "vtDisplay": vtDisplay,
        "noCache": noCache,
        "isSeasonDisplay": isSeasonDisplay,
        "likeIcon": likeIcon,
        "needJumpBv": needJumpBv,
        "disableShowUpInfo": disableShowUpInfo,
        "isStoryPlay": isStoryPlay,
        "descV2": descV2,
        "rights": rights?.toJson(),
        "owner": owner?.toJson(),
        "stat": stat?.toJson(),
        "argueInfo": argueInfo?.toJson(),
        "dimension": dimension?.toJson(),
        "pages": pages,
        "subtitle": subtitle?.toJson(),
        "staff": staff,
        "userGarb": userGarb?.toJson(),
        "honorReply": honorReply,
      };
}

class DescV2 {
  String? rawText;
  int? type;
  int? bizId;

  DescV2({
    this.rawText,
    this.type,
    this.bizId,
  });

  factory DescV2.fromJson(Map<String, dynamic> json) {
    return DescV2(
      rawText: json['raw_text'],
      type: json['type'],
      bizId: json['biz_id'],
    );
  }

  Map<String, dynamic> toJson() => {
        "rawText": rawText,
        "type": type,
        "bizId": bizId,
      };
}

class Rights {
  int? bp;
  int? elec;
  int? download;
  int? movie;
  int? pay;
  int? hd5;
  int? noReprint;
  int? autoplay;
  int? ugcPay;
  int? isCooperation;
  int? ugcPayPreview;
  int? noBackground;
  int? cleanMode;
  int? isSteinGate;
  int? is360;
  int? noShare;
  int? arcPay;
  int? freeWatch;

  Rights({
    this.bp,
    this.elec,
    this.download,
    this.movie,
    this.pay,
    this.hd5,
    this.noReprint,
    this.autoplay,
    this.ugcPay,
    this.isCooperation,
    this.ugcPayPreview,
    this.noBackground,
    this.cleanMode,
    this.isSteinGate,
    this.is360,
    this.noShare,
    this.arcPay,
    this.freeWatch,
  });

  factory Rights.fromJson(Map<String, dynamic> json) {
    return Rights(
      bp: json['bp'],
      elec: json['elec'],
      download: json['download'],
      movie: json['movie'],
      pay: json['pay'],
      hd5: json['hd5'],
      noReprint: json['no_reprint'],
      autoplay: json['autoplay'],
      ugcPay: json['ugc_pay'],
      isCooperation: json['is_cooperation'],
      ugcPayPreview: json['ugc_pay_preview'],
      noBackground: json['no_background'],
      cleanMode: json['clean_mode'],
      isSteinGate: json['is_stein_gate'],
      is360: json['is_360'],
      noShare: json['no_share'],
      arcPay: json['arc_pay'],
      freeWatch: json['free_watch'],
    );
  }

  Map<String, dynamic> toJson() => {
        "bp": bp,
        "elec": elec,
        "download": download,
        "movie": movie,
        "pay": pay,
        "hd5": hd5,
        "noReprint": noReprint,
        "autoplay": autoplay,
        "ugcPay": ugcPay,
        "isCooperation": isCooperation,
        "ugcPayPreview": ugcPayPreview,
        "noBackground": noBackground,
        "cleanMode": cleanMode,
        "isSteinGate": isSteinGate,
        "is360": is360,
        "noShare": noShare,
        "arcPay": arcPay,
        "freeWatch": freeWatch,
      };
}

class Owner {
  int? mid;
  String? name;
  String? face;

  Owner({
    this.mid,
    this.name,
    this.face,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      mid: json['mid'],
      name: json['name'],
      face: json['face'],
    );
  }

  Map<String, dynamic> toJson() => {
        "mid": mid,
        "name": name,
        "face": face,
      };
}

class Stat {
  int? aid;
  int? view;
  int? danmaku;
  int? reply;
  int? favorite;
  int? coin;
  int? share;
  int? nowRank;
  int? hisRank;
  int? like;
  int? dislike;
  String? evaluation;
  int? vt;

  Stat({
    this.aid,
    this.view,
    this.danmaku,
    this.reply,
    this.favorite,
    this.coin,
    this.share,
    this.nowRank,
    this.hisRank,
    this.like,
    this.dislike,
    this.evaluation,
    this.vt,
  });

  factory Stat.fromJson(Map<String, dynamic> json) {
    return Stat(
      aid: json['aid'],
      view: json['view'],
      danmaku: json['danmaku'],
      reply: json['reply'],
      favorite: json['favorite'],
      coin: json['coin'],
      share: json['share'],
      nowRank: json['now_rank'],
      hisRank: json['his_rank'],
      like: json['like'],
      dislike: json['dislike'],
      evaluation: json['evaluation'],
      vt: json['vt'],
    );
  }

  Map<String, dynamic> toJson() => {
        "aid": aid,
        "view": view,
        "danmaku": danmaku,
        "reply": reply,
        "favorite": favorite,
        "coin": coin,
        "share": share,
        "nowRank": nowRank,
        "hisRank": hisRank,
        "like": like,
        "dislike": dislike,
        "evaluation": evaluation,
        "vt": vt,
      };
}

class ArgueInfo {
  String? argueMsg;
  int? argueType;
  String? argueLink;

  ArgueInfo({
    this.argueMsg,
    this.argueType,
    this.argueLink,
  });

  factory ArgueInfo.fromJson(Map<String, dynamic> json) {
    return ArgueInfo(
      argueMsg: json['argue_msg'],
      argueType: json['argue_type'],
      argueLink: json['argue_link'],
    );
  }

  Map<String, dynamic> toJson() => {
        "argueMsg": argueMsg,
        "argueType": argueType,
        "argueLink": argueLink,
      };
}

class Dimension {
  int? width;
  int? height;
  int? rotate;

  Dimension({
    this.width,
    this.height,
    this.rotate,
  });

  factory Dimension.fromJson(Map<String, dynamic> json) {
    return Dimension(
      width: json['width'],
      height: json['height'],
      rotate: json['rotate'],
    );
  }

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "rotate": rotate,
      };
}

class PageInfo {
  int? cid;
  int? page;
  String? from;
  String? part;
  int? duration;
  String? vid;
  String? weblink;
  Dimension? dimension;
  String? firstFrame;

  PageInfo({
    this.cid,
    this.page,
    this.from,
    this.part,
    this.duration,
    this.vid,
    this.weblink,
    this.dimension,
    this.firstFrame,
  });

  factory PageInfo.fromJson(Map<String, dynamic> json) {
    return PageInfo(
      cid: json['cid'],
      page: json['page'],
      from: json['from'],
      part: json['part'],
      duration: json['duration'],
      vid: json['vid'],
      weblink: json['weblink'],
      dimension: json['dimension'] != null
          ? Dimension.fromJson(json['dimension'])
          : null,
      firstFrame: json['first_frame'],
    );
  }

  Map<String, dynamic> toJson() => {
        "cid": cid,
        "page": page,
        "from": from,
        "part": part,
        "duration": duration,
        "vid": vid,
        "weblink": weblink,
        "dimension": dimension?.toJson(),
        "firstFrame": firstFrame,
      };
}

class UserGarb {
  String? urlImageAniCut;

  UserGarb({
    this.urlImageAniCut,
  });

  factory UserGarb.fromJson(Map<String, dynamic> json) {
    return UserGarb(
      urlImageAniCut: json['url_image_ani_cut'],
    );
  }

  Map<String, dynamic> toJson() => {
        "urlImageAniCut": urlImageAniCut,
      };
}

class Subtitle {
  bool? allowSubmit;
  List<SubtitleItem>? list;

  Subtitle({
    this.allowSubmit,
    this.list,
  });

  factory Subtitle.fromJson(Map<String, dynamic> json) {
    return Subtitle(
      allowSubmit: json['allow_submit'],
      list: json['list'] != null
          ? (json['list'] as List)
              .map((item) => SubtitleItem.fromJson(item))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "allowSubmit": allowSubmit,
        "list": list?.map((item) => item.toJson()).toList(),
      };
}

class SubtitleItem {
  int? id;
  String? lan;
  String? lanDoc;
  bool? isLock;
  String? subtitleUrl;
  int? type;
  String? idStr;
  int? aiType;
  int? aiStatus;
  Author? author;

  SubtitleItem({
    this.id,
    this.lan,
    this.lanDoc,
    this.isLock,
    this.subtitleUrl,
    this.type,
    this.idStr,
    this.aiType,
    this.aiStatus,
    this.author,
  });

  factory SubtitleItem.fromJson(Map<String, dynamic> json) {
    return SubtitleItem(
      id: json['id'],
      lan: json['lan'],
      lanDoc: json['lan_doc'],
      isLock: json['is_lock'],
      subtitleUrl: json['subtitle_url'],
      type: json['type'],
      idStr: json['id_str'],
      aiType: json['ai_type'],
      aiStatus: json['ai_status'],
      author: json['author'] != null ? Author.fromJson(json['author']) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "lan": lan,
        "lanDoc": lanDoc,
        "isLock": isLock,
        "subtitleUrl": subtitleUrl,
        "type": type,
        "idStr": idStr,
        "aiType": aiType,
        "aiStatus": aiStatus,
        "author": author?.toJson(),
      };
}

class Author {
  int? mid;
  String? name;
  String? sex;
  String? face;
  String? sign;
  int? rank;
  int? birthday;
  int? isFakeAccount;
  int? isDeleted;
  int? inRegAudit;
  int? isSeniorMember;

  Author({
    this.mid,
    this.name,
    this.sex,
    this.face,
    this.sign,
    this.rank,
    this.birthday,
    this.isFakeAccount,
    this.isDeleted,
    this.inRegAudit,
    this.isSeniorMember,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      mid: json['mid'],
      name: json['name'],
      sex: json['sex'],
      face: json['face'],
      sign: json['sign'],
      rank: json['rank'],
      birthday: json['birthday'],
      isFakeAccount: json['is_fake_account'],
      isDeleted: json['is_deleted'],
      inRegAudit: json['in_reg_audit'],
      isSeniorMember: json['is_senior_member'],
    );
  }

  Map<String, dynamic> toJson() => {
        "mid": mid,
        "name": name,
        "sex": sex,
        "face": face,
        "sign": sign,
        "rank": rank,
        "birthday": birthday,
        "isFakeAccount": isFakeAccount,
        "isDeleted": isDeleted,
        "inRegAudit": inRegAudit,
        "isSeniorMember": isSeniorMember,
      };
}

class Staff {
  int? mid;
  String? title;
  String? name;
  String? face;
  Vip? vip;
  Official? official;
  int? follower;
  int? labelStyle;

  Staff({
    this.mid,
    this.title,
    this.name,
    this.face,
    this.vip,
    this.official,
    this.follower,
    this.labelStyle,
  });

  factory Staff.fromJson(Map<String, dynamic> json) {
    return Staff(
      mid: json['mid'],
      title: json['title'],
      name: json['name'],
      face: json['face'],
      vip: json['vip'] != null ? Vip.fromJson(json['vip']) : null,
      official:
          json['official'] != null ? Official.fromJson(json['official']) : null,
      follower: json['follower'],
      labelStyle: json['label_style'],
    );
  }

  Map<String, dynamic> toJson() => {
        "mid": mid,
        "title": title,
        "name": name,
        "face": face,
        "vip": vip?.toJson(),
        "official": official?.toJson(),
        "follower": follower,
        "labelStyle": labelStyle,
      };
}

class Vip {
  int? type;
  int? status;
  int? dueDate;
  int? vipPayType;
  int? themeType;
  Label? label;
  int? avatarSubscript;
  String? nicknameColor;
  int? role;
  String? avatarSubscriptUrl;
  int? tvVipStatus;
  int? tvVipPayType;
  int? tvDueDate;
  AvatarIcon? avatarIcon;

  Vip({
    this.type,
    this.status,
    this.dueDate,
    this.vipPayType,
    this.themeType,
    this.label,
    this.avatarSubscript,
    this.nicknameColor,
    this.role,
    this.avatarSubscriptUrl,
    this.tvVipStatus,
    this.tvVipPayType,
    this.tvDueDate,
    this.avatarIcon,
  });

  factory Vip.fromJson(Map<String, dynamic> json) {
    return Vip(
      type: json['type'],
      status: json['status'],
      dueDate: json['due_date'],
      vipPayType: json['vip_pay_type'],
      themeType: json['theme_type'],
      label: json['label'] != null ? Label.fromJson(json['label']) : null,
      avatarSubscript: json['avatar_subscript'],
      nicknameColor: json['nickname_color'],
      role: json['role'],
      avatarSubscriptUrl: json['avatar_subscript_url'],
      tvVipStatus: json['tv_vip_status'],
      tvVipPayType: json['tv_vip_pay_type'],
      tvDueDate: json['tv_due_date'],
      avatarIcon: json['avatar_icon'] != null
          ? AvatarIcon.fromJson(json['avatar_icon'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "type": type,
        "status": status,
        "dueDate": dueDate,
        "vipPayType": vipPayType,
        "themeType": themeType,
        "label": label?.toJson(),
        "avatarSubscript": avatarSubscript,
        "nicknameColor": nicknameColor,
        "role": role,
        "avatarSubscriptUrl": avatarSubscriptUrl,
        "tvVipStatus": tvVipStatus,
        "tvVipPayType": tvVipPayType,
        "tvDueDate": tvDueDate,
        "avatarIcon": avatarIcon?.toJson(),
      };
}

class Label {
  String? path;
  String? text;
  String? labelTheme;
  String? textColor;
  int? bgStyle;
  String? bgColor;
  String? borderColor;
  bool? useImgLabel;
  String? imgLabelUriHans;
  String? imgLabelUriHant;
  String? imgLabelUriHansStatic;
  String? imgLabelUriHantStatic;

  Label({
    this.path,
    this.text,
    this.labelTheme,
    this.textColor,
    this.bgStyle,
    this.bgColor,
    this.borderColor,
    this.useImgLabel,
    this.imgLabelUriHans,
    this.imgLabelUriHant,
    this.imgLabelUriHansStatic,
    this.imgLabelUriHantStatic,
  });

  factory Label.fromJson(Map<String, dynamic> json) {
    return Label(
      path: json['path'],
      text: json['text'],
      labelTheme: json['label_theme'],
      textColor: json['text_color'],
      bgStyle: json['bg_style'],
      bgColor: json['bg_color'],
      borderColor: json['border_color'],
      useImgLabel: json['use_img_label'],
      imgLabelUriHans: json['img_label_uri_hans'],
      imgLabelUriHant: json['img_label_uri_hant'],
      imgLabelUriHansStatic: json['img_label_uri_hans_static'],
      imgLabelUriHantStatic: json['img_label_uri_hant_static'],
    );
  }

  Map<String, dynamic> toJson() => {
        "path": path,
        "text": text,
        "labelTheme": labelTheme,
        "textColor": textColor,
        "bgStyle": bgStyle,
        "bgColor": bgColor,
        "borderColor": borderColor,
        "useImgLabel": useImgLabel,
        "imgLabelUriHans": imgLabelUriHans,
        "imgLabelUriHant": imgLabelUriHant,
        "imgLabelUriHansStatic": imgLabelUriHansStatic,
        "imgLabelUriHantStatic": imgLabelUriHantStatic,
      };
}

class AvatarIcon {
  int? iconType;
  Map<String, dynamic>? iconResource;

  AvatarIcon({
    this.iconType,
    this.iconResource,
  });

  factory AvatarIcon.fromJson(Map<String, dynamic> json) {
    return AvatarIcon(
      iconType: json['icon_type'],
      iconResource: json['icon_resource'],
    );
  }

  Map<String, dynamic> toJson() => {
        "iconType": iconType,
        "iconResource": iconResource,
      };
}

class Official {
  int? role;
  String? title;
  String? desc;
  int? type;

  Official({
    this.role,
    this.title,
    this.desc,
    this.type,
  });

  factory Official.fromJson(Map<String, dynamic> json) {
    return Official(
      role: json['role'],
      title: json['title'],
      desc: json['desc'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() => {
        "role": role,
        "title": title,
        "desc": desc,
        "type": type,
      };
}
