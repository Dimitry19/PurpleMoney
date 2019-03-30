<%@ include file="/common/includes/utils/taglibs_nocache.jspf" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
    <div  class="notifSuccess alert alert-success alert-dismissible">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <s:text name="common.logout.success"></s:text>
    </div>
    <script>
        console.log("TOAST")
        $('.notifSuccess').hide(7000);
    </script>