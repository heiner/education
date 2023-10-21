
let changes = 0;
let keyDowns = 0;

// Standard Normal variate using Box-Muller transform.
function gaussianRandom(mean = 0, stdev = 1) {
    const u = 1 - Math.random();
    const v = Math.random();
    const z = Math.sqrt(-2.0 * Math.log(u)) * Math.cos(2.0 * Math.PI * v);
    // Transform to the desired mean and standard deviation:
    return z * stdev + mean;
}

function setState(state: string) {
    const letter = document.getElementById("letter") as HTMLDivElement;
    const current = letter.innerHTML.trim();
    if (state === current) {
        return false;
    }
    letter.innerHTML = state;
    return true;
}

function toggleFullScreen() {
    if (!document.fullscreenElement) {
        document.documentElement.requestFullscreen();
    } else if (document.exitFullscreen) {
        document.exitFullscreen();
    }
}

function keyDown(event: KeyboardEvent) {
    let key = event.key;
    if (key.length === 1) {
        ++keyDowns;
        const alternate = document.getElementById("alternate") as HTMLInputElement;
        const size = document.getElementById("size") as HTMLInputElement;
        const letter = document.getElementById("letter") as HTMLDivElement;
        if (!alternate.checked || changes % 2 === 1) {
            key = key.toUpperCase();
        }
        if (setState(key)) {
            ++changes;
            letter.style.fontStyle = changes % 5 == 0 ? "italic" : "normal";
        }
        console.log(`spin${keyDowns % 2} 0.2s linear 1`);
        if (size.checked) {
            letter.style.fontSize = `${gaussianRandom(500, 100)}px`;
        }
        letter.style.color =
            `rgb(${100 * Math.random()}%, ${100 * Math.random()}%, ${100 * Math.random()}%)`;
        letter.style.animation = `spin${keyDowns % 2} 0.2s linear 1`;
    } else if (key == "Enter") {
        toggleFullScreen();
    }
}

window.addEventListener("DOMContentLoaded", (event) => {
    document.addEventListener("keydown", keyDown, false);
});
