module UsersHelper
  def gravatar_for(user, options = { :size => '50x50' })
    #gravatar_image_tag(user.email.downcase, :alt => h(user.name),
    #                                        :class => 'gravatar',
    #                                        :gravatar => options)
    image_tag("avatar.png", :alt => "Default icon", :class => "gravatar round", 
              :size => options[:size].to_s+'x'+options[:size].to_s)
  end
end
