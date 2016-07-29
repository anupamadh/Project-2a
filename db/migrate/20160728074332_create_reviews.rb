class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.references :user
      t.references :product

      t.timestamps
    end
  end
end
