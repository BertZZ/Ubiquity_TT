class CreateUploads < ActiveRecord::Migration[6.0]
  def change
    create_table :uploads do |t|
      t.belongs_to :user
      
      t.string :original_filename
      t.string :filename
      t.string :url

      t.timestamps
    end
  end
end
