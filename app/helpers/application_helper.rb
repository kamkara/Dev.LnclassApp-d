module ApplicationHelper

    #Onglet Title
    def title
        base_title = "Lnclass Education"
        if @title.nil?
        base_title
        else
        "#{@title} | #{base_title}"
        end
    end
    #site description
    def description
        "Lnclass Education aide les élèves à obtenir le BAC"
    end

    #ENABLE SIGN IN AND SIGN UP ANYWHERE IN APP
    def resource_name
    :user
    end
    
    def resource
        @resource ||= User.new
    end
    
    def resource_class
        User
    end
    
    def devise_mapping
        @devise_mapping ||= Devise.mappings[:user]
    end

  #FLASH NOTICE

  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
      <button type="button" class="close" data-dismiss="alert">
        <span aria-hidden="true">&times;</span>
      </button>
      <strong>
       #{pluralize(resource.errors.count, "error")} must be fixed
      </strong>
      #{messages}
    </div>
    HTML

    html.html_safe
  end

end
