class AddIsHiddenToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :hidden, :boolean, default: false
  end
end
