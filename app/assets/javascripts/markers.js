document.addEventListener("turbolinks:load", function () {
  document.addEventListener("ajax:success", function (event) {
    let response = event.detail;
    console.log(response);
  });

  document.addEventListener("ajax:error", function (event) {
    let errors = event.detail[0];
    let error_string = "";

    for (let prop in errors) {
      error_string = prop + ": " + errors[prop];
    }
    alert(error_string);
  });
});
