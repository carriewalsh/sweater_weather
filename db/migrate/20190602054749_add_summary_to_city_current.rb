class AddSummaryToCityCurrent < ActiveRecord::Migration[5.2]
  def change
    add_column :city_currents, :summary, :string
  end
end
