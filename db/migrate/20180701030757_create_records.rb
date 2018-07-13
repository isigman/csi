class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      t.belongs_to :corp
      t.string :state
      t.string :jurisdiction
      t.string :report_name
      t.string :form_name
      t.integer :filing_format
      t.integer :billing_month
      t.integer :billing_year
      t.timestamps
    end
  end
end
