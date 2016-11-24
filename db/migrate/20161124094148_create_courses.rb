class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :code
      t.string :prerequisite
      t.boolean :independent_study
      t.string :requirements
      t.string :subjects
      t.string :description
      t.string :professor

      t.timestamps
    end
  end
end
