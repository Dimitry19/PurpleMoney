package cm.purplemoney.common.usr.action;

import cam.googleUtils.converters.AddressConverter;
import cam.googleUtils.converters.response.GoogleResponse;
import cam.googleUtils.converters.results.Result;
import cm.purplemoney.common.ent.vo.MapDestinationVO;
import cm.purplemoney.common.ent.vo.MapOriginVO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.maps.model.GeocodingResult;
import com.opensymphony.xwork2.Preparable;
import org.apache.struts2.interceptor.SessionAware;
import org.geonames.*;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import static cm.purplemoney.constants.PortalConstants.ACCOUNT_GEONAME_WS;

@Component("mapAction")
@Scope("prototype")
public class MapAction extends BaseAction implements SessionAware,Preparable {


    private MapOriginVO origin;
    private MapDestinationVO destination;
    @Override
    public void prepare() throws Exception {

    }
    @Override
    public String execute() throws Exception{

        return SUCCESS;
    }

    public String map() throws Exception{

        return SUCCESS;
    }
    public String search() throws Exception{

        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        AddressConverter addressConverter= new AddressConverter();
        GeocodingResult[] results=addressConverter.convertToLatLong(origin.getFormat());

        System.out.println(gson.toJson(results[0].geometry.location.lat));
        System.out.println(gson.toJson(results[0].geometry.location.lng));
        results=addressConverter.convertToLatLong(destination.getFormat());
        System.out.println(gson.toJson(results[0].geometry.location.lat));
        System.out.println(gson.toJson(results[0].geometry.location.lng));


        return SUCCESS;
    }

    public MapOriginVO getOrigin() {
        return origin;
    }

    public void setOrigin(MapOriginVO origin) {
        this.origin = origin;
    }

    public MapDestinationVO getDestination() {
        return destination;
    }

    public void setDestination(MapDestinationVO destination) {
        this.destination = destination;
    }
}
