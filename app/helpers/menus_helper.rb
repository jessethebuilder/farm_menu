module MenusHelper
  def embedded_sections_form(form_builder)
    render :partial => 'sections/embedded_form', :locals => {:form_builder => form_builder}
  end
  
  def embedded_products_form(form_builder)
    render :partial => 'products/embedded_form', :locals => {:form_builder => form_builder}
  end
  
  def error_messages(record)
    render :partial => 'parts/error_messages', :locals => {:record => record}
  end
end