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

      if check_unique_identifiers(file)
        obj.upload_file(file)
      else
        flash.now[:notice] = 'There was an error with the CSV. Please check the unique identifiers'
        render :new and return
      end

      puts params.inspect

      # Create an object for the upload
      @upload = Upload.new(
          original_filename: file.original_filename,
          filename: obj.key,
      		url: obj.public_url,
          user_id: current_user.id
      	)

      if @upload.save
        redirect_to uploads_path, success: 'File successfully uploaded'
      else
        flash.now[:notice] = 'There was an error'
        render :new
      end
    end

    def index
    end
end
