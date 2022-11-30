class AddCaptionToHomes < ActiveRecord::Migration[5.2]
  def change
    add_column :homes, :caption, :text
  end
end
