class AddColumnsToEmployees < ActiveRecord::Migration[7.1]
  def change
    add_column :employees, :date_of_birth, :date_of_birth
    add_column :employees, :job_title, :string
    #method  :table, :col_name,:datatype
  end
end
