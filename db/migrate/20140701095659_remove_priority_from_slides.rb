class RemovePriorityFromSlides < ActiveRecord::Migration
  def change
     remove_column :slides, :priority, :integer
  end
end
