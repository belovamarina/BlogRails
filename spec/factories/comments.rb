FactoryGirl.define do
  factory :comment do
  	author "Mike"
  	sequence(:body) {|n| "comments body #{n}"}
  end

end