# Fastfile dedicated to release iOS Projetct to Testflight

require_relative '../values/Configs'

platform :ios do

  desc "Deploy a version on TestFlight"
  lane :deploy_testflight do
    release_to_testflight(Configs::PRD)
  end

  lane :upload_symbols do
    upload_symbols_to_firebase(Configs::PRD)
  end 

  def release_to_testflight(config)
    if is_ci
      sh("cd ../ && git checkout . && git clean -fd")
    end

    build_number = create_build_number
    build_appstore_ipa(config)

    testflight(
      app_identifier: config.id,
      apple_id: config.apple_id,
      distribute_external: false,
      skip_submission: true,
      skip_waiting_for_build_processing: true,
      username: config.username
    )

    upload_symbols_to_firebase(config)
    notify_discord(config, build_number)
  end

  def upload_symbols_to_firebase(config)
    if !config.firebase_id.nil? && !config.firebase_id.empty?
      upload_symbols_to_crashlytics(
        app_id: config.firebase_id,
        platform: 'ios',
        dsym_worker_threads: "10"
      )
    end
  end 

  def create_build_number
    increment_build_number(build_number: get_date_build)
  end

   def get_date_build
    get_today_date + "." + get_build
  end

  def get_today_date
    Date.today().strftime("%Y%m%d")
  end

  def get_build
    number_of_commits.to_s
  end
end
