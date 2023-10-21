
function getRandomInt(max) {
  return Math.floor(Math.random() * max);
}

function toggleFullScreen() {
  if (!document.fullscreenElement) {
    document.documentElement.requestFullscreen();
  } else if (document.exitFullscreen) {
    document.exitFullscreen();
  }
}

function keyDown(event) {
  let key = event.key;
  if (key.length === 1) {
    const letter = document.getElementById("letter");
    const random = document.getElementById("random");
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
