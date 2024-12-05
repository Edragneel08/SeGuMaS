/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

select_form = document.querySelector(".select_form");
fields = document.querySelectorAll(".field");

select_form.addEventListener("change", function() {
  fields.forEach(function(el) {
    el.style.display = "none";
  });
  show = document.querySelectorAll("." + this.value);
  show.forEach(function(el) {
    el.style.display = "block";
  });
});


