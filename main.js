var start = document.getElementById('startButton');
var stop = document.getElementById('stopButton');
var reset = document.getElementById('resetButton');
var stopWatch = document.getElementById('stopWatch');

let startTime;
let elapsedTime = 0;
let intervalTime;

start.addEventListener('click',function(){
    start.disabled = true;
    stop.disabled = false;
    reset.disabled = false;
    startTime = Date.now() - elapsedTime;
    intervalTime = setInterval(function(){
        elapsedTime = Date.now() - startTime;
        updateStopwatch(elapsedTime);
    },10);
})

stop.addEventListener('click',function(){
    start.disabled = false;
    stop.disabled = true;
    reset.disabled = false;
    clearInterval(intervalTime);
})

reset.addEventListener('click',function(){
    start.disabled = false;
    stop.disabled = true;
    reset.disabled = true;
    clearInterval(intervalTime);
    elapsedTime = 0;
    updateStopwatch(intervalTime);
})

function updateStopwatch(elapsedTime) {
    let h = Math.floor(elapsedTime / 3600000);
    let m = Math.floor((elapsedTime / 60000) % 60);
    let s = Math.floor((elapsedTime / 1000) % 60);
    let ms = Math.floor((elapsedTime % 1000) / 100);
    stopWatch.textContent = `${h}:${m}:${s}:${ms}`;
}