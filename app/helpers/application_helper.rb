# encoding: utf-8

module ApplicationHelper

  def method_missing(provider, *args, &block)
    if /^login_with_(\S*)$/.match(provider.to_s)
      link_to "#{$1}","/auth/#{$1}"
    else
      super
    end
  end
end
