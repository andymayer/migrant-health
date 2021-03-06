module ApplicationHelper
  def nav_link(link_text, link_path)
    content_tag(:li) do
      if is_current_page_or_includes_path_but_not_home(link_path, request)
        link_to link_text, link_path, :class => 'active nav-link'
      else
        link_to link_text, link_path, :class => 'nav-link'
      end
    end
  end

  def display_resource_type(resource_type)
    resource_type == Resources::HowTo::DISPLAY_TYPE ? resource_type : resource_type.pluralize
  end

  def display_resource_tagline(resource_class)
    resource_class.tagline
  end

  def breadcrumbs(request)
    path = request.path
    components = path.split('/')
    url_build_up = request.base_url

    breadcrumb_array = components.map do |component|
      url_build_up = get_new_url_build_up(url_build_up, component)
      { title: get_breadcrumb_title(component), url: url_build_up }
    end
  end

  def social_share(request, resource)
    if resource
      type = resource.class.to_s.partition("::").first
      if type == "Resources"
        social_share_button_tag(resource.title, url: "https://"+ENV['HOSTNAME']+request.path, desc: resource.intro, 'data-twitter-title' => resource.title)
      elsif type == "Question"
        social_share_button_tag(resource.content, url: "https://"+ENV['HOSTNAME']+request.path, desc: resource.content, 'data-twitter-title' => resource.content)
      end
    end
  end

  def fancy_paragraphs(text)
    html = ""
    if text
      bullets = false
      text.split("\n").each do |para|
        if para[0] == "-"
          if !bullets
            html +=  "<ul>"
            bullets = true
          end
          html += "<li>#{para[1..-1]}</li>" if para.length > 1
        else
          if bullets
            html +=  "</ul>"
            bullets = false
          end
            html += "<p>#{para}</p>" if para.length > 1
        end
      end
    end
    html.html_safe
  end

  def is_a_number(text)
    /\A[-+]?\d+\z/ === text
  end


  private

  # YUCK
  def is_current_page_or_includes_path_but_not_home(link_path, request)
    current_page?(link_path) || (link_path != '/') && (request.path.include?(link_path))
  end

  # YUCK
  def get_new_url_build_up(url_build_up, component)
    if url_build_up.end_with? ('/')
      "#{url_build_up}#{component}"
    else
      "#{url_build_up}/#{component}"
    end
  end

  def get_breadcrumb_title(component)
    title = case component
    when '' || nil
      'Home'
    when 'how_tos'
      'How To'
    else
      component.titleize
    end

    truncate(title, length: 25, omission: '... ')
  end
end
