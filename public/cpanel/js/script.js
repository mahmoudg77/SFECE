

function Success(message) {
  iziToast.show({
                title: 'Success',
                message: message,
                color: 'green', // blue, red, green, yellow
                position: 'topCenter',
            });
}

function Error(message) {
  iziToast.show({
                title: 'Error',
                message: message,
                color: 'red', // blue, red, green, yellow
                position: 'topCenter',
            });
}
function Notice(message) {
  iziToast.show({
                title: 'Notice',
                message: message,
                color: 'yellow', // blue, red, green, yellow
                position: 'topCenter',
            });
}
function Info(message) {
  iziToast.show({
                title: 'Info',
                message: message,
                color: 'blue', // blue, red, green, yellow
                position: 'topCenter',
            });
}

$(function(){
  $("body").on("click", ".edit, .delete, .view", function (e) {
     var btn = $(this);

         e.preventDefault();

        $('#myModal').modal('show');
        $("#myModal .modal-body").html("<div class='text-center'><img src='{{asset('cpanel/images/loading-bar.gif')}}'/></div>");

        $("#myModal .modal-body").load(btn.attr("href"), function (data, status, xhr) {

            if (btn.hasClass("edit")) {
                $("#myModal .modal-title").html("Edit");
            } else if (btn.hasClass("delete")) {
                $("#myModal .modal-title").html("Delete");
            } else if (btn.hasClass("details")) {
                $("#myModal .modal-title").html("Details");
            }

            if (status == "error") {
                $("#myModal .modal-body").html("<div class='alert alert-danger text-center'><strong>Sorry; </strong>" + xhr.status + " " + xhr.statusText + "</div>");
                return;
            }

            $("#myModal .modal-body  .back").hide();

            $("#myModal .modal-body form").ajaxForm({
                dataType: "json",
                success: function (data) {

                    if (data.type == 'success') {
                        Success(data.message);

                        $('#myModal').modal('toggle');
                        // if (window.location.href.indexOf("/Projects/Wizard/") > -1) {
                        //     $(".projects ul li.active > a").click();
                        // } else {
                            window.location = window.location;
                        // }

                    } else {
                      Error(data.message);

                    }


                },
                error: function (data, status, xhr) {
                    // var obj = JSON.parse(data.responseText);
                    Error( data.status + " " + xhr);
                     
                }
            });

            $('.date').datetimepicker({
                timepicker: false,
                ampm: true, // FOR AM/PM FORMAT
                format: 'Y-m-d',
            });
            $('.datetime').datetimepicker({
                timepicker: true,
                ampm: true, // FOR AM/PM FORMAT
                format: 'Y-m-d g:i A',
                step: 15
            });
            $('.time').datetimepicker({
                timepicker: true,
                ampm: true, // FOR AM/PM FORMAT
                format: 'g:i A',
                step: 5,
                minDate: new Date(),
                maxDate: new Date(),
                datepicker: false

            });
            $('.color').colorpicker({});
            $('.multiselect').multiselect({
                includeSelectAllOption: true,
                maxHeight: 200
                /*allSelectedText: 'All'*/
            });
        }, function (data, status, xhr) {
            $("#myModal .modal-body").html("<div class='alert alert-danger text-center'><strong>Sorry; </strong>" + xhr.status + " " + xhr.statusText + "</div>");
        });



  });

});
