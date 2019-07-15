class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :confirmpassowrd, :password_confirmation
  end
end
