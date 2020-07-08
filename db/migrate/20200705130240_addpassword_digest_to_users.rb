class AddpasswordDigestToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :Users, :passwordDigest, :string
  end
end
