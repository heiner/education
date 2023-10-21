
function getRandomInt(max: number) {
  return Math.floor(Math.random() * max);
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
        const letter = document.getElementById("letter") as HTMLDivElement;
        const random = document.getElementById("random") as HTMLInputElement;
        if (!random.checked || getRandomInt(2) === 1) {
            key = key.toUpperCase();
        }
        letter.innerHTML = key;
    } else if (key == "Enter") {
        toggleFullScreen();
    }
}

window.addEventListener("DOMContentLoaded", (event) => {
    document.addEventListener("keydown", keyDown, false);
});
