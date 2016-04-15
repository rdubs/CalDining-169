$(document).on('ready page:load', function(){
    $('#upload-button').click(function(){
        filepicker.setKey(filepicker_key);
        filepicker.pick(
            function(Blob){
                $.post(upload_post_url, {filename: Blob.url});
            }
        );
    });
});