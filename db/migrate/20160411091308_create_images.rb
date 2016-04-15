class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :filename
      t.belongs_to :item, index: true
      t.belongs_to :user, index: true
      t.timestamps null: false
    end
  end
end
