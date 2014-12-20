class AddFailedAttempsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :failed_attempts, default: 0, null: false , :integer
  end
end
