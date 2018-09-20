class CreateSocialAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :social_accounts do |t|
      t.integer :creator_id
      t.string :phone
      t.string :mobile
      t.string :qq
      t.string :wechat
      t.string :email
      t.string :skype
      t.string :google
      t.string :yahoo

      t.timestamps
    end
  end
end
