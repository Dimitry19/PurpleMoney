<%@ taglib prefix="s" uri="/struts-tags" %>

<s:set var="inputMaskMobileNumPattern">{type: 'Regex', options: {alias: 'numeric'}, fixChromium: true, replaceRegEx: [/[^0-9]/g]}</s:set>