module WorksHelper
  def image_generator(height:, width:)
    "http://via.placeholder.com/#{height}x#{width}"
  end

  def portfolio_img img, type
    if img.model.main_image? || img.model.thumb_image?
      img.url
    elsif type == "thumb"
      image_generator(height: "350", width: "200")
    else
      image_generator(height: "600", width: "400")
    end
  end

  def link_generator type, item, icon
    link_to(fa_icon("#{icon} 3x"), item[type], class: "pr-2", title: "View #{type.capitalize}", target: "_blank")
  end
end