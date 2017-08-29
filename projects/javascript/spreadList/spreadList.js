// TODO
// - spamming the alarm button after alarms are already created causes chaos.
// need to reset state back to beginning

/*
TIMELEFT=int(sys.argv[1])
items = ("make bed", "clean bathroom", "finish dishes", "sweep floors")

for i, item in enumerate(items):
    print("{}: {}".format(TIMELEFT/len(items) * (i+1), item))
*/

var tick = new Audio('tick.wav');
var alarm = new Audio('alarm_guitarReverb.flac');
var alarmEarly = new Audio('alarmWarning_guitarCinematic.flac');
var currentTime;
var alarmArray = [];
var MAGIC_NUMBER = 60000; // 1 min
var ALARM_DELTA_EARLY = 60000 * 5; // 1 min
var ALARM_DELTA = 500; // the amount of difference we can forgive
var playedAlarms = [];
var AUDIO_TICK_PLAY = true;

function checkAlarms() {
    for (i = 0; i < alarmArray.length; i++) {
        var alarmVariance = Math.abs(currentTime.getTime() - alarmArray[i].getTime());
        if (alarmVariance < ALARM_DELTA) {
            alarm.play();
        }
        console.clear();
        console.log(currentTime.getTime());
        console.log(alarmArray[0].getTime());
        console.log(alarmVariance);
    }
}

function checkAlarmsEarly() {
    for (i = 0; i < alarmArray.length; i++) {
        var alarmDeltaEarly = Math.abs(currentTime.getTime() - alarmArray[i].getTime());

        if (alarmDeltaEarly < ALARM_DELTA_EARLY) {
            if (playedAlarms.indexOf(i) == -1) {
                alarmEarly.play();
                playedAlarms.push(i);
            }
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

function main() {
    updateTime();
    checkAlarms();
    checkAlarmsEarly();
    var textarea_split = splitTextareaIntoString();
    var timeAvailable = document.forms["myForm"]["myForm_timeAvailable"].value;
    createAlarms(textarea_split, timeAvailable);
    stdout_alarms(textarea_split, alarmArray);
    setInterval(updateTime, 1000);
}

function createAlarms(array, timeInMinutes) {
    var numTasks = array.length;
    var timePerTask = timeInMinutes / numTasks;

    for (i = 0; i < numTasks; i++) {
        var newDateObj = new Date(currentTime.getTime() + ((timePerTask * (i+1)) * MAGIC_NUMBER));
        alarmArray.push(newDateObj);
    }
}

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

function stdout_alarms(array, alarmArray) {
    var myTable = document.getElementById("myTable");

    for (i = 0; i < alarmArray.length; i++) {
        var str = array[i] + " must be completed by: "
            + (alarmArray[i].getUTCHours() < 10 ? '0':'') + alarmArray[i].getUTCHours()
            + ":"
            + (alarmArray[i].getUTCMinutes() < 10 ? '0':'') + alarmArray[i].getMinutes()
            + "\r\n";
        var row = myTable.insertRow(i);
        var cell = row.insertCell(0);
        cell.innerHTML = str;
    }
}

function stdout_time(string) {
    document.getElementById("stdout_time").innerHTML = "current time " + string;
}

function updateTime() {
    currentTime = new Date();

    // some fancy trickery to make sure there is always a zero in front of
    // single digits
    var hours = (currentTime.getHours() < 10? '0':'') + currentTime.getHours();
    var minutes = (currentTime.getMinutes() < 10? '0':'') + currentTime.getMinutes();
    var seconds = (currentTime.getSeconds() < 10? '0':'') + currentTime.getSeconds();
    stdout_time(hours + ":" + minutes + ":" + seconds);

    if (AUDIO_TICK_PLAY == true) {
        tick.play();
    }
}
