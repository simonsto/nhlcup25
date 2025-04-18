class AddLabelToMatchups < ActiveRecord::Migration[8.0]
  def change
    add_column :matchups, :label, :string
  end
end
