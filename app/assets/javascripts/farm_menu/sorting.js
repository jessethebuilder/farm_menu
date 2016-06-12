function orderSections(){
	var sections = $('.section_order_field');
	for(var i = 0; i < sections.length; i++){
		$(sections[i]).val(i + 1);
	}
}
