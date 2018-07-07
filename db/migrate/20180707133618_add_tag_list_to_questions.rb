class AddTagListToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :tag_list, :string
  end
end
