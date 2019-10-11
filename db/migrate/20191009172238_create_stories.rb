class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :content
      t.belongs_to :user, foreign_key: true
    end
  end
end
