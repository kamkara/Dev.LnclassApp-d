class AddContentImgToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :contentImg, :text
    add_column :courses, :heroImg, :text
    add_column :courses, :teacher_name, :string
  end
end
