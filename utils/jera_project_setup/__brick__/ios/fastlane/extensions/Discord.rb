# Fastfile dedicated to notify pipeline build on discord project channel

platform :ios do

  def notify_discord(config, build_number) 
    return if config.discord_url.empty?
     
    last_number = build_number.split(".").last
    discord(
      url: config.discord_url,
      app_name: "#{config.name}: #{git_branch}",
      platform: 'ios',
      version: get_version_number,
      build_number: last_number.to_i
    )
  end
end