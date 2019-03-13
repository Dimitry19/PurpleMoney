package cam.googleUtils.converters;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.sql.Connection;
import java.util.List;

import cam.googleUtils.converters.response.GoogleResponse;
import cam.googleUtils.converters.results.Result;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.maps.GeoApiContext;
import com.google.maps.GeocodingApi;
import com.google.maps.errors.ApiException;
import com.google.maps.model.GeocodingResult;
import org.apache.commons.io.IOUtils;
import org.codehaus.jackson.map.DeserializationConfig;
import org.codehaus.jackson.map.ObjectMapper;

public class AddressConverter {
    /*
     * Geocode request URL. Here see we are passing "json" it means we will get
     * the output in JSON format. You can also pass "xml" instead of "json" for
     * XML output. For XML output URL will be
     * "http://maps.googleapis.com/maps/api/geocode/xml";
     */

    private static final String URL = "http://maps.googleapis.com/maps/api/geocode/json";
    private static final String API_KEY="AIzaSyCbqWY9UOtRQwVYOxv-VfTn93F-nGLwWW8";

    /*
     * Here the fullAddress String is in format like
     * "address,city,state,zipcode". Here address means "street number + route"
     * .
     */
    public GoogleResponse convertToLatLong(String con,String fullAddress) throws IOException {

        /*
         * Create an java.net.URL object by passing the request URL in
         * constructor. Here you can see I am converting the fullAddress String
         * in UTF-8 format. You will get Exception if you don't convert your
         * address in UTF-8 format. Perhaps google loves UTF-8 format. :) In
         * parameter we also need to pass "sensor" parameter. sensor (required
         * parameter) — Indicates whether or not the geocoding request comes
         * from a device with a location sensor. This value must be either true
         * or false.
         */
        URL url = new URL(URL + "?address="
                + URLEncoder.encode(fullAddress, "UTF-8") + "&key="+API_KEY);
        // Open the Connection
        URLConnection conn = url.openConnection();

        InputStream in = conn.getInputStream() ;
        ObjectMapper mapper = new ObjectMapper();
        mapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        GoogleResponse response = (GoogleResponse)mapper.readValue(in,GoogleResponse.class);
        in.close();
        return response;


    }

    public GoogleResponse convertFromLatLong(String latlongString) throws IOException {

        URL url = new URL(URL + "?latlng="
                + URLEncoder.encode(latlongString, "UTF-8") + "&key="+API_KEY);
        // Open the Connection
        URLConnection conn = url.openConnection();

        InputStream in = conn.getInputStream() ;
        ObjectMapper mapper = new ObjectMapper();
        mapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);
        GoogleResponse response = (GoogleResponse)mapper.readValue(in,GoogleResponse.class);
        in.close();
        return response;


    }





    public  static GeocodingResult[] convertToLatLong(String address)  {
        GeoApiContext context = new GeoApiContext.Builder()
                .apiKey(API_KEY)
                .build();
        GeocodingResult[] results = new GeocodingResult[0];
        try {
            results = GeocodingApi.geocode(context,
                    address).await();
        } catch (ApiException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        Gson gson = new GsonBuilder().setPrettyPrinting().create();

        return results;
        //System.out.println(gson.toJson(results[0].geometry));
    }




    private  static void test()  {
        GeoApiContext context = new GeoApiContext.Builder()
                .apiKey(API_KEY)
                .build();
        GeocodingResult[] results = new GeocodingResult[0];
        try {
            results = GeocodingApi.geocode(context,
                    "Douala,Littoral,Cameroon").await();
        } catch (ApiException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        Gson gson = new GsonBuilder().setPrettyPrinting().create();


        System.out.println(gson.toJson(results[0].geometry.location.lat));
        System.out.println(gson.toJson(results[0].geometry.location.lng));
    }


    public static void main(String[] args) throws IOException {

        test();

        GoogleResponse res = new AddressConverter().convertToLatLong(null,"Apollo Bunder,Mumbai ,Maharashtra, India");
        if(res.getStatus().equals("OK"))
        {
            for(Result result : res.getResults())
            {
                System.out.println("Lattitude of address is :"  +result.getGeometry().getLocation().getLat());
                System.out.println("Longitude of address is :" + result.getGeometry().getLocation().getLng());
                System.out.println("Location is " + result.getGeometry().getLocation_type());
            }
        }
        else
        {
            System.out.println(res.getStatus());
        }

       /* System.out.println("\n");
        GoogleResponse res1 = new AddressConverter().convertFromLatLong("18.92038860,72.83013059999999");
        if(res1.getStatus().equals("OK"))
        {
            for(Result result : res1.getResults())
            {
                System.out.println("address is :"  +result.getFormatted_address());
            }
        }
        else
        {
            System.out.println(res1.getStatus());
        }*/

    }
}