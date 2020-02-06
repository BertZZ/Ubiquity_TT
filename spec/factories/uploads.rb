FactoryBot.define do
  factory :upload do
    user
    original_filename { "test.txt" }
    filename { "test-01234567.txt" }
    url { "https://testbucket.s3.eu-west-2.amazonaws.com/test.txt" }
  end
end
