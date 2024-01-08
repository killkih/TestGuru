class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :icon_url, null: false, default: 'https://img.freepik.com/premium-photo/achievement-badge-with-star-3d-vector-icon-isolated-on-white_202497-1457.jpg'
      t.string :condition, null: false
      t.string :option
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
