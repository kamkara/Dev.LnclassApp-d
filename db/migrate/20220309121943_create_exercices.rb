class CreateExercices < ActiveRecord::Migration[7.0]
  def change
    create_table :exercices, id: :uuid do |t|
      t.string :name
      t.boolean :published
      t.string :slug
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :courses, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end