module ListingsHelper
  def purchase_cta(listing, session_id: nil)
    if current_user.nil?
      link_to "Sign in to buy", new_user_session_path, class: "btn btn-primary btn-lg"
    elsif current_user.id == listing.user_id
      content_tag(:span, "This is your listing", class: "pill pill--muted")
    elsif !profile_complete?
      link_to "Complete seller profile to buy", users_info_new_path(current_user.id), class: "btn btn-primary btn-lg"
    elsif session_id.present?
      button_tag "Buy for #{aud_price(listing.price)}",
        class: "btn btn-primary btn-lg",
        data: { stripe: "payment", session_id: session_id, stripe_key: Rails.application.credentials.dig(:stripe, :public_key) }
    else
      content_tag(:span, "Stripe checkout is unavailable in this environment.", class: "pill pill--warning")
    end
  end
end
