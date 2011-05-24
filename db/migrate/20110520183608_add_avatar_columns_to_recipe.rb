class AddAvatarColumnsToRecipe < ActiveRecord::Migration
  def self.up
    add_column :recipes, :avatar_file_name,    :string
    add_column :recipes, :avatar_content_type, :string
    add_column :recipes, :avatar_file_size,    :integer
    add_column :recipes, :avatar_updated_at,   :datetime
  end

  def self.down
    add_column :recipes, :avatar_file_name
    add_column :recipes, :avatar_content_type
    add_column :recipes, :avatar_file_size
    add_column :recipes, :avatar_updated_at

  end
end
