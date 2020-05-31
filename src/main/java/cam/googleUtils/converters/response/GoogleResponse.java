package cam.googleUtils.converters.response;

import cam.googleUtils.converters.results.Result;

public class GoogleResponse {


    private Result[] result ;
    private String status ;
    public Result[] getResults() {
        return result;
    }
    public void setResults(Result[] result) {
        this.result= result;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }



}