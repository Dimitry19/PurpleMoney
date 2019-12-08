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

	   $('input[name="loanWr.loan.amountToBack"]').val(totalLoan);

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
