class CreateStyle < ActiveRecord::Migration
  def change
    create_table :styles do |t|
      t.string :name
      t.string :description
      t.string :template_name
      t.integer :width, :default => 250
      t.integer :height, :default => 350
      t.string :border_style, :default => "solid"
      t.string :border_color, :default => "#808080"
      t.integer :border_radius, :default => 10
      t.decimal :border_width, :precision => 2, :scale => 2 , :default => 0.2
      t.references :image
      t.references :background
      t.timestamps
    end
  end
end
