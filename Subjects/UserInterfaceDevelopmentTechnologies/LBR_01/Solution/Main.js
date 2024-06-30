var surnameInput = document.getElementById("surname");
var surnameErrorMessage = document.getElementById("surnameErrorMessage");

var nameInput = document.getElementById("name");
var nameErrorMessage = document.getElementById("nameErrorMessage");

var emailInput = document.getElementById("email");
var emailInputError = document.getElementById("emailErrorMessage");

var phoneNumber = document.getElementById("phoneNumber");
var phoneNumberErrorMessage = document.getElementById("phoneNumberErrorMessage");

var tellAboutYourself = document.getElementById("tellAboutYourself");
var tellAboutYourselfError = document.getElementById("tellAboutYourselfErrorMessage");

var study = document.getElementById("study");
var city =  document.getElementById("city");
var course = document.querySelector('input[name="course"]:checked');

var checkButton = document.getElementById("checkButton");

function checkInputAndFormulateErrorForName(input, errorMessage) {
  var inputValue = input.value;
  errorMessage.textContent = "";

  var engAndRusSymbols = /^[a-zA-Zа-яА-Я]+$/;
  if(inputValue == 0) {
    errorMessage.textContent = "Поле не должно быть пустым";
    errorMessage.style.color = "red";
  }
  else if (!engAndRusSymbols.test(inputValue)) {
    errorMessage.textContent = "Поле должно содержать только символы русского и английского алфавита";
    errorMessage.style.color = "red";
  }
  else if (inputValue.length > 20) {
    errorMessage.textContent = "Размер поля не должен превышать 20 символов";
    errorMessage.style.color = "red";
  }
}

function checkEmailInput(input, errorMessage) {
  var inputValue = input.value;

  var emailString = /^[a-zA-Z\d]@[a-zA-Z]{2,5}.[a-zA-Z]{2,3}$/;
  if (inputValue == 0) {
    errorMessage.textContent = "Поле не должно быть пустым";
    errorMessage.style.color = "red";
  }
  else if (!emailString.test(inputValue)) {
    errorMessage.textContent = "Недопустимый формат поля";
    errorMessage.style.color = "red";
  }
}

function checkPhoneNumber(input, errorMessage) {
  var inputValue = input.value;
  errorMessage.textContent = "";

  var phoneNumRegex = /^\(0\d\d\)\d\d\d-\d\d-\d\d$/;

  if(inputValue == 0) {
    errorMessage.textContent = "Поле не должно быть пустым";
    errorMessage.style.color = "red";
  }
  else if (!phoneNumRegex.test(inputValue)) {
    errorMessage.textContent = "Недопустимый формат поля";
    errorMessage.style.color = "red";
  }
}

function checkAboutYourself(input, errorMessage) {
  var inputValue = input.value;
  errorMessage.textContent = "";
  
  if(inputValue == 0) {
    errorMessage.textContent = "Поле не должно быть пустым";
    errorMessage.style.color = "red";
  }
  else if (inputValue.length > 250) {
    errorMessage.textContent = "Размер поля не должен превышать 250 символов";
    errorMessage.style.color = "red";
  }
}

function checkValForm() {
  if (city == 1 && !study && course.value !== "3"){
    alert("Данные успешно отправлены на сервер");
  }
  else {
    var confirmed = confirm("Вы уверены в своих ответах?");
    if(confirmed) {
      alert("Данные отправлены на сервер");
    }
    else {
      alert("Данные не отправлены на сервер");
    }
  }
}

checkButton.addEventListener("click", function() {
  checkInputAndFormulateErrorForName(surnameInput, surnameErrorMessage);
  checkInputAndFormulateErrorForName(nameInput, nameErrorMessage);
  checkEmailInput(emailInput, emailInputError);
  checkPhoneNumber(phoneNumber, phoneNumberErrorMessage);
  checkAboutYourself(tellAboutYourself, tellAboutYourselfError);
  checkValForm(study, city, course);
});

