class AddPriorityToSlides < ActiveRecord::Migration
  def change
    add_column :slides, :priority, :integer, null:false
  end
end
