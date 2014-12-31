class AddUploadColumnToPoster < ActiveRecord::Migration
  def change
      add_column :posters , :cover , :string
  end
end
