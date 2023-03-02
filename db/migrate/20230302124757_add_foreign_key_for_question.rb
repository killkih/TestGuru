class AddForeignKeyForQuestion < ActiveRecord::Migration[6.1]
  def change
    add_reference(:questions, :tests, foreign_key: true)
  end
end
