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
		<Item Name="controls" Type="Folder">
			<Item Name="SN Data.ctl" Type="VI" URL="../controls/SN Data.ctl"/>
			<Item Name="SN_device_type.ctl" Type="VI" URL="../controls/SN_device_type.ctl"/>
			<Item Name="SN_device_type_out.ctl" Type="VI" URL="../controls/SN_device_type_out.ctl"/>
			<Item Name="SN_length.ctl" Type="VI" URL="../controls/SN_length.ctl"/>
			<Item Name="SN_parse_mode.ctl" Type="VI" URL="../controls/SN_parse_mode.ctl"/>
		</Item>
		<Item Name="dependencies" Type="Folder">
			<Item Name="error VIs" Type="Folder">
				<Item Name="error 5100.vi" Type="VI" URL="../dependencies/error VIs/error 5100.vi"/>
				<Item Name="error 5101.vi" Type="VI" URL="../dependencies/error VIs/error 5101.vi"/>
				<Item Name="error 5102.vi" Type="VI" URL="../dependencies/error VIs/error 5102.vi"/>
				<Item Name="error 5103.vi" Type="VI" URL="../dependencies/error VIs/error 5103.vi"/>
				<Item Name="error 5104.vi" Type="VI" URL="../dependencies/error VIs/error 5104.vi"/>
				<Item Name="error 5105.vi" Type="VI" URL="../dependencies/error VIs/error 5105.vi"/>
				<Item Name="error 5106.vi" Type="VI" URL="../dependencies/error VIs/error 5106.vi"/>
			</Item>
			<Item Name="auto_regex.vi" Type="VI" URL="../dependencies/auto_regex.vi"/>
			<Item Name="check_empty_SN.vi.vi" Type="VI" URL="../dependencies/check_empty_SN.vi.vi"/>
			<Item Name="eval_length_based.vi" Type="VI" URL="../dependencies/eval_length_based.vi"/>
			<Item Name="eval_regex_based.vi" Type="VI" URL="../dependencies/eval_regex_based.vi"/>
		</Item>
		<Item Name="API Config Files Management.lvlib" Type="Library" URL="../libraries/API-Config-Files-Management/API Config Files Management.lvlib"/>
		<Item Name="Error Wrapper.lvlib" Type="Library" URL="../libraries/Error Wrapper/Error Wrapper.lvlib"/>
		<Item Name="Ev Queued SM API.lvlib" Type="Library" URL="../libraries/EV QSM support/Ev Queued SM API.lvlib"/>
		<Item Name="SN cases.txt" Type="Document" URL="../SN cases.txt"/>
		<Item Name="SN_parser.vi" Type="VI" URL="../SN_parser.vi"/>
		<Item Name="SN_Patterns.ini" Type="Document" URL="../SN_Patterns.ini"/>
		<Item Name="Use case.vi" Type="VI" URL="../Use case.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="8.6CompatibleGlobalVar.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/config.llb/8.6CompatibleGlobalVar.vi"/>
				<Item Name="Application Directory.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Application Directory.vi"/>
				<Item Name="Check if File or Folder Exists.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Check if File or Folder Exists.vi"/>
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
				<Item Name="NI_LVConfig.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/config.llb/NI_LVConfig.lvlib"/>
				<Item Name="NI_PackedLibraryUtility.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/LVLibp/NI_PackedLibraryUtility.lvlib"/>
				<Item Name="Space Constant.vi" Type="VI" URL="/&lt;vilib&gt;/dlg_ctls.llb/Space Constant.vi"/>
				<Item Name="Trim Whitespace One-Sided.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace One-Sided.vi"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
			</Item>
			<Item Name="wrap error metadata mini.vi" Type="VI" URL="../libraries/Error Wrapper/wrap error metadata mini.vi"/>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
