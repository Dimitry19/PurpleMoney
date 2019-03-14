var MapManager;
MapManager=function(){

    function draw() {

        var datas={
            origin: $('#mapForm').find('input[id="originId"]').val(),
            destination:$('#mapForm').find('input[id="destinationId"]').val()
        }
        var action='/purplemoney/mapsearchAction.do';//?origin='+datas.origin+'&destination='+datas.origin;

        console.log(JSON.stringify(datas));

        $('#searchMapBtn').click(function(){
            $.ajax({
                traditional: true,
                type: 'POST',
                url: action,
                //dataType: 'json',
                data: {origin: datas.origin, destination: datas.destination},
               //data: JSON.stringify(datas),
                success: function(response) {
                    console.log(response);
                   // div.html(response);
                },
                error: function(xhr, ajaxOptions, thrownError){
                    alert('An error occurred! ' + thrownError);
                },
            });
        });
    }

    function drawing() {
        draw()
    }
    return {
        drawRoute:function () {
            drawing();
        }
    }
}();
