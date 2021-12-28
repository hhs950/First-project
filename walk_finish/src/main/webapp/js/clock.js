$(document).ready(function () {

    function displayTime() {
        var currentTime = new Date();
        
        // Time difference between UTC and GTC
        var timeDifference = currentTime.getTimezoneOffset()/60;
       
        // Set hours to GTC ( UTC - time difference)
        var hours = currentTime.getHours() + timeDifference;
        
        var minutes = currentTime.getMinutes();
        var seconds = currentTime.getSeconds();
        
        // This adds and substracts time from the GTC deppending on the active option
        if ($(".active").text() === "Venezuela") {
            hours = hours - 4;
            if (minutes > 30) {
                minutes = minutes - 30;
            }
            else {
                hours = hours - 1;
                minutes = minutes + 30;
            }
            $("body").css("background", "linear-gradient(to left, #FFE082, #FFCA28)");
        }
        
          if ($(".active").text() === "Seoul") {
            hours = hours + 9;
            $("body").css("background", "linear-gradient(to left, #9FA8DA, #3949AB)");
        }
         
        if (hours > 24) {
            hours = hours - 24;
        }
        
        if (hours < 0) {
            hours = hours + 24;
        }

        // Let's set the AM and PM meridiem and 
        // 12-hour format
        var meridiem = "AM"; // Default is AM
        
        // Convert from 24 hour to 12 hour format
        // and keep track of the meridiem.
        if (hours >= 12) {
            hours = hours - 12;
            meridiem = "PM";
        }

        // 0 AM and 0 PM should read as 12
        if (hours === 0) {
            hours = 12;
        }

        // If the seconds digit is less than ten                    
        if (seconds < 10) {
            // Add the "0" digit to the front
            // so 9 becomes "09"
            seconds = "0" + seconds;
        }
        // If the minute digit is less than ten                    
        if (minutes < 10) {
            // Add the "0" digit to the front
            // so 9 becomes "09"
            minutes = "0" + minutes;
        }
        // If the hour digit is less than ten                    
        if (hours < 10) {
            // Add the "0" digit to the front
            // so 9 becomes "09"
            hours = "0" + hours;
        }

        // This gets a "handle" to the clock div in our HTML
        var clockDiv = document.getElementById('clock');

        // Then we set the text inside the clock div
        // to the hours, minutes, and seconds of the current time
        clockDiv.innerText = hours + ":" + minutes + ":" + seconds + " " + meridiem;
    }
    
    // This Selects the button clicked and change its class to '.active'
    $("li").click(function() {
        // Removes the active class form the other list items
        $("li").removeClass("active");
        // Ads the active class to the clicked list item
        $(this).addClass("active");
    });

    // This runs the displayTime function the first time
    displayTime();

    // This makes our clock 'tick' by repeatedly
    // running the displayTime function every second.
    setInterval(displayTime, 500);
});

























