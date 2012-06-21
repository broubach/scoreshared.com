var Step3Bindings = {
    start: function() {
        $('#file').change(Step3Bindings.onFileChanged);
    },
    
    onFileChanged: function() {
        $('#avatarUploaded').val('true');
        $('#fileUpload-form').submit();
    }
};

function showCoords(c) {
    $('#x').val(c.x);
    $('#y').val(c.y);
    $('#x2').val(c.x2);
    $('#y2').val(c.y2);
};