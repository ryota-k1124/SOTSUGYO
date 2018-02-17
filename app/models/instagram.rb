class Instagram < ActiveRecord::Base
    validates_presence_of :image, :content
    belongs_to :user
    has_many :comments, dependent: :destroy
    mount_uploader :image, PictureUploader
    
    before_save do
      #self.taste.gsub!(/[\[\]\"]/, "") if attribute_present?("taste")
      self.taste if attribute_present?("taste")
    end
    
    def self.search(search) #self.でクラスメソッドとしている
      if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
        Instagram.where(['taste LIKE ?', "%#{search}%"])
      else
        Instagram.all #全て表示。
      end
    end
end
