#Devise With Role#

#Reffrence#
```
#!url
https://github.com/plataformatec/devise
http://devise.plataformatec.com.br
```

#gem file#

```
#!ruby

gem 'devise'
```

#Terminal#

```
#!ruby
rails g devise:install
rails g devise user
rails g scaffold role role_name:string
rails g migration add_role_id_to_users role_id:number
rails g devise:views users

rails g devise admin
rails g devise:views admins
```

#Scoped Views#
config/initializers/devise.rb

```
#!ruby
config.scoped_views = true
```
#application_controller.rb#

```
#!ruby
before_action :configure_permitted_parameters, if: :devise_controller?
  
protected
def configure_permitted_parameters
  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:role_id, :email, :password, :password_confirmation, :remember_me) }
  devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :role_id, :email, :password, :remember_me) }
  devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:role_id, :email, :password, :password_confirmation, :current_password) }
end
```
#Layout#

```
#!ruby
<p class="navbar-text pull-right">
  <% if user_signed_in? %>
    Logged in as <strong><%= current_user.email %></strong>
    <%= link_to 'Edit Profile', edit_user_registration_path, :class => 'navbar-link'%> | 
    <%= link_to 'Logout', destroy_user_session_path, method: :delete,:class => 'navbar-link'%>
  <% else %>
    <%= link_to 'sign up', new_user_registration_path, :class => 'navbar-link' %> | 
    <%= link_to 'login', new_user_session_path, :class => 'navbar-link' %>
  <% end %>
</p>

<% if notice %>
  <p class="alert alert-success">
    <%=notice%>
  </p>
<% end %>
<% if alert %>
  <p class="alert alert-danger">
    <%= alert %>
  </p>
<% end %>
```

#Development.rb#
```
#!ruby
config.action_mailer.default_url_options = { host: '$IP', port: '$PORT' }
```
#Helpin Methods#

```
#!ruby
before_action :authenticate_user!

user_signed_in?

current_user

user_session
```