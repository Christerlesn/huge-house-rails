class RenameTypeColumnInVendors < ActiveRecord::Migration[6.1]
  def change
    rename_column :vendors, :type, :vendor_type
  end
end
