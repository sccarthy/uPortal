/**
 * Copyright (c) 2000-2009, Jasig, Inc.
 * See license distributed with this file and available online at
 * https://www.ja-sig.org/svn/jasig-parent/tags/rel-10/license-header.txt
 */
package org.jasig.portal.channels.error.tt;

import org.jasig.portal.AuthorizationException;
import org.jasig.portal.channels.error.error2xml.AuthorizationExceptionToElement;
import org.jasig.portal.channels.error.error2xml.IThrowableToElement;

/**
 * Testcase for the AuthorizationExceptionToElement class.
 * @author andrew.petro@yale.edu
 * @version $Revision$ $Date$
 */
public final class AuthorizationExceptionToElementTest extends
        AbstractThrowableToElementTest {

    /**
     * Since the class is stateless, we only need one.
     */
    private AuthorizationExceptionToElement aeToElement 
        = new AuthorizationExceptionToElement();

    /* (non-Javadoc)
     * @see org.jasig.portal.channels.error.tt.AbstractThrowableToElementTest#getThrowableToElementInstance()
     */
    protected IThrowableToElement getThrowableToElementInstance() {
        return this.aeToElement;
    }

    /* (non-Javadoc)
     * @see org.jasig.portal.channels.error.tt.AbstractThrowableToElementTest#supportedThrowable()
     */
    protected Throwable supportedThrowable() {
        return new AuthorizationException("A message");
    }

    /* (non-Javadoc)
     * @see org.jasig.portal.channels.error.tt.AbstractThrowableToElementTest#unsupportedThrowable()
     */
    protected Throwable unsupportedThrowable() {
        return new Throwable("An unsupported throwable.");
    }

}