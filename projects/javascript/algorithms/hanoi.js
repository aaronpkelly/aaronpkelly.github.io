function hanoi(height, start, end, auxiliary) {
    if (height > 0) {
        hanoi(height - 1, start, auxiliary, end);
        setOutput(start + "=>" + end);
        hanoi(height - 1, auxiliary, end, start);
    }
}

function setOutput(string) {
	// document.getElementById("output").innerHTML = "test";
    console.log(string);
}

hanoi(3, "start", "end", "middle");
