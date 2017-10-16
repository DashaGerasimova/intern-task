class AddNullFalseToFeedbackColumns < ActiveRecord::Migration[5.1]
  def change
  	change_column_null :feedbacks, :name, false
  	change_column_null :feedbacks, :email, false
  	change_column_null :feedbacks, :text, false
  end
end
