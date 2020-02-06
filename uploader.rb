require 'aws-sdk-s3'

def upload
  s3 = Aws::S3::Resource.new(region: 'eu-west-2')

  file = 'test.txt'
  bucket = 'testbucketbertz'

  name = File.basename(file)

  obj = s3.bucket(bucket).object(name)

  obj.upload_file(file)

  puts 'Done'
end

upload
