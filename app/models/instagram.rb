class Instagram < ActiveRecord::Base
    validates_presence_of :image, :content
    belongs_to :user
    has_many :comments, dependent: :destroy
    mount_uploader :image, PictureUploader
    
    before_save do
      self.taste.gsub!(/[\[\]\"]/, "") if attribute_present?("taste")
    end
end
