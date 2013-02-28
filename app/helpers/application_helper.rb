# encoding: utf-8

module ApplicationHelper

  def method_missing(provider, *args, &block)
    if /^login_with_(\S*)$/.match(provider.to_s)
      link_to "","/auth/#{$1}", class: "social-#{$1}"
    else
      super
    end
  end

  def link_to_page(title, url, cond)
    content_tag(:li, link_to(title, url, class: (request[:controller] == cond ? 'active': '')))
  end

  def moru_logo_url
    request.protocol + request.host_with_port + "/assets/logo.png"
  end

  def link_to_topic(title, view)
    if view == 'talked'
      css_class = 'past-topic'
      title = content_tag(:i, '', class: 'talked-icon') << title
    elsif params[:view] == view
      css_class = 'selected'
    end
    link_to(title, topics_path(view: view), class: css_class)
  end

end
