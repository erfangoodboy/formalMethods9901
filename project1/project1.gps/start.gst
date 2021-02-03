<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<gxl xmlns="http://www.gupro.de/GXL/gxl-1.0.dtd">
    <graph role="graph" edgeids="false" edgemode="directed" id="start">
        <attr name="$version">
            <string>curly</string>
        </attr>
        <node id="n0">
            <attr name="layout">
                <string>272 216 104 72</string>
            </attr>
        </node>
        <node id="n2">
            <attr name="layout">
                <string>565 213 60 18</string>
            </attr>
        </node>
        <node id="n4">
            <attr name="layout">
                <string>559 332 65 18</string>
            </attr>
        </node>
        <node id="n1">
            <attr name="layout">
                <string>562 158 58 18</string>
            </attr>
        </node>
        <node id="n6">
            <attr name="layout">
                <string>74 309 68 18</string>
            </attr>
        </node>
        <node id="n5">
            <attr name="layout">
                <string>60 177 95 18</string>
            </attr>
        </node>
        <node id="n3">
            <attr name="layout">
                <string>562 270 63 18</string>
            </attr>
        </node>
        <edge from="n0" to="n0">
            <attr name="label">
                <string>let:status = "inactive"</string>
            </attr>
        </edge>
        <edge from="n0" to="n0">
            <attr name="label">
                <string>let:speed = 47</string>
            </attr>
        </edge>
        <edge from="n0" to="n0">
            <attr name="label">
                <string>let:saved_speed = 0</string>
            </attr>
        </edge>
        <edge from="n0" to="n0">
            <attr name="label">
                <string>type:idle</string>
            </attr>
        </edge>
        <edge from="n2" to="n2">
            <attr name="label">
                <string>type:offButton</string>
            </attr>
        </edge>
        <edge from="n4" to="n4">
            <attr name="label">
                <string>type:RD_Button</string>
            </attr>
        </edge>
        <edge from="n1" to="n1">
            <attr name="label">
                <string>type:onButton</string>
            </attr>
        </edge>
        <edge from="n6" to="n6">
            <attr name="label">
                <string>type:brakePedal</string>
            </attr>
        </edge>
        <edge from="n5" to="n5">
            <attr name="label">
                <string>type:accelaratePedal</string>
            </attr>
        </edge>
        <edge from="n3" to="n3">
            <attr name="label">
                <string>type:SA_Button</string>
            </attr>
        </edge>
    </graph>
</gxl>
