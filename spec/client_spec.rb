require 'spec_helper'

describe XboxLeaders::Client do

	it "should initialize with the default base URL" do
		client = XboxLeaders::Client.new
		client.base_url.should eq("https://www.xboxleaders.com/api")
	end

	it "should initialize with a custom base URL" do
		client = XboxLeaders::Client.new("http://google.com")
		client.base_url.should eq("http://google.com")
	end

	it "should retireve a profile" do
		VCR.use_cassette('xbox_live_profile') do
			client = XboxLeaders::Client.new
			profile = client.profile("AltarCrystal")
			profile.should be_an_instance_of(XboxLeaders::Profile)
		end
	end

end