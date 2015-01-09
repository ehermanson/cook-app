$(document).on "page:change", ->

	$('.toggle-trigger').on "click", ->
		console.log('clicked')
		$(this).toggleClass('active').next('.toggle-content').slideToggle()