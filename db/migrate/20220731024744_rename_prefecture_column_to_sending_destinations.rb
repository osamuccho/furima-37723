class RenamePrefectureColumnToSendingDestinations < ActiveRecord::Migration[6.0]
  def change
    rename_column :sending_destinations, :prefecture, :prefecture_code_id
  end
end
