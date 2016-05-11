<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ParameterControl.ascx.cs" Inherits="webprimer2.ParameterControl" %>
    <!--<p>CONTROL</p>-->
   <div id="paramElement" runat="server" style="background-color:#a4b6bb">
        <h3 id="NameLabel" runat="server"></h3>
        <h5 id="DescriptionLabel" runat="server"></h5>
        <label id="HiddenLabel" runat="server" style="color:#970c0c"></label><br />
      <!-- <input id="Text1" type="submit" runat="server" onclick="test()" />-->
        <input id="TextInput" type="text" runat="server" visible="false" maxlength="8"/>
        <input id="NumInput" type="text" runat="server" minvalue="-2147483648" maxvalue="2147483647" visible="false" onkeypress="return CheckChanges(event,id);" onblur="SignTest(event,id);" onpaste="return PasteFunction(event,id);" data-flag="0"/>
        <input id="CheckInput" type="checkbox" runat="server" visible="false" />
     </div>
