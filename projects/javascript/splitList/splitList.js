// TODO
// - spamming the alarm button after alarms are already created causes chaos.
// need to reset state back to beginning

/*
TIMELEFT=int(sys.argv[1])
items = ("make bed", "clean bathroom", "finish dishes", "sweep floors")

for i, item in enumerate(items):
    print("{}: {}".format(TIMELEFT/len(items) * (i+1), item))
*/

var ALARM_DELTA = 500; // the amount of difference we can forgive
var ALARM_DELTA_EARLY = 60000 * 5; // 1 min
var AUDIO = true;
var MAGIC_NUMBER = 60000; // 1 min
var isRunning = false;
var alarm = new Audio('alarm_guitarReverb.flac');
var alarmEarly = new Audio('alarmWarning_guitarCinematic.flac');
var alarms = [];
var currentTime;
var alarmTime;
var playedAlarms = [];
var table_alarms = document.getElementById("table_alarms");
var tasks = []
var tick = new Audio('tick.wav');

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

function checkAlarms() {
    for (i = 0; i < alarms.length; i++) {
        var alarmVariance = Math.abs(currentTime.getTime() - alarms[i].getTime());
        if (alarmVariance < ALARM_DELTA) {
            if (AUDIO == true) {
                alarm.play();
            }
        }
        if (alarmVariance < ALARM_DELTA_EARLY) {
            if (playedAlarms.indexOf(i) == -1) {
                if (AUDIO == true) {
                    alarmEarly.play();
                }
                playedAlarms.push(i);
            }
        }
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

function checkUserInput() {
    var key = window.event.keyCode;

    if (key == 13) {
        addTask();
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

function redraw() {
    document.getElementById("stdout_time").innerHTML = "current time: " + updateTime();
    regenerateTasks();
    if (isRunning == true) {
        regenerateAlarms();
    }
    checkAlarms();

    if (AUDIO == true) {
        console.log("tick");
        tick.play();
    }
}

function regenerateAlarms() {
    clearAlarmState();
    var timeInMinutes = document.forms["myForm"]["myForm_timeAvailable"].value;
    var timePerTask = timeInMinutes / tasks.length;

    for (var i = 0; i < tasks.length; i++) {
        var newDateObj = new Date(alarmTime.getTime() + ((timePerTask * (i+1)) * MAGIC_NUMBER));
	alarms.push(newDateObj);
    }

    var table_alarms = document.getElementById("table_alarms");

    for (var i = 0; i < alarms.length; i++) {
        var str = tasks[i] + " must be completed by: "
            + (alarms[i].getHours() < 10 ? '0':'') + alarms[i].getHours()
            + ":"
            + (alarms[i].getMinutes() < 10 ? '0':'') + alarms[i].getMinutes()
            + "\r\n";
        var row = table_alarms.insertRow(i);
        var cell = row.insertCell(0);
        cell.innerHTML = str;
    }
}

function regenerateTasks() {
    clearTasksState();
    var table_tasks = document.getElementById("table_tasks");
    for (var i = 0; i < tasks.length; i++) {
        var row = table_tasks.insertRow();
        var cell = row.insertCell(0);
        cell.innerHTML = tasks[i];
    }
}

function shiftTasksAndAlarms() {
    alarms.shift();
    tasks.shift();
}

function toggleAudio() {
    AUDIO = !AUDIO;
    console.log("audio is: " + AUDIO);
}

function toggleRunning() {
    isRunning = true;
    alarmTime = new Date();
}

/*  TODO: dont delete - document code first
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

function updateTime() {
    currentTime = new Date();

    // some fancy trickery to make sure there is always a zero in front of
    // single digits
    var hours = (currentTime.getHours() < 10? '0':'') + currentTime.getHours();
    var minutes = (currentTime.getMinutes() < 10? '0':'') + currentTime.getMinutes();
    var seconds = (currentTime.getSeconds() < 10? '0':'') + currentTime.getSeconds();
    return hours + ":" + minutes + ":" + seconds;
}

window.onload = function(){
        setInterval("redraw()", 1000);
}
