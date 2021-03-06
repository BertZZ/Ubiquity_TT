class UploadsController < ApplicationController
  include AuthExceptions
  before_action :authenticate_user!

  def new; end

  def index
    @current_user = current_user
    @uploads = Upload.where(user_id: current_user.id)
  end

  def create #Consider extracting Upload to a new class

    # Make an object in your bucket for your upload
    s3 = Aws::S3::Resource.new(region: 'eu-west-2')

    file = params[:file]


    unless file.original_filename.include?('.csv')
      flash.now[:notice] = 'Please upload a CSV file'
      render :new and return
    end

    bucket = 'ubiquitytestbucket'

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

  def show
    @upload = Upload.find(params[:id])
    s3 = Aws::S3::Resource.new(region: 'eu-west-2')
    obj = s3.bucket('ubiquitytestbucket').object(@upload.filename)
    file = obj.get.body.readlines
    @headers = file[0].split(',')
    @data = file.drop(1)
  end

  protected

  def authenticate_user!
    raise AuthExceptions::NotSignedIn unless current_user
  end
end
