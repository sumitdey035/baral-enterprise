class ServiceRequestDecorator < Draper::Decorator
  include Draper::LazyHelpers

  def status
    badge_class = case object.status
    when 'created' then 'primary'
    when 'pending' then 'warning'
    when 'completed' then 'success'
    when 'cancelled' then 'danger'
                  end
    h.content_tag(:span, object.status, class: "badge badge-#{badge_class}")
  end
end
