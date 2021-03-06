class CreateWorkMerges < ActiveRecord::Migration
  def change
    create_table :work_merges do |t|
      t.integer :work_id, :work_merge_list_id, :null => false

      t.timestamps
    end
    add_index :work_merges, :work_id
    add_index :work_merges, :work_merge_list_id
  end
end
