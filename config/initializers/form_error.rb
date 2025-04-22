# config/initializers/field_error_proc.rb
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  field_name = instance.instance_variable_get(:@method_name)

  if html_tag =~ /^<label/
    html_tag.html_safe
  else
    errors = Array(instance.error_message)
    field_label = field_name.to_s.humanize
    error_messages = errors.map { |msg| "#{field_label} #{msg}" }.join(', ')

    html = <<~HTML
      #{html_tag}
      <div class="error-message" style="color: red; font-size: 0.9em;">#{ERB::Util.h(error_messages)}</div>
    HTML

    html.html_safe
  end
end