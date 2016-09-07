module ApplicationHelper

  def sign_in_out_register_links
    html = if user_signed_in?
      link_to 'SIGN OUT', destroy_user_session_path, class: 'mdl-navigation__link', :method => :delete
    else
      links = link_to 'SIGN IN', new_user_session_path, class: 'mdl-navigation__link'
      links += link_to 'REGISTER', new_registration_path('user'), class: 'mdl-navigation__link'
    end

    html
  end

  def required_field_options
    { class: 'mdl-textfield__input',
      data: { required: true } }
  end

  def email_field_options
    if controller_name == 'articles'
      required_field_options
    else
      required_field_options.merge(autofocus: true)
    end
  end

  def password_field_options
    required_field_options.merge(
      { pattern: ".{#{@minimum_password_length},}",
        title: "use #{@minimum_password_length} characters or more",
        autocomplete: 'off'}
      )
  end

  def devise_users_shared_links
    html = <<-html
             <div class='mdl-card__actions mdl-card--border'>
               <div class='mdl-card__supporting-text'>
                 #{render "users/shared/links"}
               </div>
             </div>
           html

    html.html_safe
  end

end
