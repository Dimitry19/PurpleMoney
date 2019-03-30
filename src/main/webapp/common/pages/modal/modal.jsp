<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<!--Modal-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
                <h4 class="modal-title modal-title-custom" id="myModalLabel"><s:text name="common.show.detail"></s:text></h4>
            </div>
            <div class="modal-body">
                <div class="insertHere"></div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn  btn-md btn btn-secondary buttons-collection  buttons-page-length" data-dismiss="modal">
                    <i class="fa fa-times-circle"></i>&nbsp;<s:text name="common.label.btn.close"></s:text>
                </button>
            </div>
        </div>
    </div>
</div>
</div>