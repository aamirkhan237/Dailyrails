class AddBlockedToFollows < ActiveRecord::Migration[7.1]
  def change
    add_column :follows, :blocked, :boolean, default: false
  end
end
