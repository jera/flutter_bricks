# Fastfile dedicated to generate App Icon

platform :ios do

  desc "Generate all necessary icons and put on assets"
  lane :generate_icon do
    if ENV["APP_ICON_PATH"] != nil
      appicon(
        appicon_image_file: ENV["APP_ICON_PATH"],
        appicon_devices: [:ipad, :iphone],
        appicon_path: ENV["ASSETS_PATH"]
      )
    end
  end
end