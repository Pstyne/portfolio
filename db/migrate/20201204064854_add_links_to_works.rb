class AddLinksToWorks < ActiveRecord::Migration[6.0]
  def change
    add_column :works, :demo, :string
    add_column :works, :repo, :string
  end
end
