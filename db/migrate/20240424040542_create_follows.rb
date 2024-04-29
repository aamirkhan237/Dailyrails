class CreateFollows < ActiveRecord::Migration[7.1]
  def change
    create_table :follows do |t|
      t.references :follower, polymorphic: true, null: false
      t.references :followable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
