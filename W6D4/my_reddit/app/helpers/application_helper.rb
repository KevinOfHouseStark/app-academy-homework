module ApplicationHelper
  def auth_token
    <<-HTML.html_safe
      <input type="hidden"
        name="authenticity_token"
        value="#{form_authenticity_token}">
    HTML
  end

  def sign_out_button
    <<-HTML.html_safe
      <form action="#{session_url}" method="POST">
        <input type="hidden" name="_method" value="DELETE">
        #{auth_token}
        <button>Sign Out</button>
      </form>
    HTML
  end

  def sign_in_button
    <<-HTML.html_safe
      <a href="#{new_session_url}">Log In</a>
    HTML
  end

  def create_account_button
    <<-HTML.html_safe
      <a href="#{new_user_url}">Create Account</a>
    HTML
  end
end
