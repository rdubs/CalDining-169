$(document).on('ready page:load', function(){
    $('#upload_button').click(function(){
        filepicker.pick(
            function(Blob){
                $.post(upload_post_url, {filename: Blob.url});
            }
        );
    });
});