class User {
	int loginType;
	int code;
	Account account;
	String token;
	Profile profile;
	List<Bindings> bindings;
  String msg;
	User({this.loginType, this.code, this.account, this.token, this.profile, this.bindings,this.msg});

	User.fromJson(Map<String, dynamic> json) {
		loginType = json['loginType'];
		code = json['code'];
    msg=json['msg'];
		account = json['account'] != null ? new Account.fromJson(json['account']) : null;
		token = json['token'];
		profile = json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
		if (json['bindings'] != null) {
			bindings = new List<Bindings>();
			json['bindings'].forEach((v) { bindings.add(new Bindings.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['loginType'] = this.loginType;
		data['code'] = this.code;
		if (this.account != null) {
      data['account'] = this.account.toJson();
    }
		data['token'] = this.token;
		if (this.profile != null) {
      data['profile'] = this.profile.toJson();
    }
		if (this.bindings != null) {
      
      data['bindings'] = this.bindings.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class Account {
	int id;
	String userName;
	int type;
	int status;
	int whitelistAuthority;
	int createTime;
	String salt;
	int tokenVersion;
	int ban;
	int baoyueVersion;
	int donateVersion;
	int vipType;
	int viptypeVersion;
	bool anonimousUser;

	Account({this.id, this.userName, this.type, this.status, this.whitelistAuthority, this.createTime, this.salt, this.tokenVersion, this.ban, this.baoyueVersion, this.donateVersion, this.vipType, this.viptypeVersion, this.anonimousUser});

	Account.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		userName = json['userName'];
		type = json['type'];
		status = json['status'];
		whitelistAuthority = json['whitelistAuthority'];
		createTime = json['createTime'];
		salt = json['salt'];
		tokenVersion = json['tokenVersion'];
		ban = json['ban'];
		baoyueVersion = json['baoyueVersion'];
		donateVersion = json['donateVersion'];
		vipType = json['vipType'];
		viptypeVersion = json['viptypeVersion'];
		anonimousUser = json['anonimousUser'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['userName'] = this.userName;
		data['type'] = this.type;
		data['status'] = this.status;
		data['whitelistAuthority'] = this.whitelistAuthority;
		data['createTime'] = this.createTime;
		data['salt'] = this.salt;
		data['tokenVersion'] = this.tokenVersion;
		data['ban'] = this.ban;
		data['baoyueVersion'] = this.baoyueVersion;
		data['donateVersion'] = this.donateVersion;
		data['vipType'] = this.vipType;
		data['viptypeVersion'] = this.viptypeVersion;
		data['anonimousUser'] = this.anonimousUser;
		return data;
	}
}

class Profile {
	bool mutual;
	Null remarkName;
	Null expertTags;
	int authStatus;
	int userId;
	int avatarImgId;
	Experts experts;
	int province;
	bool defaultAvatar;
	String avatarUrl;
	int vipType;
	int gender;
	int accountStatus;
	int djStatus;
	int userType;
	int city;
	int backgroundImgId;
	String nickname;
	int birthday;
	String detailDescription;
	bool followed;
	String backgroundUrl;
	String avatarImgIdStr;
	String backgroundImgIdStr;
	String description;
	String signature;
	int authority;
	int followeds;
	int follows;
	int eventCount;
	int playlistCount;
	int playlistBeSubscribedCount;

	Profile({this.mutual, this.remarkName, this.expertTags, this.authStatus, this.userId, this.avatarImgId, this.experts, this.province, this.defaultAvatar, this.avatarUrl, this.vipType, this.gender, this.accountStatus, this.djStatus, this.userType, this.city, this.backgroundImgId, this.nickname, this.birthday, this.detailDescription, this.followed, this.backgroundUrl, this.avatarImgIdStr, this.backgroundImgIdStr, this.description, this.signature, this.authority,  this.followeds, this.follows, this.eventCount, this.playlistCount, this.playlistBeSubscribedCount});

	Profile.fromJson(Map<String, dynamic> json) {
		mutual = json['mutual'];
		remarkName = json['remarkName'];
		expertTags = json['expertTags'];
		authStatus = json['authStatus'];
		userId = json['userId'];
		avatarImgId = json['avatarImgId'];
		experts = json['experts'] != null ? new Experts.fromJson(json['experts']) : null;
		province = json['province'];
		defaultAvatar = json['defaultAvatar'];
		avatarUrl = json['avatarUrl'];
		vipType = json['vipType'];
		gender = json['gender'];
		accountStatus = json['accountStatus'];
		djStatus = json['djStatus'];
		userType = json['userType'];
		city = json['city'];
		backgroundImgId = json['backgroundImgId'];
		nickname = json['nickname'];
		birthday = json['birthday'];
		detailDescription = json['detailDescription'];
		followed = json['followed'];
		backgroundUrl = json['backgroundUrl'];
		avatarImgIdStr = json['avatarImgIdStr'];
		backgroundImgIdStr = json['backgroundImgIdStr'];
		description = json['description'];
		signature = json['signature'];
		authority = json['authority'];
		followeds = json['followeds'];
		follows = json['follows'];
		eventCount = json['eventCount'];
		playlistCount = json['playlistCount'];
		playlistBeSubscribedCount = json['playlistBeSubscribedCount'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['mutual'] = this.mutual;
		data['remarkName'] = this.remarkName;
		data['expertTags'] = this.expertTags;
		data['authStatus'] = this.authStatus;
		data['userId'] = this.userId;
		data['avatarImgId'] = this.avatarImgId;
		if (this.experts != null) {
      data['experts'] = this.experts.toJson();
    }
		data['province'] = this.province;
		data['defaultAvatar'] = this.defaultAvatar;
		data['avatarUrl'] = this.avatarUrl;
		data['vipType'] = this.vipType;
		data['gender'] = this.gender;
		data['accountStatus'] = this.accountStatus;
		data['djStatus'] = this.djStatus;
		data['userType'] = this.userType;
		data['city'] = this.city;
		data['backgroundImgId'] = this.backgroundImgId;
		data['nickname'] = this.nickname;
		data['birthday'] = this.birthday;
		data['detailDescription'] = this.detailDescription;
		data['followed'] = this.followed;
		data['backgroundUrl'] = this.backgroundUrl;
		data['avatarImgIdStr'] = this.avatarImgIdStr;
		data['backgroundImgIdStr'] = this.backgroundImgIdStr;
		data['description'] = this.description;
		data['signature'] = this.signature;
		data['authority'] = this.authority;
		data['followeds'] = this.followeds;
		data['follows'] = this.follows;
		data['eventCount'] = this.eventCount;
		data['playlistCount'] = this.playlistCount;
		data['playlistBeSubscribedCount'] = this.playlistBeSubscribedCount;
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
	String tokenJsonStr;
	int bindingTime;
	int userId;
	int expiresIn;
	int refreshTime;
	String url;
	bool expired;
	int id;
	int type;

	Bindings({this.tokenJsonStr, this.bindingTime, this.userId, this.expiresIn, this.refreshTime, this.url, this.expired, this.id, this.type});

	Bindings.fromJson(Map<String, dynamic> json) {
		tokenJsonStr = json['tokenJsonStr'];
		bindingTime = json['bindingTime'];
		userId = json['userId'];
		expiresIn = json['expiresIn'];
		refreshTime = json['refreshTime'];
		url = json['url'];
		expired = json['expired'];
		id = json['id'];
		type = json['type'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['tokenJsonStr'] = this.tokenJsonStr;
		data['bindingTime'] = this.bindingTime;
		data['userId'] = this.userId;
		data['expiresIn'] = this.expiresIn;
		data['refreshTime'] = this.refreshTime;
		data['url'] = this.url;
		data['expired'] = this.expired;
		data['id'] = this.id;
		data['type'] = this.type;
		return data;
	}
}