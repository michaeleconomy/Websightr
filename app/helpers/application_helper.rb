module ApplicationHelper
  
  def link_to_ar(ar, options = {})
    link_to ar.to_display_name, ar, options
  end
  
  def link_to_remote_loading(copy, options)
    options[:loading]
    options[:id] ||= rand(100000000)
    loading_id = "#{options[:id]}_loading"
    (options[:loading] ||= "") << ";$('#{loading_id}').show();$('#{options[:id]}').hide();"
    (options[:complete] ||= "") << ";$('#{loading_id}').hide();$('#{options[:id]}').show();"
    (options[:failure] ||= "") << ";alert('ajax request failed');"
    link_to_remote(copy, options) + loading(:id => loading_id, :style => 'display:none')
  end
  
  def loading(options = {})
    image_tag('loading.gif', options)
  end
  
  
  def comments_for(resource)
    @comment = Comment.new :resource => resource
    @comments = resource.comments.paginate :page => @page
    render :partial => 'comments/comments_for', :locals => {:resource => resource}
  end
end
