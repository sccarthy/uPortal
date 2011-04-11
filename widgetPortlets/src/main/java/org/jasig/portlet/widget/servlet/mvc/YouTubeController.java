/**
 * Licensed to Jasig under one or more contributor license
 * agreements. See the NOTICE file distributed with this work
 * for additional information regarding copyright ownership.
 * Jasig licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file
 * except in compliance with the License. You may obtain a
 * copy of the License at:
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on
 * an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package org.jasig.portlet.widget.servlet.mvc;

import java.util.Collections;

import org.jasig.web.view.mvc.ProxyView;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author Jen Bourey
 * @version $Revision$
 */
@Controller
@RequestMapping("/ajax/youtube")
public class YouTubeController {

    @RequestMapping
    public ModelAndView getFeed(@RequestParam("user") String user) {
        String url = "http://gdata.youtube.com/feeds/api/videos?author=" + user + "&v=2&alt=jsonc";
        return new ModelAndView("proxyView", Collections.singletonMap(ProxyView.URL, url));
    }
}
