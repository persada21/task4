class Post < ActiveRecord::Base
        has_attached_file :image, styles: { medium: "300x300>", thumb: "250x250>" }, default_url: "/images/:style/missing.png"
        validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
        validates_with AttachmentPresenceValidator, attributes: :image
        validates_with AttachmentSizeValidator, attributes: :image, less_than: 600.kilobytes

        
end
