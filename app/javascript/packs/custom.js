$(document).ready(function(){
    $(".price").change(function() {
        var $this = $(this);
        $this.val(parseFloat($this.val()).toFixed(2));        
    });
})