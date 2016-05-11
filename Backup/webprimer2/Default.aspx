<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="webprimer2._Default" %>
<%@ Register TagPrefix="mycontrol" TagName="ParameterControl" Src="~/ParameterControl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <p>DEFAULT PAGE</p>
    <form id="form1" runat="server">
    <div id="paramElement" runat="server">
    </div>
    <mycontrol:ParameterControl ID="ParameterControl1" runat="server" />
    <br />
    <mycontrol:ParameterControl ID="ParameterControl2" runat="server" />
    <br />
    </form>
</body>
</html>
