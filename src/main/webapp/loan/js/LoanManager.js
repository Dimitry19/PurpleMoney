var LoanManager;
LoanManager = function () {

    var debug = true;




    function calcolate(elt,jsonObj) {
        console.log("calcolate");
        var importo=$(elt).val();
	    var idTaxLoan = '#' + jsonObj.taxLoanId;

	    var taxLoan=$(idTaxLoan).val();
	    var tax=importo*taxLoan/100;

	    var totalLoan= +roundNumber(importo,12)+roundNumber(tax,12);

	   $('input[name="loan.amountToBack"]').val(totalLoan);

    }

	function checkDate(elt,jsonObj) {
		console.log("checkDate");

		var dateId = '#' + jsonObj.dateId;

		var idForm = '#' + jsonObj.idForm;
		var form = $(idForm)
		var currentDate   = new Date($(elt).val());
		var date2 = new Date($(dateId).val());
		console.log(currentDate);
		console.log(date2);
		if (form[0].checkValidity() === false) {
			event.preventDefault()
			event.stopPropagation()
		}

		form.addClass('was-validated');
/*
* date1 > date2;  //false
date1 < date2;  //true
date1 >= date2; //false
date1 <= date2; //true*/
	}




	function roundNumber(number, decimals) {
		var newnumber = new Number(number+'').toFixed(parseInt(decimals));
		return parseFloat(newnumber);
	}


    return {
        calcolateAmountToBack:function(elt,jsonObj){
	        calcolate(elt,jsonObj);
        },
	    checkDate:function (elt,jsonObj) {
		    checkDate(elt,jsonObj);
	    }
    }

}();
