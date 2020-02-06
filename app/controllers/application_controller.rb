class ApplicationController < ActionController::Base
  def append_uuid(filename)
    parts = filename.partition('.')
    parts[0] + '-' + SecureRandom.hex(8) + parts[1] + parts[2]
  end
end
