# encoding: utf-8

module ApplicationHelper

  def method_missing(provider, *args, &block)
    if /^login_with_(\S*)$/.match(provider.to_s)
      link_to "","/auth/#{$1}", class: "social-#{$1}"
    else
      super
    end
  end
end
