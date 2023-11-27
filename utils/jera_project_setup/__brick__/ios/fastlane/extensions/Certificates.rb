# Fastfile dedicated to signing configuration of iOS projects

require_relative '../values/Configs'

# SENHA PARA DESCRIPTOGRAFAR OS CERTIFICADOS Jera2021& (PRIMEIRA SENHA A SER PEDIDA)
# SENHA DA SUA KEYCHAIN (PROXIMAS SENHAS A SEREM PEDIDAS) É SOMENTE DAR ENTER

platform :ios do
  desc "Fetch the Development, AdHoc and Distribution Certificates"
  lane :fetch_certificates do
    config = Configs::PRD
    fetch_certificates(config)
  end

  desc "Register devices, create certificates and provisioning profiles"
  lane :create_profiles do
    register_new_devices(Configs::PRD)
    update_profiles
  end

  desc "Update profiles for newly added devices"
  lane :update_profiles do
    if prompt(text: "Ao realizar esse procedimento, os profiles atuais serão revogados e substituídos, deseja continuar?", boolean: true)
      config = Configs::PRD
      update_provisioning_profiles(config)
    end
  end

  def fetch_certificates(config)
    bundle_ids = [config.id]
    team_name = config.team_name

    match(app_identifier: bundle_ids, team_name: team_name, type: "development")
    match(app_identifier: bundle_ids, team_name: team_name, type: "appstore")
    match(app_identifier: bundle_ids, team_name: team_name, type: "adhoc")
  end

  def update_provisioning_profiles(config) 
    bundle_ids = [config.id]
    team_name = config.team_name

    match(readonly: false, force_for_new_devices: true, app_identifier: bundle_ids, team_name: team_name, type: "development")
    match(readonly: false, force_for_new_devices: true, app_identifier: bundle_ids, team_name: team_name, type: "adhoc")
    match(readonly: false, app_identifier: bundle_ids, team_name: team_name, type: "appstore")
  end

  def register_new_devices(config)
    register_devices(
      username: config.username,
      team_name: config.team_name,
      devices_file: './fastlane/devices_jera.txt'
    )
  end
end