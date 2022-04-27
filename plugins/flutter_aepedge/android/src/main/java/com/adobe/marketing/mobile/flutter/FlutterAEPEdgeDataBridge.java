/*
Copyright 2022 Adobe. All rights reserved.
This file is licensed to you under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License. You may obtain a copy
of the License at http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under
the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR REPRESENTATIONS
OF ANY KIND, either express or implied. See the License for the specific language
governing permissions and limitations under the License.
*/

package com.adobe.marketing.mobile.flutter;

import com.adobe.marketing.mobile.EdgeEventHandle;
import com.adobe.marketing.mobile.ExperienceEvent;

import java.util.HashMap;
import java.util.Map;

public class FlutterAEPEdgeDataBridge {

    // Event Object Keys
    public final static String XDM_DATA_KEY = "xdmData";
    public final static String DATA_KEY = "data";
    public final static String DATASET_IDENTIFIER_KEY = "datasetIdentifier";
    public final static String TYPE_KEY = "type";
    public final static String PAYLOAD_KEY = "payload";

    /**
     * Converts a {@link Map} into an {@link Event}
     *
     * @param map
     * @return An {@link Event}
     */
    static ExperienceEvent eventFromMap(final Map map) {
        if (map == null) {
            return null;
        }

        Event event = new Event.Builder(
                getNullableString(map, XDM_DATA_KEY),
                getNullableString(map, DATA_KEY),
                getNullableString(map, DATASET_IDENTIFIER_KEY))
                .setEventData(getNullableMap(map, EVENT_DATA_KEY))
                .build();
        return event;
    }

    static Map mapFromEvent(final  event) {
        Map<String, Object> map = new HashMap<>();
        map.put(EVENT_NAME_KEY, event.getName());
        map.put(EVENT_TYPE_KEY, event.getType());
        map.put(EVENT_SOURCE_KEY, event.getSource());
        map.put(EVENT_DATA_KEY, event.getEventData());
        return map;
    }

    // Helper methods

    private static String getNullableString(final Map data, final String key) {
        return data.containsKey(key) && (data.get(key) instanceof String) ? (String) data.get(key) : null;
    }

    private static Map getNullableMap(final Map data, final String key) {
        return data.containsKey(key) && (data.get(key) instanceof Map) ? (Map) data.get(key) : null;
    }
}
