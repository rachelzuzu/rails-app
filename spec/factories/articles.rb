FactoryGirl.define do

    
 # A factory for our article model
  factory :article do |a|
    a.title { FFaker::HipsterIpsum.phrase }
	a.content { FFaker::HipsterIpsum.paragraph }
  end

end

