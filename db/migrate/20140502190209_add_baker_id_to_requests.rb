class AddBakerIdToRequests < ActiveRecord::Migration
  def change
    add_column :requests, :baker_id, :integer
  end
end
