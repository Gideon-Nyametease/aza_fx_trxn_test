class SetActiveDelStatusDefaultForTransactions < ActiveRecord::Migration[6.1]
  def change
    change_column :transactions, :active_status, :boolean, default: true
    change_column :transactions, :del_status, :boolean, default: false
  end
end
