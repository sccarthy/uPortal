<%--

    Licensed to Jasig under one or more contributor license
    agreements. See the NOTICE file distributed with this work
    for additional information regarding copyright ownership.
    Jasig licenses this file to you under the Apache License,
    Version 2.0 (the "License"); you may not use this file
    except in compliance with the License. You may obtain a
    copy of the License at:

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on
    an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied. See the License for the
    specific language governing permissions and limitations
    under the License.

--%>

<jsp:directive.include file="/WEB-INF/jsp/include.jsp"/>

<c:set var="n"><portlet:namespace/></c:set>

<script src="<rs:resourceURL value="/rs/jquery/1.6.1/jquery-1.6.1.min.js"/>" type="text/javascript"></script>

<script type="text/javascript">
    var ${n} = ${n} || {}; // create a unique variable for our JS namespace
    ${n}.jQuery = jQuery.noConflict(true); // assign jQuery to this namespace

    ${n}.jQuery(function () {
        var $ = ${n}.jQuery; //reassign $ for normal use of jQuery

        // Display and use the attachments feature only if it's present
        if(typeof upAttachments != "undefined") {
            var setAttachment = function(attachment) {
                $('#${n}config #iconUrl').val(attachment.path);
            };
            ${n}.addAttachmentCallback = function(result) {
                setAttachment(result);
                upAttachments.hide();
            };
            $('#${n}config #upload').show();
        }
    });
</script>

<style>
#${n}config .field-error {
    display: none;
    padding: 3px;
    margin: 0 5px;
}
<c:forEach items="${invalidFields}" var="fieldName"> 
#${n}config .${fieldName} .field-error { display: block; }
</c:forEach>
</style>

<div id="${n}config">
    <h2><spring:message code="app-launcher.configure.new.app"/></h2>

    <form role="form" class="form-horizontal" method="POST" action="<portlet:actionURL/>">
        <div class="form-group appUrl">
            <label for="appUrl" class="col-sm-2 control-label"><spring:message code="app-launcher.appUrl"/></label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="appUrl" id="appUrl" value="${appDefinition.appUrl}" placeholder="https://www.yourapp.edu/">
                <div class="field-error bg-danger"><spring:message code="app-launcher.appUrl.invalid"/></div>
            </div>
        </div>
        <div class="form-group displayStrategy">
            <label for="displayStrategy" class="col-sm-2 control-label"><spring:message code="app-launcher.displayStrategy"/></label>
            <div class="col-sm-10">
                <select class="form-control" name="displayStrategy" id="displayStrategy">
                    <c:forEach items="${availableDisplayStrategies}" var="strategy">
                        <c:set var="selectedAttribute" value="${appDefinition.displayStrategy eq strategy.code ? ' selected=\"true\"' : ''}"/>
                        <option<c:out value="${selectedAttribute}"/> value="${strategy.code}"><spring:message code="app-launcher.displayStrategy.${strategy.code}"/></option>
                    </c:forEach>
                </select>
                <div class="field-error bg-danger"><spring:message code="app-launcher.displayStrategy.invalid"/></div>
            </div>
        </div>
        <div class="form-group iconUrl">
            <label for="iconUrl" class="col-sm-2 control-label"><spring:message code="app-launcher.iconUrl"/></label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="iconUrl" id="iconUrl" value="${appDefinition.iconUrl}" placeholder="">
                <a id="upload" class="btn btn-link" style="display: none;" href="javascript:upAttachments.show(${n}.addAttachmentCallback);">Upload</a>
                <div class="field-error bg-danger"><spring:message code="app-launcher.iconUrl.invalid"/></div>
            </div>
        </div>
        <div class="form-group linkTitle">
            <label for="linkTitle" class="col-sm-2 control-label"><spring:message code="app-launcher.linkTitle"/></label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="linkTitle" id="linkTitle" value="${appDefinition.linkTitle}" placeholder="Launch this app">
                <div class="field-error bg-danger"><spring:message code="app-launcher.linkTitle.invalid"/></div>
            </div>
        </div>
        <div class="form-group title">
            <label for="title" class="col-sm-2 control-label"><spring:message code="app-launcher.title"/></label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="title" id="title" value="${appDefinition.title}" placeholder="Your Awesome App">
                <div class="field-error bg-danger"><spring:message code="app-launcher.title.invalid"/></div>
            </div>
        </div>
        <div class="form-group subtitle">
            <label for="subtitle" class="col-sm-2 control-label"><spring:message code="app-launcher.subtitle"/></label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="subtitle" id="subtitle" value="${appDefinition.subtitle}" placeholder="A few wrords about your app">
                <div class="field-error bg-danger"><spring:message code="app-launcher.subtitle.invalid"/></div>
            </div>
        </div>
        <div class="text-right">
            <button type="submit" class="btn btn-primary">Submit</button>
            <a href="<portlet:renderURL portletMode="view"/>" class="btn btn-link">Cancel</a>
        </div>
    </form>
</div>
