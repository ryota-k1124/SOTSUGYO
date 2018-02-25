class Menu < ActiveRecord::Base
    validates_presence_of :image, :content, :taste
    belongs_to :user
    has_many :comments, dependent: :destroy
    mount_uploader :image, PictureUploader
    
    before_save do
      self.taste.gsub!(/[\[\]\"]/, "") if attribute_present?("taste")
      #self.taste if attribute_present?("taste")
    end
    
    def self.search(search) #self.でクラスメソッドとしている
      if search # Controllerから渡されたパラメータが!= nilの場合は、カラムを部分一致検索
        tmp="#{search}".gsub!(/[\[\]\"]/, "").gsub(/(, )/, "%")
        p tmp
        Menu.where(['taste LIKE ?', "%#{tmp}%"])
      else
        Menu.all #全て表示。
      end
    end
end
