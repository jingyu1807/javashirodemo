$(function(){
    var options ={thumbBox : '.thumbBox',spinner : '.spinner', scaleRatio : 0.2}
    var cropper = $('.imageBox').cropbox(options);
    $('#upload-file').on('change', function() {
        var reader = new FileReader();
        reader.onload = function(e) {
            options.imgSrc = e.target.result;
            cropper = $('.imageBox').cropbox(options);
        }
        reader.readAsDataURL(this.files[0]);
    });
    //保存图片
    $('#btnCrop').on('click',function() {
        var img = cropper.getDataURL();
        //$('.cropped img').remove()
        $('.cropped div').hide();
        $('#headinfo2').remove()
        $('.cropped').append('<img id="headinfo2" src="'+img+'" align="absmiddle" style="width: 319px;height: 197px;box-shadow:0px 0px 12px #7E7E7E;">');
        $('#myModal').modal('hide');
        isNeedUpload = 1;
    });
    //移除图片
    $('#cancleImg').on('click',function() {
        $('#headinfo2').remove()
        $('.cropped div').show()
        $('#articleFile_trans_textarea').val("");
        isNeedUpload = 0;
    });
    $('#btnZoomIn').on('click', function() {
        cropper.zoomIn();
    });
    $('#btnZoomOut').on('click', function() {
        cropper.zoomOut();
    });
});

