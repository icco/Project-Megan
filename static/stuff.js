$(document).ready(function() {
   var values = {};
   $('#theForm').submit(function() {
      $.each($('#theForm').serializeArray(), function(i, field) {
         values[field.name] = field.value;
      });

      $.post("/", values, function(data) {
         console.log(data);
      });

      // to prevent an actual reload.
      return false;
   });

});
