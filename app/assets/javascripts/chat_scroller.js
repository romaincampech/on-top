// This function will be executed when the user scrolls the page.
$(window).scroll(function(e) {
    // Get the position of the location where the scroller starts.
    var scroller_anchor = $(".scroller-anchor").offset().top;

    // Check if the user has scrolled and the current position is after the scroller start location and if its not already fixed at the top
    if ($(this).scrollTop() >= scroller_anchor && $('.chat-container').css('position') != 'fixed')
    {    // Change the CSS of the scroller to hilight it and fix it at the top of the screen.
        $('.chat-container').css({
            'position': 'fixed',
            'top': '0px'
        });
        // Changing the height of the scroller anchor to that of scroller so that there is no change in the overall height of the page.
        $('.scroller-anchor').css('height', '50px');
    }
    else if ($(this).scrollTop() < scroller_anchor && $('.chat-container').css('position') != 'absolute')
    {    // If the user has scrolled back to the location above the scroller anchor place it back into the content.

        // Change the height of the scroller anchor to 0 and now we will be adding the scroller back to the content.
        $('.scroller-anchor').css('height', '70px');

        // Change the CSS and put it back to its original position.
        $('.chat-container').css({
            'background': '#FFF',
            'border': '1px solid #CCC',
            'position': 'absolute',
            'top': '70px'
        });
    }
});
