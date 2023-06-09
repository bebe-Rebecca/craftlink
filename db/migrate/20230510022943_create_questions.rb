class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :name,     null: false
      t.string :title,    null: false
      t.text :content,    null: false
      t.references :user, null: false, foreign_key: true
      t.references :job , null: false, foreign_key: true
      t.timestamps
    end
  end
end
