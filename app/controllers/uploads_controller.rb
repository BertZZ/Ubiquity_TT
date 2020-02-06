class UploadsController < ApplicationController
  def new
    end

    def create
      # Make an object in your bucket for your upload
      s3 = Aws::S3::Resource.new(region: 'eu-west-2')

      file = params[:file]

      bucket = 'testbucketbertz'

      name = append_uuid(file.original_filename)

      obj = s3.bucket(bucket).object(name)

      obj.upload_file(file)

      puts "FILENAME #{obj.key}"
      puts "URL #{obj.public_url}"
      puts "ORIGINAL FILE NAME: #{file.original_filename}"


      # Create an object for the upload
      # @upload = Upload.new(
      # 		url: obj.public_url,
  		#     name: obj.key
      # 	)
      #
      # # Save the upload
      # if @upload.save
      #   redirect_to uploads_path, success: 'File successfully uploaded'
      # else
      #   flash.now[:notice] = 'There was an error'
      #   render :new
      # end
    end

    def index
    end
end
