class AddIndexForResults < ActiveRecord::Migration[6.1]
  def change
    add_index :results, %i[tests users]
  end
end
