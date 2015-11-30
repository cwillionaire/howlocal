class AddAttachmentDocumentationToBusinesses < ActiveRecord::Migration
  def self.up
    change_table :businesses do |t|
      t.attachment :documentation
    end
  end

  def self.down
    remove_attachment :businesses, :documentation
  end
end
