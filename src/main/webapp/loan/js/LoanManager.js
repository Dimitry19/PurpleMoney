var LoanManager;
LoanManager = function () {

    var debug = true;




    function calcolate(elt,jsonObj) {
        console.log("calcolate");
        var importo=$(elt).val();
	    var idTaxLoan = '#' + jsonObj.taxLoan;
	    var idTotalLoan = '#' + jsonObj.totalLoan;

	    var taxLoan=$(idTaxLoan).val();
	    var tax=importo*taxLoan/100;

	    var totalLoan= +roundNumber(importo,12)+roundNumber(tax,12);

	    console.log($(idTotalLoan));
	    $(idTotalLoan).val("DEMO");
	    $(idTotalLoan).prop("disabled",true);
	    console.log(totalLoan);
    }



	function roundNumber(number, decimals) {
		var newnumber = new Number(number+'').toFixed(parseInt(decimals));
		return parseFloat(newnumber);
	}


    return {
        calcolateAmountToBack:function(elt,jsonObj){
	        calcolate(elt,jsonObj);
        }
    }

}();
