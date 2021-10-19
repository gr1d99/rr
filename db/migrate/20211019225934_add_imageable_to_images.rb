class AddImageableToImages < ActiveRecord::Migration[5.1]
  def change
    add_reference :images, :imageable, polymorphic: true
  end
end
