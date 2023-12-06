require_relative 'Config'

module Identifiers
  PRD = ENV["BUNDLE_ID"]
end

module Profiles
  DEV = "match Development #{Identifiers::PRD}"
  ADHOC = "match AdHoc #{Identifiers::PRD}"
  APPSTORE = "match AppStore #{Identifiers::PRD}"
end

module Configs
  PRD = Config.new(
    username: ENV["USER_APPLE_ID"],
    id: Identifiers::PRD,
    apple_id: ENV["APP_APPLE_ID"],
    firebase_id: ENV["FIREBASE_ID"],
    target: ENV["TARGET"],
    scheme: ENV["SCHEME"],
    name: ENV["APP_NAME"],
    team_name: ENV["TEAM_NAME"],
    itc_team_name: ENV["ITC_TEAM_NAME"],
    profile_appstore: Profiles::APPSTORE,
    discord_url: ENV["DISCORD_URL"]
  )
end
