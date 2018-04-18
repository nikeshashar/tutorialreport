class Tutorial < ApplicationRecord
  has_attached_file :avatar,
                    styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: "/images/:style/missing.png",
                    :path => ":rails_root/system/tutorials/avatars/:id/:style_:basename.:extension",
                    :url => "/system/tutorials/avatars/:id/:style_:basename.:extension"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/ unless Rails.env.test?

end
