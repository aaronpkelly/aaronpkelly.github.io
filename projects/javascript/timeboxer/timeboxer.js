/*
TIMELEFT=int(sys.argv[1])
items = ("make bed", "clean bathroom", "finish dishes", "sweep floors")

for i, item in enumerate(items):
    print("{}: {}".format(TIMELEFT/len(items) * (i+1), item))
*/

var ALARM_DELTA = 500; // the amount of difference we can forgive
var ALARM_DELTA_EARLY = 60000 * 5; // 1 min
var AUDIO = true;
var COOKIE_EXPIRY_IN_DAYS = 30;
var MS_PER_MINUTE = 60000; // 1 min
// var alarm = new Audio('alarm_guitarReverb.flac');
// var alarmEarly = new Audio('alarmWarning_guitarCinematic.flac');
var alarms_totalAllocationTime = 60;
var alarms_deadline = new Date()
var alarms_start= new Date()
var alarms = [];
var currentTime = new Date();
var isRunning = false;
var playedAlarms = [];
var table_alarms = document.getElementById("table_alarms");
var tasks = [] // used for cookie session storage
var audio_tick;
var audio_alarm;
var audio_alarm_early;

/*
function addTask(){
    task = document.getElementById("myTextarea").value
    if (task == "") {
        return -1;
    }
    if (!contains(task)) {
        tasks.push(task)
        document.getElementById("myTextarea").value = "";
    }
}
*/

function checkAlarms() {
    for (i = 0; i < alarms.length; i++) {
        var alarmVariance = Math.abs(currentTime.getTime() - alarms[i].getTime());
        if (alarmVariance < ALARM_DELTA) {
            if (AUDIO == true) {
                audio_alarm.play();
            }
        }
        if (alarmVariance < ALARM_DELTA_EARLY) {
            if (playedAlarms.indexOf(i) == -1) {
                if (AUDIO == true) {
                    audio_alarm_warning.play();
                }
                playedAlarms.push(i);
            }
        }
    }
}

function checkUserInput() {
    var key = window.event.keyCode;

    if (key == 13) {
        newElement("newElement");
    }
}

function clearAlarmState() {
    alarms = []

    var table_alarms = document.getElementById("table_alarms");

    if (table_alarms != null) {
        for (var i = table_alarms.rows.length - 1; i >= 0; i--) {
	  table_alarms.deleteRow(i);
	}
    }
}

function clearTasksState() {
    var table_tasks = document.getElementById("table_tasks");
    if (table_tasks != null) {
        for (var i = table_tasks.rows.length - 1; i >= 0; i--) {
	  table_tasks.deleteRow(i);
	}
    }
}

function contains(a, obj) {
    var i = a.length;
    while (i--) {
       if (a[i] === obj) {
           return true;
       }
    }
    return false;
}

function convertDateToString(currentTime) {

    // some fancy trickery to make sure there is always a zero in front of
    // single digits
    var hours = (currentTime.getHours() < 10? '0':'') + currentTime.getHours();
    var minutes = (currentTime.getMinutes() < 10? '0':'') + currentTime.getMinutes();
    var seconds = (currentTime.getSeconds() < 10? '0':'') + currentTime.getSeconds();
    return hours + ":" + minutes + ":" + seconds;
}

function createAudioElements() {
    audio_tick = document.createElement("audio");
    audio_tick.setAttribute("src", "tick.ogg");
    audio_alarm = document.createElement("audio");
    audio_alarm.setAttribute("src", "alarm.ogg");
    audio_alarm_warning = document.createElement("audio");
    audio_alarm_warning.setAttribute("src", "alarm_warning.ogg");
}

function redraw() {
    currentTime = new Date();

    document.getElementById("stdout_time").innerHTML = "current time: " + convertDateToString(currentTime);
    document.getElementById("stdout_deadline").innerHTML = "complete all tasks by: " + convertDateToString(alarms_deadline);

    // console.log(convertDateToString(currentTime));

    // regenerateTasks();
    if (isRunning == true) {
        regenerateAlarms();
    }
    checkAlarms();

    if (AUDIO == true) {
        // console.log("tick");
        audio_tick.play();
    }
}

function regenerateAlarms() {
    var myNodeList = document.getElementsByTagName("LI");
    var myUL = document.getElementById("myUL");
    clearAlarmState();
    var timeAvailableInMS = alarms_deadline.getTime() - alarms_start.getTime() ;
    var timePerTask = timeAvailableInMS / myNodeList.length;



    for (var i = 0; i < myNodeList.length; i++) {
        // var newDateObj = new Date(alarms_totalAllocationTime + ((timePerTask * (i+1)) * MS_PER_MINUTE));
        var nextAlarm = alarms_start.getTime() + (timePerTask * (i+1));
        console.log(currentTime.getTime());
        var newDateObj = new Date(nextAlarm);
        console.log(newDateObj.getTime());
        alarms.push(newDateObj);
    }

    // console.log(alarms);

    var table_alarms = document.getElementById("table_alarms");

    for (var i = 0; i < alarms.length; i++) {
	if (i == 0) {
		var str = (alarms[i].getHours() < 10 ? '0':'') + alarms[i].getHours()
			+ ":"
			+ (alarms[i].getMinutes() < 10 ? '0':'') + alarms[i].getMinutes()
			+ "\r\n";
	} else {
		var str = "then: "
			+ (alarms[i].getHours() < 10 ? '0':'') + alarms[i].getHours()
			+ ":"
			+ (alarms[i].getMinutes() < 10 ? '0':'') + alarms[i].getMinutes()
			+ "\r\n";
	}
        var row = table_alarms.insertRow(i);
        var cell = row.insertCell(0);
	if (i == 0) {
		cell.style.fontSize = "xx-large";
	}
        cell.innerHTML = str;
    }
}

function regenerateTasks() {
    if (isRunning == false) {
        clearTasksState();
        var table_tasks = document.getElementById("table_tasks");
        for (var i = 0; i < tasks.length; i++) {
            var row = table_tasks.insertRow();
            var cell = row.insertCell(0);
            cell.innerHTML = tasks[i];
        }
    }
}

function session_clear() {
	alert("please clear cookies manually for now");
}

function session_save() {
    setCookie("tasks_cookie", tasks, COOKIE_EXPIRY_IN_DAYS);
}

function setDeadline() {
    var timeAllocatedInMins = document.getElementById("textarea_timeAvailable").value
    console.log(timeAllocatedInMins)
    alarms_deadline = new Date(currentTime.getTime() + (timeAllocatedInMins * MS_PER_MINUTE));
    alarms_start = new Date(currentTime.getTime());
}

function setDeadlineAndGo() {
    clearTasksState();
    setDeadline();
    isRunning = true;
}

function shiftTasksAndAlarms() {
    alarms.shift();
    tasks.shift();
}

function toggleAudio() {
    AUDIO = !AUDIO;
    console.log("audio is: " + AUDIO);
}

/* TODO: dont delete - document code first
function splitTextareaIntoString() {
    var myTextarea = document.getElementById("myTextarea").value;
    var tasks_split = myTextarea.split("\n");


    // remove empty strings from the input
    for (var i = 0; i < tasks_split.length; i++) {
        if (tasks_split[i].length == "") {
            tasks_split.splice(i, 1);
            i--;    // need to rewind index in order to check all elements
        }
    }

    console.log(tasks_split)
    return tasks_split;
}
*/

// -------------------------------------
// a very nice task manager by W3Schools
// -------------------------------------

// Add a "checked" symbol when clicking on a list item
var list = document.querySelector('ul');
list.addEventListener('click', function(ev) {
  if (ev.target.tagName === 'LI') {
    ev.target.classList.toggle('checked');
  }
}, false);

// Create a new list item when clicking on the "Add" button
function newElement(element_name) {
	if (element_name != "newElement") {
		var inputValue = element_name;
		console.log("creating" + element_name);
	} else {
		var inputValue = document.getElementById("input-tasks").value;
	}
	var t = document.createTextNode(inputValue);
	var li = document.createElement("li");

	// create a 'li' item and append a textnode containing the name of the
	// task. this variable is needed by the onclick function below to help
	// find and remove the task when it is deleted with the 'X'
	li.id = inputValue;
	li.appendChild(t);

	if (inputValue === '') {
	    // alert("You must write something!");
	} else {
	    document.getElementById("myUL").appendChild(li);
	    tasks.push(inputValue) // for saving in a cookie
	    console.log(tasks)
	}
	document.getElementById("input-tasks").value = "";

	var span = document.createElement("SPAN");
	var txt = document.createTextNode("\u00D7");
	span.className = "close";
	span.appendChild(txt);
	li.appendChild(span);

	span.onclick = function() {
		var div = this.parentElement;
		var elem = document.getElementById(li.id);
		div.style.display = "none";
		elem.parentNode.removeChild(elem);
	}

	/*
	// Click on a close button to hide the current list item
	var close = document.getElementsByClassName("close");
	var i;
	for (i = 0; i < close.length; i++) {
		close[i].onclick = function() {
			var div = this.parentElement;
			div.style.display = "none";

			var elem = document.getElementById(li.id);
			elem.parentNode.removeChild(elem);
		}
	}
	*/
}

// cookies! this feature only works online (will not work for local pages)
function setCookie(cname,cvalue,exdays) {
    var d = new Date();
    // d.setTime(d.getTime() + (exdays*24*60*60*1000));
    d.setFullYear(d.getFullYear() + 1);
    var expires = "expires=" + d.toUTCString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

function getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function checkCookie() {
    /*
    var user=getCookie("username");
    if (user != "") {
        alert("Welcome again " + user);
    } else {
       user = prompt("Please enter your name:","");
       if (user != "" && user != null) {
           setCookie("username", user, 30);
       }
    }
    */
    var tasks_cookie = getCookie("tasks_cookie");
    if (tasks_cookie != "") {
	// recreate task elements
	tasks_cookie_split = tasks_cookie.split(",");
    	for (var i = 0; i < tasks_cookie_split.length; i++) {
		newElement(tasks_cookie_split[i]);
	}
    }
}


window.onload = function(){
	checkCookie();
	createAudioElements();
	setInterval("redraw()", 1000);
}
