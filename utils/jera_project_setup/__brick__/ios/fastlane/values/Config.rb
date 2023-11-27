class Config
  attr_reader :username, :id, :apple_id, :firebase_id, :target, :scheme, :name, :team_name, :itc_team_name, :profile_appstore, :discord_url

  def initialize(username:, id:, apple_id:, firebase_id:, target:, scheme:, name:, team_name:, itc_team_name:, profile_appstore:, discord_url:)
    @username = username
    @id = id
    @apple_id = apple_id
    @firebase_id = firebase_id
    @target = target
    @scheme = scheme
    @name = name
    @team_name = team_name
    @itc_team_name = itc_team_name
    @profile_appstore = profile_appstore
    @discord_url = discord_url
  end
end