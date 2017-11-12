module ApplicationHelper
  def nav_link(link_text, link_path)
    content_tag(:li) do
      if current_page?(link_path)
        link_to link_text, link_path, :class => 'active nav-link'
      else
        link_to link_text, link_path, :class => 'nav-link'
      end
    end
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

  private

  def get_new_url_build_up(url_build_up, component)
    if url_build_up.end_with? ('/')
      "#{url_build_up}#{component}"
    else
      "#{url_build_up}/#{component}"
    end
  end

  def get_breadcrumb_title(component)
    if component.empty?
      'Home'
    else
      truncate(component.titleize, length: 25, omission: '... ')
    end
  end
end
