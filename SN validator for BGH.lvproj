<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="24008000">
	<Property Name="NI.LV.All.SaveVersion" Type="Str">24.0</Property>
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="API Config Files Management.lvlib" Type="Library" URL="../libraries/API-Config-Files-Management/API Config Files Management.lvlib"/>
		<Item Name="Error Wrapper.lvlib" Type="Library" URL="../libraries/Wrapper Error API/Error Wrapper.lvlib"/>
		<Item Name="Ev Queued SM API.lvlib" Type="Library" URL="../libraries/EV QSM support/Ev Queued SM API.lvlib"/>
		<Item Name="SN cases.txt" Type="Document" URL="../SN cases.txt"/>
		<Item Name="SN Validator.lvlib" Type="Library" URL="../SN Validator/SN Validator.lvlib"/>
		<Item Name="SN_Patterns.ini" Type="Document" URL="../SN_Patterns.ini"/>
		<Item Name="Use case.vi" Type="VI" URL="../Use case.vi"/>
		<Item Name="Dependencies" Type="Dependencies"/>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
