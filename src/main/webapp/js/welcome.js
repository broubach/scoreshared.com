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

    var rx = 123 / c.w;
    var ry = 162 / c.h;

    $('#preview').css({
        width: Math.round(rx * $('#target').width()) + 'px',
        height: Math.round(ry * $('#target').height()) + 'px',
        marginLeft: '-' + Math.round(rx * c.x) + 'px',
        marginTop: '-' + Math.round(ry * c.y) + 'px'
    });
};