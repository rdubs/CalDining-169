$(document).on('ready page:load', function(){
    $('#upload-button').click(function(){
        filepicker.setKey(filepicker_key);
        filepicker.pick({customText: 'https://api.myjson.com/bins/2h728'},
            function(Blob){
                $.post(upload_post_url, {filename: Blob.url});
            }
        );
    });
});
