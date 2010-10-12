/* Copyright 2004 The JA-SIG Collaborative.  All rights reserved.
*  See license distributed with this file and
*  available online at http://www.uportal.org/license.html
*/

package org.jasig.portal.container.om.servlet;

import java.io.Serializable;

/**
 * Data structure to support WebApplicationDefinition for
 * marshalling and unmarshalling of web.xml.
 * Not needed by the Pluto container.
 * @author Ken Weiner, kweiner@unicon.net
 * @version $Revision$
 */
public class TagLibImpl implements Serializable {

    private String taglibUri;
    private String taglibLocation;
    
    public String getTaglibUri() {
        return taglibUri;
    }
    public String getTaglibLocation() {
        return taglibLocation;
    }

    public void setTaglibUri(String taglibUri) {
        this.taglibUri = taglibUri;
    }
    
    public void setTaglibLocation(String taglibLocation) {
        this.taglibLocation = taglibLocation;
    }

}