const time_to_wait = 1000; // ms

const thimbles = document.querySelectorAll('.thimble');
const balls = document.querySelectorAll('.ball');

thimbles.forEach(thimble => thimble.addEventListener("click", lift_up));

const height = document.querySelector('input[name="height"]');
const width = document.querySelector('input[name="width"]');
const diameter = document.querySelector('input[name="diameter"]');

const save = document.querySelector('#save');
save.addEventListener("click", on_save);

const update = document.querySelector('#update')
update.addEventListener("click", on_update);

function on_save() {
  const re = /^\d{0,3}$/; 
  if (!(re.test(height.value) && re.test(width.value) && re.test(diameter.value))) {
    console.log("wrong values");
    return;
  }

  for (let thimble of thimbles) {
    thimble.style.height = height.value ? height.value + "px" : "";
    thimble.style.width = width.value ? width.value + "px" : "";
  }

  for (let ball of balls)
    ball.style.height = ball.style.width =
      diameter.value ? diameter.value + "px" : "";
}

function lift_up() {
  const right_thimble = display_ball();
  if (right_thimble == this)
    answer("Right!", 1);
  else if (right_thimble != null)
    answer("Wrong!", -1);

  this.classList.add("thimble-lift-up")
  sleep(time_to_wait).then(_ => {
    this.classList.remove("thimble-lift-up")
  });
}

let displaying_ball = false;
function display_ball() {
  if (displaying_ball) return null;
  displaying_ball = true;

  const index = Math.floor(Math.random() * thimbles.length);
  const thimble = thimbles[index];
  const ball = thimble.nextSibling.nextSibling;
  ball.style.display = 'block';
  sleep(time_to_wait).then(_ => {
    ball.style.display = 'none';
    displaying_ball = false;
  })
  return thimble;
}

function answer(str, inc) {
  const right = document.querySelector('#right');
  right.innerHTML = str
  right.style.display = "block";
  sleep(time_to_wait).then(_ => {
    right.style.display = "none";
  })

  const result = document.querySelector('#result');
  result.value = +result.value + inc;
}

function on_update() {
  document.querySelector('#result').value = 0;
}

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}
