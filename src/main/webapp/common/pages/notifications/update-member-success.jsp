<%@ include file="/common/includes/utils/taglibs_nocache.jspf" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
    <div  class="notifSuccess alert alert-success alert-dismissible fade show">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <strong><s:text name="member.add.toast"></s:text> : </strong><s:text name="member.edit.sucess"></s:text>
    </div>
    <script>
        console.log("TOAST")
        $('.notifSuccess').hide(7000);
    </script>