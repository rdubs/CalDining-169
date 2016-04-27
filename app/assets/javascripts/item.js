$(document).on('ready page:load', function(){
    $('#upload-button').click(function(){
        filepicker.setKey(filepicker_key);
        filepicker.pick({customText: 'https://api.myjson.com/bins/2h728'},
            function(Blob){
                $.post(upload_post_url, {filename: Blob.url});
            }
        );
    });

    $('.preference-subheader').click(function(){
		var downArrow = $('#down');
		if (downArrow.hasClass('fa-angle-down')) {
			downArrow.removeClass('fa-angle-down');
			downArrow.addClass('fa-angle-up');
			$('.preference-container').show();
		} else {
			downArrow.removeClass('fa-angle-up');
			downArrow.addClass('fa-angle-down');
			$('.preference-container').hide();
		}
	});
});
