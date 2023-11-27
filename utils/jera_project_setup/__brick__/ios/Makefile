.DEFAULT_GOAL := help
BUNDLE= bundle
FASTLANE=$(BUNDLE) exec fastlane
COCOAPODS=$(BUNDLE) exec pod

# Setup
install: ## install required dependencies
	make install_bundle
	$(FASTLANE) install

install_bundle: ## install gems
	$(BUNDLE) install

# Certificates & Profiles
install_certificates: ## fetch and install certificates for code signing
	$(FASTLANE) fetch_certificates

create_profiles: ## create certificates, provisioning profiles to include new devices using Match
	$(FASTLANE) create_profiles

renew_profiles: ## revoke and re-create provisioning profiles to include new devices using Match
	$(FASTLANE) update_profiles

# Deploy
deploy_testflight: ## builds the app using PRD scheme and sends it to Test Flight
	$(FASTLANE) deploy_testflight

# Wipes
xcode_wipe: ## delete all xcode cached outputs, kill and reset all simulators
	-rm -rf ~/Library/Developer/Xcode/{DerivedData,Archives,Products}
	make reset_simulator
	
reset_simulator: ## reset all iOS Simulators
	-osascript -e 'tell application "Simulator" to quit'
	-xcrun simctl shutdown all
	-xcrun simctl erase all

profiles_wipe: ## removes all Provisioning profiles currently installed and re-install the required ones
	rm -rf ~/Library/MobileDevice/Provisioning\ Profiles/*
	make install_certificates

# Help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'