class UserDetail {
	int level;
	int listenSongs;
	UserPoint userPoint;
	bool mobileSign;
	bool pcSign;
	Profile profile;
	bool peopleCanSeeMyPlayRecord;
	List<Bindings> bindings;
	bool adValid;
	int code;
	int createTime;
	int createDays;

	UserDetail({this.level, this.listenSongs, this.userPoint, this.mobileSign, this.pcSign, this.profile, this.peopleCanSeeMyPlayRecord, this.bindings, this.adValid, this.code, this.createTime, this.createDays});

	UserDetail.fromJson(Map<String, dynamic> json) {
		level = json['level'];
		listenSongs = json['listenSongs'];
		userPoint = json['userPoint'] != null ? new UserPoint.fromJson(json['userPoint']) : null;
		mobileSign = json['mobileSign'];
		pcSign = json['pcSign'];
		profile = json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
		peopleCanSeeMyPlayRecord = json['peopleCanSeeMyPlayRecord'];
		if (json['bindings'] != null) {
			bindings = new List<Bindings>();
			json['bindings'].forEach((v) { bindings.add(new Bindings.fromJson(v)); });
		}
		adValid = json['adValid'];
		code = json['code'];
		createTime = json['createTime'];
		createDays = json['createDays'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['level'] = this.level;
		data['listenSongs'] = this.listenSongs;
		if (this.userPoint != null) {
      data['userPoint'] = this.userPoint.toJson();
    }
		data['mobileSign'] = this.mobileSign;
		data['pcSign'] = this.pcSign;
		if (this.profile != null) {
      data['profile'] = this.profile.toJson();
    }
		data['peopleCanSeeMyPlayRecord'] = this.peopleCanSeeMyPlayRecord;
		if (this.bindings != null) {
      data['bindings'] = this.bindings.map((v) => v.toJson()).toList();
    }
		data['adValid'] = this.adValid;
		data['code'] = this.code;
		data['createTime'] = this.createTime;
		data['createDays'] = this.createDays;
		return data;
	}
}

class UserPoint {
	int userId;
	int balance;
	int updateTime;
	int version;
	int status;
	int blockBalance;

	UserPoint({this.userId, this.balance, this.updateTime, this.version, this.status, this.blockBalance});

	UserPoint.fromJson(Map<String, dynamic> json) {
		userId = json['userId'];
		balance = json['balance'];
		updateTime = json['updateTime'];
		version = json['version'];
		status = json['status'];
		blockBalance = json['blockBalance'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['userId'] = this.userId;
		data['balance'] = this.balance;
		data['updateTime'] = this.updateTime;
		data['version'] = this.version;
		data['status'] = this.status;
		data['blockBalance'] = this.blockBalance;
		return data;
	}
}

class Profile {
	int authStatus;
	String detailDescription;
	Experts experts;
	Null expertTags;
	int city;
	bool defaultAvatar;
	int backgroundImgId;
	String backgroundUrl;
	int userType;
	String avatarUrl;
	int createTime;
	int djStatus;
	String nickname;
	int accountStatus;
	int province;
	int vipType;
	bool followed;
	bool mutual;
	Null remarkName;
	int avatarImgId;
	int birthday;
	int gender;
	String avatarImgIdStr;
	String backgroundImgIdStr;
	String description;
	int userId;
	String signature;
	int authority;
	int followeds;
	int follows;
	bool blacklist;
	int eventCount;
	int allSubscribedCount;
	int playlistBeSubscribedCount;
	Null followTime;
	bool followMe;
	int cCount;
	int sDJPCount;
	int playlistCount;
	int sCount;
	int newFollows;

	Profile({this.authStatus, this.detailDescription, this.experts, this.expertTags, this.city, this.defaultAvatar, this.backgroundImgId, this.backgroundUrl, this.userType, this.avatarUrl, this.createTime, this.djStatus, this.nickname, this.accountStatus, this.province, this.vipType, this.followed, this.mutual, this.remarkName, this.avatarImgId, this.birthday, this.gender, this.avatarImgIdStr, this.backgroundImgIdStr, this.description, this.userId, this.signature, this.authority, this.followeds, this.follows, this.blacklist, this.eventCount, this.allSubscribedCount, this.playlistBeSubscribedCount,this.followTime, this.followMe, this.cCount, this.sDJPCount, this.playlistCount, this.sCount, this.newFollows});

	Profile.fromJson(Map<String, dynamic> json) {
		authStatus = json['authStatus'];
		detailDescription = json['detailDescription'];
		experts = json['experts'] != null ? new Experts.fromJson(json['experts']) : null;
		expertTags = json['expertTags'];
		city = json['city'];
		defaultAvatar = json['defaultAvatar'];
		backgroundImgId = json['backgroundImgId'];
		backgroundUrl = json['backgroundUrl'];
		userType = json['userType'];
		avatarUrl = json['avatarUrl'];
		createTime = json['createTime'];
		djStatus = json['djStatus'];
		nickname = json['nickname'];
		accountStatus = json['accountStatus'];
		province = json['province'];
		vipType = json['vipType'];
		followed = json['followed'];
		mutual = json['mutual'];
		remarkName = json['remarkName'];
		avatarImgId = json['avatarImgId'];
		birthday = json['birthday'];
		gender = json['gender'];
		avatarImgIdStr = json['avatarImgIdStr'];
		backgroundImgIdStr = json['backgroundImgIdStr'];
		description = json['description'];
		userId = json['userId'];
		signature = json['signature'];
		authority = json['authority'];
		followeds = json['followeds'];
		follows = json['follows'];
		blacklist = json['blacklist'];
		eventCount = json['eventCount'];
		allSubscribedCount = json['allSubscribedCount'];
		playlistBeSubscribedCount = json['playlistBeSubscribedCount'];
		avatarImgIdStr = json['avatarImgId_str'];
		followTime = json['followTime'];
		followMe = json['followMe'];
		cCount = json['cCount'];
		sDJPCount = json['sDJPCount'];
		playlistCount = json['playlistCount'];
		sCount = json['sCount'];
		newFollows = json['newFollows'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['authStatus'] = this.authStatus;
		data['detailDescription'] = this.detailDescription;
		if (this.experts != null) {
      data['experts'] = this.experts.toJson();
    }
		data['expertTags'] = this.expertTags;
		data['city'] = this.city;
		data['defaultAvatar'] = this.defaultAvatar;
		data['backgroundImgId'] = this.backgroundImgId;
		data['backgroundUrl'] = this.backgroundUrl;
		data['userType'] = this.userType;
		data['avatarUrl'] = this.avatarUrl;
		data['createTime'] = this.createTime;
		data['djStatus'] = this.djStatus;
		data['nickname'] = this.nickname;
		data['accountStatus'] = this.accountStatus;
		data['province'] = this.province;
		data['vipType'] = this.vipType;
		data['followed'] = this.followed;
		data['mutual'] = this.mutual;
		data['remarkName'] = this.remarkName;
		data['avatarImgId'] = this.avatarImgId;
		data['birthday'] = this.birthday;
		data['gender'] = this.gender;
		data['avatarImgIdStr'] = this.avatarImgIdStr;
		data['backgroundImgIdStr'] = this.backgroundImgIdStr;
		data['description'] = this.description;
		data['userId'] = this.userId;
		data['signature'] = this.signature;
		data['authority'] = this.authority;
		data['followeds'] = this.followeds;
		data['follows'] = this.follows;
		data['blacklist'] = this.blacklist;
		data['eventCount'] = this.eventCount;
		data['allSubscribedCount'] = this.allSubscribedCount;
		data['playlistBeSubscribedCount'] = this.playlistBeSubscribedCount;
		data['avatarImgId_str'] = this.avatarImgIdStr;
		data['followTime'] = this.followTime;
		data['followMe'] = this.followMe;
		data['cCount'] = this.cCount;
		data['sDJPCount'] = this.sDJPCount;
		data['playlistCount'] = this.playlistCount;
		data['sCount'] = this.sCount;
		data['newFollows'] = this.newFollows;
		return data;
	}
}

class Experts {


	Experts();

	Experts.fromJson(Map<String, dynamic> json);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		return data;
	}
}

class Bindings {
	int expiresIn;
	int refreshTime;
	int bindingTime;
	Null tokenJsonStr;
	bool expired;
	String url;
	int userId;
	int id;
	int type;

	Bindings({this.expiresIn, this.refreshTime, this.bindingTime, this.tokenJsonStr, this.expired, this.url, this.userId, this.id, this.type});

	Bindings.fromJson(Map<String, dynamic> json) {
		expiresIn = json['expiresIn'];
		refreshTime = json['refreshTime'];
		bindingTime = json['bindingTime'];
		tokenJsonStr = json['tokenJsonStr'];
		expired = json['expired'];
		url = json['url'];
		userId = json['userId'];
		id = json['id'];
		type = json['type'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['expiresIn'] = this.expiresIn;
		data['refreshTime'] = this.refreshTime;
		data['bindingTime'] = this.bindingTime;
		data['tokenJsonStr'] = this.tokenJsonStr;
		data['expired'] = this.expired;
		data['url'] = this.url;
		data['userId'] = this.userId;
		data['id'] = this.id;
		data['type'] = this.type;
		return data;
	}
}