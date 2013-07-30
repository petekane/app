class AddAttachmentAvatarToCaregivers < ActiveRecord::Migration
  def self.up
    change_table :caregivers do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :caregivers, :avatar
  end
end
