class CreateJoinTableUsersItems < ActiveRecord::Migration
  def change
    create_join_table :items, :users do |t|
      t.references :item
      t.references :user
    end
  end
end
