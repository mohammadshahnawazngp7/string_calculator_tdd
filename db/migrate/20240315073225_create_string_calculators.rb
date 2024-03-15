class CreateStringCalculators < ActiveRecord::Migration[7.1]
  def change
    create_table :string_calculators do |t|

      t.timestamps
    end
  end
end
