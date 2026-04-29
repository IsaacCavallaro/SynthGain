module ApplicationHelper
  def app_flash_class(level)
    case level.to_sym
    when :notice
      "flash flash--notice"
    when :alert
      "flash flash--alert"
    else
      "flash"
    end
  end

  def aud_price(amount)
    number_to_currency(amount, unit: "$", precision: 0)
  end

  def listing_card_image(listing, css_class: "listing-card__image")
    if listing.picture.attached?
      image_tag listing.picture, class: css_class, alt: listing.title
    else
      image_tag "synthgainhome.jpg", class: css_class, alt: listing.title
    end
  end

  def profile_avatar(user_info, css_class: "profile-avatar")
    if user_info&.picture&.attached?
      image_tag user_info.picture, class: css_class, alt: seller_name(user_info.user)
    else
      content_tag(:div, seller_initials(user_info&.user), class: "#{css_class} #{css_class}--fallback")
    end
  end

  def seller_name(user)
    return "Anonymous Seller" unless user

    user.email.split("@").first.tr(".", " ").titleize
  end

  def seller_initials(user)
    seller_name(user).split.map { |part| part.first }.first(2).join
  end

  def seller_location(user_info)
    return "Location not provided" unless user_info

    [user_info.city, user_info.country].compact_blank.join(", ")
  end

  def listing_condition_label(listing)
    listing.condition.to_s.humanize
  end
end
