class AddAttachmentImageToZones < ActiveRecord::Migration
  def self.up
    change_table :zones do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :zones, :image
  end
end
