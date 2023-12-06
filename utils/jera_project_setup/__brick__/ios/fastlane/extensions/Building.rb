# Fastfile dedicated to build iOS projects

require_relative '../values/Configs'

platform :ios do
  lane :build_appstore_ipa do 
    build_appstore_ipa(Configs::PRD)
  end
  
  def build_appstore_ipa(config)
    build_ipa(config, "app-store", config.profile_appstore)
  end

  def build_ipa(config, method, profile)    
    gym(
      scheme: config.scheme,
      export_method: method,
       export_options: {
        method: method,
        provisioningProfiles: { 
          config.id => profile
       }
      }
    )
  end
end