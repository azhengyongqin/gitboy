class OschinaProject {
  int id;
  String name;
  String defaultBranch;
  String description;
  Owner owner;
  bool public;
  String path;
  String pathWithNamespace;
  String nameWithNamespace;
  bool issuesEnabled;
  bool pullRequestsEnabled;
  bool wikiEnabled;
  String createdAt;
  Namespace namespace;
  String lastPushAt;
  int parentId;
  bool fork;
  int forksCount;
  int starsCount;
  int watchesCount;
  String language;
  dynamic paas;
  dynamic stared;
  dynamic watched;
  dynamic relation;
  int recomm;
  dynamic parentPathWithNamespace;

  OschinaProject(
      {this.id,
        this.name,
        this.defaultBranch,
        this.description,
        this.owner,
        this.public,
        this.path,
        this.pathWithNamespace,
        this.nameWithNamespace,
        this.issuesEnabled,
        this.pullRequestsEnabled,
        this.wikiEnabled,
        this.createdAt,
        this.namespace,
        this.lastPushAt,
        this.parentId,
        this.fork,
        this.forksCount,
        this.starsCount,
        this.watchesCount,
        this.language,
        this.paas,
        this.stared,
        this.watched,
        this.relation,
        this.recomm,
        this.parentPathWithNamespace});

  OschinaProject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    defaultBranch = json['default_branch'];
    description = json['description'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    public = json['public'];
    path = json['path'];
    pathWithNamespace = json['path_with_namespace'];
    nameWithNamespace = json['name_with_namespace'];
    issuesEnabled = json['issues_enabled'];
    pullRequestsEnabled = json['pull_requests_enabled'];
    wikiEnabled = json['wiki_enabled'];
    createdAt = json['created_at'];
    namespace = json['namespace'] != null
        ? new Namespace.fromJson(json['namespace'])
        : null;
    lastPushAt = json['last_push_at'];
    parentId = json['parent_id'];
    fork = json['fork?'];
    forksCount = json['forks_count'];
    starsCount = json['stars_count'];
    watchesCount = json['watches_count'];
    language = json['language'];
    paas = json['paas'];
    stared = json['stared'];
    watched = json['watched'];
    relation = json['relation'];
    recomm = json['recomm'];
    parentPathWithNamespace = json['parent_path_with_namespace'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['default_branch'] = this.defaultBranch;
    data['description'] = this.description;
    if (this.owner != null) {
      data['owner'] = this.owner.toJson();
    }
    data['public'] = this.public;
    data['path'] = this.path;
    data['path_with_namespace'] = this.pathWithNamespace;
    data['name_with_namespace'] = this.nameWithNamespace;
    data['issues_enabled'] = this.issuesEnabled;
    data['pull_requests_enabled'] = this.pullRequestsEnabled;
    data['wiki_enabled'] = this.wikiEnabled;
    data['created_at'] = this.createdAt;
    if (this.namespace != null) {
      data['namespace'] = this.namespace.toJson();
    }
    data['last_push_at'] = this.lastPushAt;
    data['parent_id'] = this.parentId;
    data['fork?'] = this.fork;
    data['forks_count'] = this.forksCount;
    data['stars_count'] = this.starsCount;
    data['watches_count'] = this.watchesCount;
    data['language'] = this.language;
    data['paas'] = this.paas;
    data['stared'] = this.stared;
    data['watched'] = this.watched;
    data['relation'] = this.relation;
    data['recomm'] = this.recomm;
    data['parent_path_with_namespace'] = this.parentPathWithNamespace;
    return data;
  }
}

class Owner {
  int id;
  String username;
  String email;
  String state;
  String createdAt;
  String portraitUrl;
  String name;
  String newPortrait;

  Owner(
      {this.id,
        this.username,
        this.email,
        this.state,
        this.createdAt,
        this.portraitUrl,
        this.name,
        this.newPortrait});

  Owner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    state = json['state'];
    createdAt = json['created_at'];
    portraitUrl = json['portrait_url'];
    name = json['name'];
    newPortrait = json['new_portrait'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['state'] = this.state;
    data['created_at'] = this.createdAt;
    data['portrait_url'] = this.portraitUrl;
    data['name'] = this.name;
    data['new_portrait'] = this.newPortrait;
    return data;
  }
}

class Namespace {
  int id;
  String name;
  String path;
  int ownerId;
  String createdAt;
  String updatedAt;
  String description;
  String address;
  dynamic email;
  dynamic url;
  dynamic location;
  dynamic public;
  int enterpriseId;
  int level;
  dynamic from;
  bool outsourced;
  dynamic avatar;

  Namespace(
      {this.id,
        this.name,
        this.path,
        this.ownerId,
        this.createdAt,
        this.updatedAt,
        this.description,
        this.address,
        this.email,
        this.url,
        this.location,
        this.public,
        this.enterpriseId,
        this.level,
        this.from,
        this.outsourced,
        this.avatar});

  Namespace.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    path = json['path'];
    ownerId = json['owner_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    description = json['description'];
    address = json['address'];
    email = json['email'];
    url = json['url'];
    location = json['location'];
    public = json['public'];
    enterpriseId = json['enterprise_id'];
    level = json['level'];
    from = json['from'];
    outsourced = json['outsourced'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['path'] = this.path;
    data['owner_id'] = this.ownerId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['description'] = this.description;
    data['address'] = this.address;
    data['email'] = this.email;
    data['url'] = this.url;
    data['location'] = this.location;
    data['public'] = this.public;
    data['enterprise_id'] = this.enterpriseId;
    data['level'] = this.level;
    data['from'] = this.from;
    data['outsourced'] = this.outsourced;
    data['avatar'] = this.avatar;
    return data;
  }
}
