(function ($) {
    $.fn.setCursorToTextEnd = function () {
        var $initialVal = this.val();
        this.val($initialVal);
    };
})(jQuery);


$(document).ready($('#MainContent_txtEditCategoryName').setCursorToTextEnd());