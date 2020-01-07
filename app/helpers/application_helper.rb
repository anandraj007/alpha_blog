module ApplicationHelper
    def gravatar_for (user,size: 80 )
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        gravatar_url = gravatar_url = "http://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        image_tag(gravatar_url,alt: user.username, class: 'rounded-circle')
    end
    
end
