class CreateBlog1s < ActiveRecord::Migration[5.0]
  def change
    create_table :blog1s do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
