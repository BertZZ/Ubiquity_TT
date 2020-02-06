require 'csv'

class ApplicationController < ActionController::Base

  def current_user
   if session[:user_id]
     User.find_by(id: session[:user_id])
   end
 end

  def append_uuid(filename)
    parts = filename.partition('.')
    parts[0] + '-' + SecureRandom.hex(4) + parts[1] + parts[2]
  end

  def check_unique_identifiers(file) #This method feels like it should go on the Upload model but the upload model doesn't now about the file contents. Consider making this method into a class in refactor
    csv = CSV.foreach(file).map { |row| row[3] }
    csv == csv.uniq
  end
end
