class RenameEmployeeBioAttr < ActiveRecord::Migration[7.1]
  def change
    rename_column :employees, :bio, :about
  end
end
