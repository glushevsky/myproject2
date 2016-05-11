<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="webprimer2._Default" %>
<%@ Register TagPrefix="mycontrol" TagName="ParameterControl" Src="~/ParameterControl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="mainhead" runat="server">
    <title>default page</title>
    <script type="text/javascript">
        function CheckChanges(event,num)
        {
            document.getElementById("postbutton").removeAttribute("disabled");

            var elem = document.getElementById(num).value;
            var enteredVal = String.fromCharCode(event.charCode);
            var position = event.target.selectionStart;
            var elem2 = elem.substring(0, position) + enteredVal + elem.substring(position,elem.length);
            //alert(elem2);

            var res1 = /^[0-9,-]{1}$/.test(elem2);
            var res2 = /^[1-9][0-9]{1,}$/.test(elem2);
            var res3 = /^-[1-9][0-9]{0,}$/.test(elem2);
            if (res1 == false && res2 == false && res3 == false) {
                //alert("aaaa");
                return false;
                //document.getElementById(num).value = elem.slice(0, -1);
            }
            if (document.getElementById(num).value.length != 1) {
                document.getElementById(num).removeAttribute("style");
            }
            if (Number(elem2)<-2147483648 || Number(elem2)>2147483647)
            {
                //alert(len(document.getElementById(num).value));
                //document.getElementById(num).value = elem.slice(0, event.target.selectionStart) + elem.slice(event.target.selectionStart, document.getElementById(num).value.length - 1);
                return false;

                document.getElementById(num).value = elem.slice(0, -1);
            }
            if(document.getElementById(num).getAttribute("data-flag") == "1")
            {
                document.getElementById(num).setAttribute("data-flag", "0");
                //alert(document.getElementById(num).value);
                if (isNaN(document.getElementById(num).value) == true)
                {
                    document.getElementById(num).value = document.getElementById(num).getAttribute("data-old");
                }
                document.getElementById(num).removeAttribute("data-old");
            }
            
        }
        function SignTest(event,num)
        {
            if (document.getElementById(num).value == "-")
            {
                document.getElementById(num).setAttribute("style", "border:2px dotted red");
                document.getElementById("postbutton").setAttribute("disabled", "disabled");
            }
            else
            {
                if (Number(document.getElementById(num).value) < -2147483648 || Number(document.getElementById(num).value) > 2147483647) {
                    document.getElementById(num).setAttribute("style", "border:2px dotted red");
                    document.getElementById("postbutton").setAttribute("disabled", "disabled");

                }
                else {
                    document.getElementById(num).removeAttribute("style");
                    document.getElementById("postbutton").removeAttribute("disabled");

                }
            }
        }
        function PasteFunction(event,num)
        {

            var elem = document.getElementById(num).value;
            var position = event.target.selectionStart;
            var pastedata = event.clipboardData.getData("text/plain");
            var elem2 = elem.substring(0, position) + pastedata + elem.substring(position, elem.length);

            var res1 = /^[0-9,-]{1}$/.test(elem2);
            var res2 = /^[1-9][0-9]{1,}$/.test(elem2);
            var res3 = /^-[1-9][0-9]{0,}$/.test(elem2);
            if (res1 == false && res2 == false && res3 == false) {
                return false;
            }
            if (document.getElementById(num).value.length != 1) {
                document.getElementById(num).removeAttribute("style");
            }
            if (Number(elem2) < -2147483648 || Number(elem2) > 2147483647) {
                return false;

                document.getElementById(num).value = elem.slice(0, -1);
            }

            var olddata = document.getElementById(num).value;
            document.getElementById(num).setAttribute("data-flag", "1");
            document.getElementById(num).setAttribute("data-old", olddata);
            //return false;
        }
        function AddBlock()
        {
            var new_name = document.getElementById("add_block_name").value;
            var new_desc = document.getElementById("add_block_description").value;
            var new_type = document.getElementById("add_block_type").value;

            var p = document.getElementById("form1");
            var h3 = document.createElement("h3");
            h3.innerText = new_name;
            var h5 = document.createElement("h5");
            h5.innerText = new_desc;
            var lbl = document.createElement("label");
            lbl.style = "color:#970c0c";
            lbl.innerHTML = new_type + "<br/>";
            var new_input = document.createElement("input");

            var all_div = document.getElementById("form1").getElementsByTagName("div");
            var new_div_id = "0" + String(Number(all_div[all_div.length - 1].getAttribute("id").split("_")[0].substring(3)) + 1);

            if (new_type == "System.String") {
                new_input.id = "ctl" + new_div_id + "$TextInput";
                new_input.type = "text";
                new_input.maxLength = "8";
            }
            if (new_type == "System.Integer") {
                new_input.id = "ctl" + new_div_id+"$NumInput";
                new_input.type = "text";
                new_input.setAttribute("minvalue", "-2147483648");
                new_input.setAttribute("maxvalue", "-2147483647");
                new_input.setAttribute("onblur", "SignTest(id);");
                new_input.setAttribute("onpaste", "PasteFunction(id);");
                new_input.setAttribute("data-flag", "0");
            }
            if (new_type == "System.Boolean") {
                new_input.id = "ctl" + new_div_id+"$CheckInput";
                new_input.type = "checkbox";
            }

            h3.setAttribute("runat", "server");
            h5.setAttribute("runat", "server");
            lbl.setAttribute("runat", "server");
            new_input.setAttribute("runat", "server");

            var div = document.createElement("div");
            div.setAttribute("runat", "server");
            
            div.id = "ctl" + new_div_id + "_paramElement";
            h3.id = "ctl" + new_div_id + "_NameLabel";
            h5.id = "ctl" + new_div_id + "_DescriptionLabel";
            lbl.id = "ctl" + new_div_id + "_HiddenLabel";
            div.style = "background-color:#a4b6bb";

            div.appendChild(h3);
            div.appendChild(h5);
            div.appendChild(lbl);
            div.appendChild(new_input);
            p.appendChild(div);

        }
       /* function CheckType()
        {
            var elems = document.getElementsByTagName("input");
            for (var i=0;i<elems.length;i++)
            {
                var elemId = elems[i].getAttribute("id");
                if (elemId.indexOf("NumInput") != -1)
                {
                    var str = elems[i].getAttribute("value");
                    if (isNumeric(str) == true)
                    {
                        if (isInteger(Number(str)) != true)
                        {
                            alert("Ошибка! Значение в поле с id= " + elemId + " не является целочисленным!");
                        }
                    }
                    else
                        alert ("Ошибка! Значение в поле с id= "+elemId+" не является числовым!");
                }
            }
        }
        function isNumeric(n) {
            return !isNaN(parseFloat(n)) && isFinite(n);
        }
        function isInteger(n) {
            return (n ^ 0) === n;
        }
        function ChangeMonitor(id)
        {

            var thisElem = document.getElementById(id);
            var parentDiv = document.getElementById(thisElem.parentNode.id);
            var lbl = parentDiv.getElementsByTagName("label")[0];
            thisElem.removeAttribute("style");
            //lbl.removeAttribute("innerText");\
            //lbl.innerText.c
            //lbl.innerText = " ";
            if (isNumeric(thisElem.value) != true)
            {
                thisElem.setAttribute("style", "border: 2px dotted red;")
                //thisElem.value = "";
               // lbl.setAttribute("innerText", "Не число!");
                //lbl.innerText = "Не число!";
             }
            else
            {
                var tmpstr = thisElem.value.trim();
                thisElem.value = tmpstr;
               if(tmpstr[0] == 0)
               {
                   if (tmpstr.length > 1)
                       thisElem.setAttribute("style", "border: 2px dotted red;");
*/
 /*              }
               else
               {
                   if (tmpstr[0] == "-" && tmpstr[1]==0)
                       thisElem.setAttribute("style", "border: 2px dotted red;");

               }
               var num = Number(thisElem.value);
               if (num>1000 || num<-1000)
                   thisElem.setAttribute("style", "border: 2px dotted red;");*/
               //thisElem.value.substring(0, thisElem.value.length-1);
                   //lbl.innerText = "Выход за диапазон!";
/*            }
        }*/
       
    </script>
</head>
<body style="background-color:#32373d">
    <p>DEFAULT PAGE</p>
    <form id="form1" runat="server">
        <asp:Button id="postbutton" Text="Сохранение" OnClick="Saving_Click" runat="server" />
    </form>
    <br />
    <input type="text" id="add_block_name" />
    <input type="text" id="add_block_description" />
    <select id="add_block_type">
        <option value="System.String">System.String</option>
        <option value="System.Integer">System.Integer</option>
        <option value="System.Boolean">System.Boolean</option>
    </select>
    <input type="submit" id="add_new_block" onclick="AddBlock();" value="Добавить" />
</body>
</html>
