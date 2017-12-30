module ApplicationHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    # rubocop:disable UselessAssignment
    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    # rubocop:enable UselessAssignment
    html = <<-HTML
      <div class="alert alert-error alert-danger">
      <a href='#' class='close' data-dismiss='alert' &#215;></a>
      <%= content_tag :div, messages if messages.is_a?(String) %>
      </div>
    HTML
    html.html_safe
  end
end
