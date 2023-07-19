class AddTemperatureToResponses < ActiveRecord::Migration[7.0]
  def change
    add_column :responses, :temperature, :decimal, precision: 3, scale: 2
  end
end
