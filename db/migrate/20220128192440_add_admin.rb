class AddAdmin < ActiveRecord::Migration[6.1]
  def change
    User.create! do |user|
      user.email = 'keks181998@gmail.com'
      user.username = 'admin'
      user.password = 'qwerty'
      user.admin_role = true
    end
  end
end
