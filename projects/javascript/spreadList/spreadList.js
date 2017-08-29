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
var dateArray = [];
var MAGIC_NUMBER = 60000; // 1 min
var ALARM_DELTA_EARLY = 60000 * 5; // 1 min
var ALARM_DELTA = 500; // the amount of difference we can forgive
var playedAlarms = [];

function checkAlarms() {
    for (i = 0; i < dateArray.length; i++) {
        var alarmVariance = Math.abs(currentTime.getTime() - dateArray[i].getTime());
        if (alarmVariance < ALARM_DELTA) {
            alarm.play();
        }
        console.clear();
        console.log(currentTime.getTime());
        console.log(dateArray[0].getTime());
        console.log(alarmVariance);

    }
}

function checkAlarmsEarly() {
    for (i = 0; i < dateArray.length; i++) {
        var alarmDeltaEarly = Math.abs(currentTime.getTime() - dateArray[i].getTime());

        if (alarmDeltaEarly < ALARM_DELTA_EARLY) {
            if (playedAlarms.indexOf(i) == -1) {
                alarmEarly.play();
                playedAlarms.push(i);
            }
        }
    }
    console.log(playedAlarms);
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
    var split = splitTextArea();
    var timeAvailable = document.forms["myForm"]["myForm_timeAvailable"].value;
    prepareSpreadlist(split, timeAvailable);
    stdout_alarms(dateArray);
    setInterval(updateTime, 1000);
}

function prepareSpreadlist(array, timeInMinutes) {
    var numTasks = array.length;
    var timePerTask = timeInMinutes / numTasks;

    for (i = 0; i < numTasks; i++) {
        var newDateObj = new Date(currentTime.getTime() + ((timePerTask * (i+1)) * MAGIC_NUMBER));
        dateArray.push(newDateObj);
    }
}

function splitTextArea() {
    var myTextArea = document.getElementById("myTextArea").value;
    var tasks_split = myTextArea.split("\n");
    return tasks_split;
}

function stdout_alarms(alarmArray) {
    var myTable = document.getElementById("myTable");

    for (i = 0; i < alarmArray.length; i++) {
        var str = "alarm " + i + ": " + alarmArray[i] + "\r\n";
        var row = myTable.insertRow(i);
        var cell = row.insertCell(0);
        cell.innerHTML = str;
    }
}

function stdout_time(string) {
    document.getElementById("stdout_time").innerHTML = string;
}

function updateTime() {
    currentTime = new Date();
    var hours = currentTime.getHours();
    var minutes = currentTime.getMinutes();
    var seconds = currentTime.getSeconds();
    stdout_time(hours + ":" + minutes + ":" + seconds);
    tick.play();
    checkAlarms();
    checkAlarmsEarly();
}

