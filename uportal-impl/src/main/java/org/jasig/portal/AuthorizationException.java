/**
 * Copyright (c) 2000-2009, Jasig, Inc.
 * See license distributed with this file and available online at
 * https://www.ja-sig.org/svn/jasig-parent/tags/rel-10/license-header.txt
 */
package org.jasig.portal;

/**
 * This exception informs uPortal that an authorization violation has occured 
 * within a channel.
 * @author Peter Kharchenko
 * @version $Revision$ $Date$
 */

public class AuthorizationException extends PortalException {
    private static final long serialVersionUID = 1L;

    /**
     * Instantiate an AuthorizationException with the given cause.
     * @param cause defines the causing Throwable of the authorization violation.
     */
    public AuthorizationException(Throwable cause) {
        super(cause);
    }

    /**
     * Instantiate an AuthorizationException with the given explanatory message.
     * @param msg explains the nature of the attempted authorization violation.
     */
    public AuthorizationException(String msg) {
        super(msg);
    }

    /**
     * Instantiate an AuthorizationException with an explanatory message and
     * an underlying Throwable cause.
     * @param msg explains the nature of the attempted authorization violation.
     * @param cause - an underlying cause of this Exception.
     */
    public AuthorizationException(String msg, Throwable cause) {
        super(msg, cause);
    }

    /**
     * Instantiate an AuthorizationException with an explanatory message and
     * indicating whether channel refresh and channel reinstantiation are
     * appropriate responses.
     * @param msg - explanatory message
     * @param refresh - true if refresh is appropriate response
     * @param reinstantiate - true if reinstantiate is appropriate response
     */
    public AuthorizationException(String msg, 
            boolean refresh, boolean reinstantiate) {
        super(msg, refresh, reinstantiate);
    }

}