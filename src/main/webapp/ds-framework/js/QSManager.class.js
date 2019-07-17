var QSManager = function(){
	
	var debug = false;
	var popup = false;
	var qsStart = '?', qsChain = '&';
	
	var appendParameters = function(url, jsonParams){
		
		var startChar = '', qs = '', completeUrl = '';
		
		//La chiave  è l'ID dell'elemento il valore  è il nome del parametro in query string
		for (key in jsonParams) {
	        if (jsonParams.hasOwnProperty(key)) {

	        	var outElm = $('#' + key);

	        	if(outElm.length > 0){
	        		
	        		qs+=startChar;
	        		qs+= jsonParams[key] + '=' + outElm.val();
		    		
	        		startChar = qsChain;
	        	}
	        }
	    }
		
		completeUrl = url + (url.indexOf(qsStart) < 0 ? qsStart : qsChain) + qs; 
		
		logMessage('Initial URL: ' + url);			
		logMessage('Complete URL: ' + completeUrl);
		
		return completeUrl;
		
	}

	var appendStaticParameters = function (url, jsonParams) {
		var startChar = '', qs = '', completeUrl = '';

		for (key in jsonParams) {
			if (jsonParams.hasOwnProperty(key)) {
				qs+=startChar;
				qs+= key + '=' + jsonParams[key];
				startChar = qsChain;
			}
		}

		completeUrl = url + (url.indexOf(qsStart) < 0 ? qsStart : qsChain) + qs;

		logMessage('Initial URL: ' + url);
		logMessage('Complete URL: ' + completeUrl);

		return completeUrl;
	}

	var logMessage = function(message){
		
		if(debug){
			if(popup){
				alert(message)
			}else{
				console.log(message);
			}
		}
		
	}
	
	return {
			appendParameters: function(url, jsonParams){
				return appendParameters(url, jsonParams);
			},
		appendStaticParameters: function(url, jsonParams){
			return appendStaticParameters(url, jsonParams);
		}
	}
	
}();