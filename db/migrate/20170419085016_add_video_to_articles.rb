class AddVideoToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :video, :string
  end
end
