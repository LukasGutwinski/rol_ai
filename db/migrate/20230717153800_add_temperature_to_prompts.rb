class AddTemperatureToPrompts < ActiveRecord::Migration[7.0]
  def change
    add_column :prompts, :temperature, :decimal, precision: 3, scale: 2
  end
end
