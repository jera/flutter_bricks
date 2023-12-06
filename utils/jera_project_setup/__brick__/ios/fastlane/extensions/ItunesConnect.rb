# Fastfile dedicated to create iOS projects in iTunes Connect

require_relative '../values/Configs'

platform :ios do

  desc "Create app in iTunes Connect and developer portal"
  lane :create_itunes_app do
    create_app(Configs::PRD)
  end

  def create_app(config)
    create_app_online(
      username: config.username,
      app_identifier: config.id,
      app_name: config.name,
      team_name: config.team_name,
      itc_team_name: config.itc_team_name,
      language: "pt-BR",
      app_version: "1.0"
    )    
  end
end