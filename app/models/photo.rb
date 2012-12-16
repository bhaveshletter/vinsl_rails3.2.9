class Photo < ActiveRecord::Base
  attr_accessible :tag, :avatar
  has_attached_file :avatar, :styles => { :thumb => ["35x35", :gif] },
      :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      :url => "/system/:attachment/:id/:style/:filename"

  belongs_to :album

  validates_attachment :avatar, :presence => true, :content_type => { :content_type => /image/ }
  
  validates :tag, :presence => true,                    
                    :length => { :within => 2..50 }  
end
