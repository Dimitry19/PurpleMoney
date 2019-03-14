package cm.purplemoney.common.ent.vo;

public class MapLatLonCoordinates {

    private MapOriginVO origin;
    private MapDestinationVO destination;
    private Double latOrigin;

    private Double latDestination;
    private Double lonOrigin;
    private Double lonDestination;

    public Double getLatOrigin() {
        return latOrigin;
    }

    public void setLatOrigin(Double latOrigin) {
        this.latOrigin = latOrigin;
    }

    public Double getLatDestination() {
        return latDestination;
    }

    public void setLatDestination(Double latDestination) {
        this.latDestination = latDestination;
    }

    public Double getLonOrigin() {
        return lonOrigin;
    }

    public void setLonOrigin(Double lonOrigin) {
        this.lonOrigin = lonOrigin;
    }

    public Double getLonDestination() {
        return lonDestination;
    }

    public void setLonDestination(Double lonDestination) {
        this.lonDestination = lonDestination;
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
