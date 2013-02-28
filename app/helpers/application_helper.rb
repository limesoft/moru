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

  def link_to_topic(title, type, iconImage='', classValue='')
    if classValue != ''
    css_class = classValue
    else
    css_class = " selected" if params[:list_type] == type
    end

    link_to(iconImage << title, topics_path(list_type: type), class: css_class)
  end

end
