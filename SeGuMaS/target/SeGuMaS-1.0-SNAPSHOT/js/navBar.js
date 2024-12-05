/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

$(document).ready(function () {
  $('.dropdown').each(function () {
    var $dropdown = $(this);

    $(".dropdown-link", $dropdown).click(function (e) {
      e.preventDefault();

      // Check if the clicked link is already active
      var isActive = $(this).hasClass("active");

      // Hide all submenus and remove the "active" class from all links
      $(".submenu").hide();
      $(".dropdown-link").removeClass("active");

      if (!isActive) {
        // Show the submenu and add the "active" class only if not already active
        $div = $(".submenu", $dropdown);
        $div.show();
        $(this).addClass("active");
      }

      return false;
    });
  });

  // Hide all submenus when clicking outside of the dropdown
  $('html').click(function () {
    $(".submenu").hide();
    
    // Remove the "active" class from all dropdown links
    $(".dropdown-link").removeClass("active");
  });
});