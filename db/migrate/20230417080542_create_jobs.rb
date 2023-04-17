class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string     :job_title,                null: false
      t.string     :workshop_name,            null: false
      t.text       :description,              null: false
      t.integer    :origin_to_prefecture_id,  null: false
      t.references :user,                     null: false, foreign_key: true
      t.timestamps
    end
  end
end
