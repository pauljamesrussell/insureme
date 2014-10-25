module ApplicationHelper
  NOTICE_TO_BOOTSTRAP = {
    'notice' => 'alert-success',
    'alert' => 'alert-warning',
    'flash' => 'alert-info'
  }

  def convert_rails_notice_type_to_bootstrap_class(type)
    NOTICE_TO_BOOTSTRAP[type]
  end
end
