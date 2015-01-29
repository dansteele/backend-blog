class CreateAuthor < ActiveRecord::Migration

  def up
    create_table :authors do |t|
      t.string  :name
      t.string  :label
      t.text    :value
      t.string  :type
      t.integer :position
    end

    SystemSetting.create  name:  'notice',
                          label: 'Use notice?',
                          value: 1
  end

  def down
    drop_table :system_settings
  end

end